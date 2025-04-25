//
//  Item.swift
//  CatAppMVVM
//
//  Created by user260574 on 4/25/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
