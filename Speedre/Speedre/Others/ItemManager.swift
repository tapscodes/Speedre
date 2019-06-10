//
//  ItemManager.swift
//  Speedre
//
//  Created by spatsch on 6/9/19.
//  Copyright © 2019 TAPS. All rights reserved.
//

import Foundation

class ItemManager {
    //initializes item by setting it to a random item
    init() {
        newItem()
    }
    // define possible items here, kept it short for running without camera
    var itempool: [String] = [
    "flower",
    "dog",
    "leaf",
    "cat"]
    //shuffles item array and returns first element
    func newItem() -> String {
        itempool.shuffle()
        return itempool[0]
    }
    func currItem() -> String {
        return itempool[0]
    }
}