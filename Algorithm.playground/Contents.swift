import UIKit
import XCTest

let isEven: ((Int) -> Bool) = { $0 % 2 == 0 }
let toString: ((Int) -> String) = { "\($0)" }
let sumReduce: ((Int, Int) -> Int) = { $0 + $1 }
let ascending: ((Int, Int) -> Bool) = { $0 < $1 }

let list = [2, 4, 6, 1, 3, 8]

let prefix = list.prefix(while: isEven)
let suffix = list.drop(while: isEven)
let filter = list.filter(isEven)
let map = list.map(toString)
let reduce = list.reduce(0, sumReduce)
let sort = list.sorted(by: ascending)

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

XCTAssertEqual(missingElementLiner([2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 1]), 14)

func missingElementBinarySearch(_ A: [Int]) -> Int {
    let sortList = A.sorted { $0 < $1 }
    guard sortList.first == 1 else { return 1 }
    guard sortList.last != sortList.count else { return sortList.count + 1 }
    var index = sortList.count / 2
    var splitList = ArraySlice(sortList)
    repeat {
        let list = splitList.suffix(from: index)
        if (findGap(in: list, offset: index)) {
            index += list.count / 2
            splitList = list
        } else {
            index = max(0, index - list.count)
            splitList = splitList.prefix(upTo: index + list.count)
        }
    } while splitList.count > 1
    return index + 1
}

func findGap(in A: ArraySlice<Int>, offset: Int) -> Bool {
    let first = A.first == offset + 1
    let last = A.last == offset + A.count
    return first != last || (A.count == 1 && !first && !last)
}

XCTAssertEqual(missingElementBinarySearch([2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 1]), 14)

func frogJump(_ x: Int, _ y: Int, _ d: Int) -> Int {
    return Int(ceilf(Float(y - x) / Float(d)))
}
XCTAssertEqual(frogJump(30, 110, 30), 3)


func tapeEquilibriumLiner(_ A: [Int]) -> Int {
    var result = NSIntegerMax
    let sumReduce: ((Int, Int) -> Int) = { $0 + $1 }
    for i in 1..<A.count {
        let slicedPrefix = A.prefix(upTo: i)
        let slicedSuffix = A.suffix(from: i)
        let delta = abs(slicedPrefix.reduce(0, sumReduce) - slicedSuffix.reduce(0, sumReduce))
        result = min(result, delta)
    }
    return result
}
XCTAssertEqual(tapeEquilibriumLiner([30, 1, 2, 4, 3]), 20)

func tapeEquilibriumBinarySearch(_ A: [Int]) -> Int {
    var result = NSIntegerMax
    var diff = NSIntegerMax
    var offset = A.count / 2
    repeat {
        result = abs(diff)
        diff = delta(at: A, offset: offset)
        if diff > 0 {
            offset -= offset / 2
        } else {
            offset += offset / 2
        }
    } while abs(diff) < result
    return result
}

func delta(at A: [Int], offset: Int) -> Int {
    let sumReduce: ((Int, Int) -> Int) = { $0 + $1 }
    let slicedPrefix = A.prefix(upTo: offset)
    let slicedSuffix = A.suffix(from: offset)
    return slicedPrefix.reduce(0, sumReduce) - slicedSuffix.reduce(0, sumReduce)
}
XCTAssertEqual(tapeEquilibriumBinarySearch([30, 1, 2, 4, 3]), 20)
XCTAssertEqual(tapeEquilibriumBinarySearch([1, 2, 4, 3]), 4)
XCTAssertEqual(tapeEquilibriumBinarySearch([-1000, 50, 1000]), 2050)
