//
//  Iterations.swift
//  Algorithm
//
//  Created by HINOMORI HIROYA on 2018/10/24.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Iterations {
    func binaryBap(_ number: Int) -> Int {
        let gaps = String(number, radix: 2).components(separatedBy: "1").dropLast().filter { !$0.isEmpty }.sorted { $0 > $1 }
        return gaps.first?.characters.count ?? 0
    }
}
