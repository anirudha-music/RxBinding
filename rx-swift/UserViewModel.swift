//
//  UserViewModel.swift
//  rx-swift
//
//  Created by Anirudha Mahale on 02/02/19.
//  Copyright © 2019 Anirudha Mahale. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class UserViewModel {
    let username = BehaviorRelay<String?>(value: nil)
    let names = BehaviorRelay<[String]>(value: [String]())
    
    func add() {
        if let name = username.value, name != "" {
            self.names.accept(self.names.value + [name])
        }
        username.accept(nil)
    }
    
    func clear() {
        names.accept([String]())
    }
    
    func selected(_ index: Int) {
        let name = names.value[index]
        username.accept(name)
    }
    
    func deleted(_ index: Int) {
        var dublicateNames = names.value
        dublicateNames.remove(at: index)
        names.accept(dublicateNames)
    }
}

class Users {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
}
