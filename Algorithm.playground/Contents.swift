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

func simpleSearch(_ A: [Int]) -> Int {
    let sortList = A.sorted { $0 < $1 }
    for (index, element) in sortList.enumerated() {
        if index + 1 != element {
            return index + 1
        }
    }
    return 1
}

func binarySearch(_ A: [Int]) -> Int {
    let sortList = A.sorted { $0 < $1 }
    guard sortList.first == 1 else { return 1 }
    guard sortList.last != sortList.count else { return sortList.count + 1 }
    var index = sortList.count / 2
    var splitList = ArraySlice(sortList)
    repeat {
        let list = splitList.suffix(from: index)
        let first = list.first == index + 1
        let last = list.last == index + list.count
        if (first != last || (list.count == 1 && !first && !last)) {
            index += list.count / 2
            splitList = list
        } else {
            index -= list.count
            index = max(0, index)
            splitList = splitList.prefix(upTo: index + list.count)
        }
    } while splitList.count != 1
    return index + 1
}

simpleSearch([])
simpleSearch([3])
simpleSearch([2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 1])

XCTAssertEqual(binarySearch([]), 1)
XCTAssertEqual(binarySearch([3]), 1)
XCTAssertEqual(binarySearch([2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 1]), 3)

func frogJump(_ x: Int, _ y: Int, _ d: Int) -> Int {
    return Int(ceilf(Float(y - x) / Float(d)))
}
XCTAssertEqual(frogJump(30, 110, 30), 3)
