//
//  AlgorithmTests.swift
//  AlgorithmTests
//
//  Created by HINOMORI HIROYA on 2018/10/23.
//  Copyright © 2018年 HINOMORI HIROYA. All rights reserved.
//

import XCTest
@testable import Algorithm

class AlgorithmTests: XCTestCase {

    func test_BinaryGap() {
        XCTAssertEqual(0, Iterations().binaryBap(60))
        XCTAssertEqual(5, Iterations().binaryBap(1041))
    }

    func test_CyclicRotation() {
        XCTAssertEqual([4, 1, 2, 3], Arrays().cyclicRotation([1, 2, 3, 4], 5))
        XCTAssertEqual([], Arrays().cyclicRotation([], 5))
    }

    func test_OddOccurrencesInArray() {
        XCTAssertEqual(7, Arrays().oddOccurrence([9, 3, 9, 3, 9, 7, 9]))
        XCTAssertEqual(1, Arrays().oddOccurrence([9, 3, 3, 1, 9]))
    }

    func test_PermMissingElemLiner() {
        XCTAssertEqual(Algorithm().missingElementLiner([]), 1)
        XCTAssertEqual(Algorithm().missingElementLiner([1]), 2)
        XCTAssertEqual(Algorithm().missingElementLiner([4, 2, 3, 5, 1, 6, 8, 9]), 7)
        XCTAssertEqual(Algorithm().missingElementLiner([2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 1]), 3)
        XCTAssertEqual(Algorithm().missingElementLiner([2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 1]), 24)
    }
    func test_PermMissingElemBinarySearch() {
        XCTAssertEqual(Algorithm().missingElementBinarySearch([]), 1)
        XCTAssertEqual(Algorithm().missingElementBinarySearch([1]), 2)
        XCTAssertEqual(Algorithm().missingElementBinarySearch([4, 2, 3, 5, 1, 6, 8, 9]), 7)
        XCTAssertEqual(Algorithm().missingElementBinarySearch([2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 1]), 3)
        XCTAssertEqual(Algorithm().missingElementBinarySearch([2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 1]), 24)
    }

    func test_FlogJump() {
        XCTAssertEqual(Algorithm().frogJump(10, 100, 30), 3)
        XCTAssertEqual(Algorithm().frogJump(90, 100, 30), 1)
        XCTAssertEqual(Algorithm().frogJump(10, 1000, 50), 20)
    }

    func test_TapeEquilibriumSimple() {
        XCTAssertEqual(Algorithm().tapeEquilibriumLiner([-1000, 1000]), 2000)
        XCTAssertEqual(Algorithm().tapeEquilibriumLiner([-10, -20, -30, -40, 100]), 20)
    }

    func test_TapeEquilibriumBinarySearch() {
        XCTAssertEqual(Algorithm().tapeEquilibriumBinarySearch([3, 1, 2, 4, 3]), 1)
        XCTAssertEqual(Algorithm().tapeEquilibriumBinarySearch([-1000, 1000]), 2000)
        XCTAssertEqual(Algorithm().tapeEquilibriumBinarySearch([1, 2, 4, 30, 3]), 26)
        XCTAssertEqual(Algorithm().tapeEquilibriumBinarySearch([-10, -20, -30, -40, 100]), 20)
    }

}
