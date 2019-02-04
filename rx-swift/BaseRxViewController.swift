//
//  BaseRxViewController.swift
//  rx-swift
//
//  Created by Anirudha Mahale on 04/02/19.
//  Copyright © 2019 Anirudha Mahale. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseRxViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    func bind(_ view: UITextField, to observable: BehaviorRelay<String?>) {
        view.rx.text
            .orEmpty
            .bind(to: observable)
            .disposed(by: disposeBag)
    }
    
    func bind(_ view: UITextField, to observable: PublishRelay<String?>) {
        view.rx.text
            .orEmpty
            .bind(to: observable)
            .disposed(by: disposeBag)
    }
    
    func bind(_ view: UITextView, to observable: BehaviorRelay<String?>) {
        view.rx.text
            .orEmpty
            .bind(to: observable)
            .disposed(by: disposeBag)
    }
    
    func bind(_ view: UITextView, to observable: PublishRelay<String?>) {
        view.rx.text
            .orEmpty
            .bind(to: observable)
            .disposed(by: disposeBag)
    }
    
    func tap(_ view: UIButton, completion: @escaping ()->()) {
        view.rx.tap.bind {
            completion()
        }.disposed(by: disposeBag)
    }
    
    func tap(_ view: UIBarButtonItem, completion: @escaping ()->()) {
        view.rx.tap.bind {
            completion()
            }.disposed(by: disposeBag)
    }
}
