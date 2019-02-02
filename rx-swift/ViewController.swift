//
//  ViewController.swift
//  rx-swift
//
//  Created by Anirudha Mahale on 02/02/19.
//  Copyright © 2019 Anirudha Mahale. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var userViewModel = UserViewModel()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        userViewModel.username.asObservable().subscribe { print($0) }.disposed(by: bag)
        (email.rx.text <-> userViewModel.username).disposed(by: bag)
        
        userViewModel.message.asObserver()
        .bind(to: errorLabel.rx.text)
        .disposed(by: bag)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.userViewModel.username.onNext(nil)
        }
    }
    
    @IBAction func didTapSave(_ sender: Any) {
        // userViewModel.validate()
        userViewModel.entered()
    }
}
