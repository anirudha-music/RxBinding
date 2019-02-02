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
    @IBOutlet weak var tableView: UITableView!
    
    var userViewModel = UserViewModel()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        (email.rx.text <-> userViewModel.username).disposed(by: bag)
        
        userViewModel.names.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { row, element, cell in
            cell.textLabel?.text = element
            }.disposed(by: bag)
        
        tableView.rx.itemSelected.subscribe({ [weak self] indexPath in
            self?.userViewModel.selected(indexPath.element?.row ?? 0)
        }).disposed(by: bag)
        
        tableView.rx.itemDeselected.subscribe({ indexPath in
            if indexPath.element != nil {
                print(indexPath.element!.row)
            }
        }).disposed(by: bag)
    }
    
    @IBAction func didTapSave(_ sender: Any) {
        userViewModel.add()
    }
    
    @IBAction func didTapClear(_ sender: Any) {
        userViewModel.clear()
    }
}
