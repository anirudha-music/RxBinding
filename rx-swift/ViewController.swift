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
        
        // Binding the textfield and datasource, If value from anyone of them is changed the same value will be reflected in the other one.
        (email.rx.text <-> userViewModel.username).disposed(by: bag)
        
        // populating the tableView using the datasource.
        userViewModel.names.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { row, element, cell in
            cell.textLabel?.text = element
            }.disposed(by: bag)
        
        // subscribes to tableView itemSelect topic to show it in the textFiel.
        tableView.rx.itemSelected.subscribe({ [weak self] indexPath in
            self?.userViewModel.selected(indexPath.element?.row ?? 0)
        }).disposed(by: bag)
        
        // just prints the previously selected row index
        tableView.rx.itemDeselected.subscribe({ indexPath in
            if indexPath.element != nil {
                print(indexPath.element!.row)
            }
        }).disposed(by: bag)
        
        // Subscribe to tableView delete event so to remove object from the datasource.
        tableView.rx.itemDeleted.subscribe({ [weak self] indexPath in
            if indexPath.element != nil {
                self?.userViewModel.deleted(indexPath.element!.row)
            }
        }).disposed(by: bag)
        
        // Hide the keyboard on every save button press.
        userViewModel.names.subscribe { [weak self] (_) in
            guard let `self` = self else { return }
            self.view.endEditing(true)
        }.disposed(by: bag)
        
        tableView.isEditing = true
    }
    
    @IBAction func didTapSave(_ sender: Any) {
        userViewModel.add()
    }
    
    @IBAction func didTapClear(_ sender: Any) {
        userViewModel.clear()
    }
}
