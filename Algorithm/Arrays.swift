//
//  Arrays.swift
//  Algorithm
//
//  Created by HINOMORI HIROYA on 2018/10/24.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Arrays {
    func cyclicRotation(_ A: [Int], _ K: Int) -> [Int] {
        guard !A.isEmpty else { return A }
        var list = A
        let index = K % A.count
        for _ in 0..<index {
            guard let last = list.last else { return list }
            list.insert(last, at: 0)
            list.removeLast()
        }
        return list
    }

    func oddOccurrence(_ A: [Int]) -> Int {
        for key in Set(A) where A.filter({ $0 == key }).count % 2 != 0 {
            return key
        }
        return 0
    }
}
