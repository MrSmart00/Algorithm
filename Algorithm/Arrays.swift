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

//    func oddOccurrence(_ A: [Int]) -> Int {
//        for key in Set(A) where A.filter({ $0 == key }).count % 2 != 0 {
//            return key
//        }
//        return 0
//    }
    func oddOccurrence(_ A: [Int]) -> Int {
        let sortList = A.sorted { $0 < $1 }
        let prefix = sortList.prefix(upTo: A.count / 2)
        let suffix: [Int] = sortList.suffix(from: A.count / 2).reversed()
        var combine = [Int]()
        for i in 0..<prefix.count {
            combine.append(prefix[i] + suffix[i])
        }
        combine = combine.sorted { $0 < $1 }
        var mismatch = 0
        if combine.first != combine[1] {
            mismatch = combine.first ?? 0
        } else if combine.last != combine[combine.count - 2] {
            mismatch = combine.last ?? 0
        } else {
            return suffix.last ?? 0
        }
        return mismatch - (suffix.last ?? 0)
    }

}
