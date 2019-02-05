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
import RxDataSources

class ViewController: BaseRxViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var clearButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var userViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfCustomData>(
            configureCell: { dataSource, tableView, indexPath, item in
                if indexPath.section == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                    cell.textLabel?.text = "Item \(item.anInt): \(item.aString) - \(item.aCGPoint.x):\(item.aCGPoint.y)"
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "red", for: indexPath)
                    cell.textLabel?.text = "Item \(indexPath.row)"
                    return cell
                }

        })
        
        let sections = [
            SectionOfCustomData(header: "First section", items: [CustomData(anInt: 0, aString: "zero", aCGPoint: CGPoint.zero), CustomData(anInt: 1, aString: "one", aCGPoint: CGPoint(x: 1, y: 1)) ]),
            SectionOfCustomData(header: "Second section", items: [CustomData(anInt: 2, aString: "two", aCGPoint: CGPoint(x: 2, y: 2)), ])
        ]
        
        Observable.just(sections)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        
        
    }
}
