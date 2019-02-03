//
//  UserNetworkManager.swift
//  rx-swift
//
//  Created by Anirudha Mahale on 03/02/19.
//  Copyright © 2019 Anirudha Mahale. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class UserNetworkManager: NetworkManager {
    func getUser() -> Observable<Data?> {
        return Observable.create({ (observable) -> Disposable in
            let requestRef = self.request("https://httpbin.org/json", method: .get, parameters: nil, encoding: URLEncoding(destination: .methodDependent), headers: nil)
            
                .responseJSON(completionHandler: { (resp) in
                    if resp.response?.statusCode == 200 {
                        observable.onNext(resp.data)
                        observable.onCompleted()
                    } else {
                        let error = NSError(domain: "", code: resp.response?.statusCode ?? 500, userInfo: nil)
                        observable.onError(error)
                    }
                })
            
            return Disposables.create(with: {
                requestRef.cancel()
            })
        })
    }
}
