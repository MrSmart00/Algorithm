//
//  Algorithm.swift
//  Algorithm
//
//  Created by HINOMORI HIROYA on 2018/10/23.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import Foundation

class Algorithm {

    func missingElementLiner(_ A: [Int]) -> Int {
        let sortList = A.sorted { $0 < $1 }
        guard sortList.first == 1 else { return 1 }
        guard sortList.last != sortList.count else { return sortList.count + 1 }
        for (index, element) in sortList.enumerated() {
            if index + 1 != element {
                return index + 1
            }
        }
        return 1
    }

    func missingElementBinarySearch(_ A: [Int]) -> Int {
        let sortList = A.sorted { $0 < $1 }
        guard sortList.first == 1 else { return 1 }
        guard sortList.last != sortList.count else { return sortList.count + 1 }
        var index = sortList.count / 2
        var splitList = ArraySlice(sortList)
        repeat {
            let leftList = splitList.prefix(upTo: index)
            let rightList = splitList.suffix(from: index)
            let leftGap = findGap(in: leftList, offset: index - leftList.count)
            let rightGap = findGap(in: rightList, offset: index)
            if leftGap.hasGap {
                index = max(0, index - leftList.count)
                splitList = leftList
            } else if rightGap.hasGap {
                index += rightList.count / 2
                splitList = rightList
            } else if leftGap.correct != rightGap.correct {
                splitList = ArraySlice<Int>([rightList.first ?? 0])
            }
        } while splitList.count > 1
        return index + 1
    }

    func findGap(in A: ArraySlice<Int>, offset: Int) -> (hasGap: Bool, correct: Bool) {
        let first = A.first == offset + 1
        let last = A.last == offset + A.count
        return (first != last || (A.count == 1 && !first && !last), first && last)
    }

    func frogJump(_ x: Int, _ y: Int, _ d: Int) -> Int {
        return Int(ceilf(Float(y - x) / Float(d)))
    }

    func tapeEquilibriumLiner(_ A: [Int]) -> Int {
        var result = Int.max
        let sumReduce: ((Int, Int) -> Int) = { $0 + $1 }
        for i in 1..<A.count {
            let slicedPrefix = A.prefix(upTo: i)
            let slicedSuffix = A.suffix(from: i)
            let delta = abs(slicedPrefix.reduce(0, sumReduce) - slicedSuffix.reduce(0, sumReduce))
            result = min(result, delta)
        }
        return result
    }

//    func tapeEquilibriumBinarySearch(_ A: [Int]) -> Int {
//        var result = Int.max
//        var diff = Int.max
//        var offset = A.count / 2
//        repeat {
//            result = abs(diff)
//            diff = delta(at: A, offset: offset)
//            if diff > 0 {
//                offset -= offset / 2
//            } else {
//                offset += offset / 2
//            }
//        } while abs(diff) < result
//        return result
//    }
//
//    func delta(at A: [Int], offset: Int) -> Int {
//        let sumReduce: ((Int, Int) -> Int) = { $0 + $1 }
//        let slicedPrefix = A.prefix(upTo: offset)
//        let slicedSuffix = A.suffix(from: offset)
//        return slicedPrefix.reduce(0, sumReduce) - slicedSuffix.reduce(0, sumReduce)
//    }

//    func tapeEquilibriumBinarySearch(_ A: [Int]) -> Int {
//        var result = Int.max
//        var diff = Int.max
//        var offset = A.count / 2
//        repeat {
//            result = abs(diff)
//            diff = delta(at: A, offset: offset)
//            let leftDirection = max(0, offset - offset / 2)
//            let rightDirection = min(A.count - 1, offset + offset / 2)
//            offset = abs(delta(at: A, offset: leftDirection)) < abs(delta(at: A, offset: rightDirection)) ? leftDirection : rightDirection
//        } while abs(diff) < result
//        return result
//    }
//
//    func delta(at A: [Int], offset: Int) -> Int {
//        let sumReduce: ((Int, Int) -> Int) = { $0 + $1 }
//        let slicedPrefix = A.prefix(upTo: offset)
//        let slicedSuffix = A.suffix(from: offset)
//        return slicedPrefix.reduce(0, sumReduce) - slicedSuffix.reduce(0, sumReduce)
//    }

    struct Result {
        var value: Int
        var equilibrium: Bool
    }
    
    func tapeEquilibriumBinarySearch(_ A: [Int]) -> Int {
        var result = Int.max
        var diff = Int.max
        var offset = A.count / 2
        repeat {
            result = abs(diff)
            let deltaResult = delta(at: A, offset: offset)
            diff = deltaResult.value
            if deltaResult.equilibrium {
                let leftDirection = max(0, offset - offset / 2)
                let rightDirection = min(A.count - 1, offset + offset / 2)
                offset = abs(delta(at: A, offset: leftDirection).value) < abs(delta(at: A, offset: rightDirection).value) ? leftDirection : rightDirection
            } else if diff > 0 {
                offset -= offset / 2
            } else {
                offset += offset / 2
            }
        } while abs(diff) < result
        return result
    }

    func delta(at A: [Int], offset: Int) -> Result {
        let sumReduce: ((Int, Int) -> Int) = { $0 + $1 }
        let slicedPrefix = A.prefix(upTo: offset)
        let slicedSuffix = A.suffix(from: offset)
        let prefixSum = slicedPrefix.reduce(0, sumReduce)
        let suffixSum = slicedSuffix.reduce(0, sumReduce)
        return Result(value: prefixSum - suffixSum, equilibrium: abs(prefixSum) == abs(suffixSum))
    }

}
