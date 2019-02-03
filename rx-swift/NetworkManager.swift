//
//  NetworkManager.swift
//  rx-swift
//
//  Created by Anirudha Mahale on 03/02/19.
//  Copyright © 2019 Anirudha Mahale. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    func request(_ url: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, headers: HTTPHeaders? = nil) -> DataRequest {
            return Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding(destination: .methodDependent), headers: headers)
    }
}
