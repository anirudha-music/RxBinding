//
//  struct.swift
//  rx-swift
//
//  Created by Anirudha Mahale on 05/02/19.
//  Copyright © 2019 Anirudha Mahale. All rights reserved.
//

import Foundation
import RxDataSources

struct SectionOfCustomData {
    var header: String
    var items: [Item]
}
extension SectionOfCustomData: SectionModelType {
    typealias Item = CustomData
    
    init(original: SectionOfCustomData, items: [Item]) {
        self = original
        self.items = items
    }
}

struct CustomData {
    var anInt: Int
    var aString: String
    var aCGPoint: CGPoint
}
