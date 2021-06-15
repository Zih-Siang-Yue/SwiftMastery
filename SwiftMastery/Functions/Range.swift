//
//  Range.swift
//  SwiftMastery
//
//  Created by Sean.Yue on 2021/2/25.
//

import Foundation

class RangePratice: Practicable {
    func havePractice() {
        _ = RangesWithArray()
        _ = RangesWithStrings()
    }
}

struct RangesWithArray: Practicable {

    let testArray: [Int] = [1,2,3,4,5,6,7,8,9,10]

    func havePractice() {
        createClosedRanges()
        createHalfOpenRanges()
        createOneSidedRanges()
        createNSRange()
    }
    
    func createClosedRanges() {
        let closedRange: ClosedRange<Int> = 3...7
        let countableClosedRange: CountableClosedRange<Int> = 60...90
        let sliceClosedArray = testArray[closedRange]
        let sliceCountableClosedArray = testArray[countableClosedRange]

        print("[Range] slice closed array: \(sliceClosedArray)")
        print("[Range] slice countable closed array: \(sliceCountableClosedArray)") //error?
    }
    
    func createHalfOpenRanges() {
        let halfOpenRange: Range = 1..<4
        let countableHalfOpenRange: CountableRange = 7..<11
        
        let sliceHalfOpenArray = testArray[halfOpenRange]
        let sliceCountableHalfOpenArray = testArray[countableHalfOpenRange]
        
        print("[Range] slice half-open array: \(sliceHalfOpenArray)")
        print("[Range] slice countable half-open array: \(sliceCountableHalfOpenArray)")
    }
    
    func createOneSidedRanges() {
        let oneSidedRange1: PartialRangeFrom<Int> = 1...
        let oneSidedRange2: PartialRangeThrough<Int> = ...5

        let sliceOneSided1Array = testArray[oneSidedRange1]
        let sliceOneSided2Array = testArray[oneSidedRange2]

        print("[Range] slice one-sided 1 array: \(sliceOneSided1Array)")
        print("[Range] slice one-sided 2 array: \(sliceOneSided2Array)")
    }
    
    func createNSRange() {
        let nsRange: NSRange = NSRange(location: 3, length: 6)
        /* NSRange don’t work in Swift subscript. We need to convert NSRange to Range.
           https://padamthapa.com/blog/how-to-get-substring-with-nsrange-in-swift5/
         */
        if let range = Range(nsRange) {
            let sliceNSRangeArray = testArray[range]
            print("[Range] slice NSRange array: \(sliceNSRangeArray)")
        }
    }
}


struct RangesWithStrings: Practicable {
    
    let testStrWithEmoji = "abc😱defghijk"
    let testStrWithoutEmoji = "abcdefghijk"
    
    func havePractice() {
        getSubstringByHalfOpenRange()
        getSubstringByOneSidedRange()
        getSubstringByNSRange()
    }
    
    func getSubstringByHalfOpenRange() {
        /*
        The generic type of Range is Int, it doesn't work for String, because Strings are made of Characters and not all characters are the same size
         As emoji like 😱 takes more space than the letter "b"
         let range: Range = 1..<3
         let subString = testString[range]  (X) error
         */

        let start = testStrWithEmoji.index(testStrWithEmoji.startIndex, offsetBy: 1)
        let end = testStrWithEmoji.index(testStrWithEmoji.startIndex, offsetBy: 4)
        let myRange = start..<end
        print("[Range] get substring with emoji by Half Open Range: \(testStrWithEmoji[myRange])") // "😱cd"

        let start2 = testStrWithoutEmoji.index(testStrWithoutEmoji.startIndex, offsetBy: 1)
        let end2 = testStrWithoutEmoji.index(testStrWithoutEmoji.startIndex, offsetBy: 4)
        let myRange2 = start2..<end2
        print("[Range] get substring without emoji Half Open by Range: \(testStrWithoutEmoji[myRange2])") // "bcd"
    }
    
    func getSubstringByOneSidedRange() {
        let start = testStrWithEmoji.index(testStrWithEmoji.startIndex, offsetBy: 3)
        print("[Range] get substring with emoji by One Sided Range 1: \(testStrWithEmoji[start...])") // "😱defghijk"
        

        let start2 = testStrWithEmoji.index(testStrWithEmoji.endIndex, offsetBy: -4)
        print("[Range] get substring with emoji by One Sided Range 2: \(testStrWithEmoji[..<start2])") //
    }
    
    func getSubstringByNSRange() {
        let nsRange = NSRange(location: 1, length: 3)
        let nsStrWithEmoji: NSString = NSString(string: testStrWithEmoji)
        let nsStrWithoutEmoji: NSString = NSString(string: testStrWithoutEmoji)
        
        let subStrWithEmoji = nsStrWithEmoji.substring(with: nsRange)
        let subStrWithoutEmoji = nsStrWithoutEmoji.substring(with: nsRange)
        
        print("[Range] get substring with emoji by NSRange: \(subStrWithEmoji)")
        print("[Range] get substring with out emoji by NSRange: \(subStrWithoutEmoji)")
    }
    
}


/*
 Ref: https://stackoverflow.com/questions/30093688/how-to-create-range-in-swift
*/
