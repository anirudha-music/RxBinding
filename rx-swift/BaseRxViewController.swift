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
    
    // UITextField Bind
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
    
    func bind(_ view: UITextField, to observable: PublishSubject<String?>) {
        view.rx.text
            .orEmpty
            .bind(to: observable)
            .disposed(by: disposeBag)
    }
    
    func bind(_ view: UITextField, to observable: BehaviorSubject<String?>) {
        view.rx.text
            .orEmpty
            .bind(to: observable)
            .disposed(by: disposeBag)
    }
    
    func bind(_ view: UITextField, to observable: ReplaySubject<String?>) {
        view.rx.text
            .orEmpty
            .bind(to: observable)
            .disposed(by: disposeBag)
    }
    
    // UITextView Bind
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
    
    func bind(_ view: UITextView, to observable: PublishSubject<String?>) {
        view.rx.text
            .orEmpty
            .bind(to: observable)
            .disposed(by: disposeBag)
    }
    
    func bind(_ view: UITextView, to observable: BehaviorSubject<String?>) {
        view.rx.text
            .orEmpty
            .bind(to: observable)
            .disposed(by: disposeBag)
    }
    
    func bind(_ view: UITextView, to observable: ReplaySubject<String?>) {
        view.rx.text
            .orEmpty
            .bind(to: observable)
            .disposed(by: disposeBag)
    }
    
    // UIButton tap 
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
