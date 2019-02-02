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

infix operator <->

@discardableResult func <-><T>(property: ControlProperty<T>, variable: BehaviorSubject<T>) -> Disposable {
    let variableToProperty = variable.asObservable()
        .bind(to: property)
    
    let propertyToVariable = property
        .subscribe(
            onNext: { variable.onNext($0) },
            onError: { variable.onError($0) },
            onCompleted: { variableToProperty.dispose() }
    )
    
    return Disposables.create(variableToProperty, propertyToVariable)
}

class UserViewModel {
    let username = BehaviorSubject<String?>(value: "")
    let message = BehaviorSubject<String?>(value: "")
    
    func validate() {
        message.asObserver().onNext("Failed to login!!")
    }
    
    func entered() {
        do {
            message.asObserver().onNext(try username.asObserver().value())
        } catch {
            message.asObserver().onNext(nil)
        }
        username.asObserver().onNext(nil)
    }
}
