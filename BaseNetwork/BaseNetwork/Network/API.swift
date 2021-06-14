//
//  API.swift
//  BaseNetwork
//
//  Created by Sonnv on 14/06/2021.
//

import Foundation
import Alamofire
import RxSwift

class API<T> {
    func request() -> Observable<T> {
        return Observable<T>.create { observer in
            self.request(observer: observer)
            return Disposables.create {
            }
        }
    }

    private func request(observer: AnyObserver<T>) {
        let request = AF.request(self.requestUrl(), method: self.method(), parameters: self.params(), encoding: self.encoding(), headers: self.headers()).responseJSON { response in
                switch response.result {
                case .success(let val):
                    if(response.response!.statusCode < 400) {
                        if let T = try? self.convertJson(val) {
                            observer.onNext(T)
                        }
                        observer.onCompleted()
                    } else {
                        let result = ApiErrorResult(val)
                        let url = response.request!.url!.absoluteString
                        let method = response.request!.httpMethod!
                        let status = response.response!.statusCode
                        let error = ApiError(error: result, url: url, method: method, status: status)
                        observer.onError(error)
                    }
                case .failure(let error):
                    if response.response?.statusCode == 502 {
                        observer.onError(error)
                    }

                    // In case response body is empty in POST method, and statusCode is 200 then let obvervable be onCompleted
                    if (error as NSError).code == 4 && response.response!.statusCode == 200 {
                        observer.onCompleted()
                    } else {
                        observer.onError(error)
                    }
                }
        }

        print("API REQUEST:\n" + request.description)
    }

    func convertJson(_ val: Any) throws -> T {
        throw NSError()
    }
    
    func requestUrl() -> String {
        var apiEndPoint = path()
        if apiEndPoint.hasPrefix("/") {
            apiEndPoint.removeFirst()
        }
        return baseUrl() + apiEndPoint
    }

    func baseUrl() -> String {
        return ApiUrls.apiBaseUrl()
    }

    func path() -> String {
        fatalError("abstract method")
    }

    func method() -> Alamofire.HTTPMethod {
        return .get
    }

    func params() -> Parameters {
        return [:]
    }

    func encoding() -> Alamofire.ParameterEncoding {
        return URLEncoding.default
    }

    func headers() -> Alamofire.HTTPHeaders {
//        DDLogDebug("self.headers:" + Global.shared.accessToken)
        return [
//            "Authorization": "Bearer " + Global.shared.accessToken
        ]
    }
}
