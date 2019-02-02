//
//  RxBind.swift
//  rx-swift
//
//  Created by Anirudha Mahale on 02/02/19.
//  Copyright © 2019 Anirudha Mahale. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

infix operator <->

@discardableResult func <-><T>(property: ControlProperty<T>, variable: BehaviorRelay<T>) -> Disposable {
    let variableToProperty = variable.asObservable()
        .bind(to: property)
    
    let propertyToVariable = property
        .subscribe(
            onNext: { variable.accept($0) },
            onCompleted: { variableToProperty.dispose() }
    )
    
    return Disposables.create(variableToProperty, propertyToVariable)
}

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
