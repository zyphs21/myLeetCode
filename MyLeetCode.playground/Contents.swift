//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var testArray: [Int] = [1,1,1,2,2,5,5,7]
AboutArray.removeDuplicates(&testArray)
testArray

var testArray1: [Int] = [2, 5, 7, 3, 9, 8]
AboutArray.rotateArray(&testArray1, k: 1)
testArray1
AboutArray.rotateArray2(&testArray1, k: 2)
testArray1

Sort.quickSort(&testArray1, left: 0, right: testArray1.count - 1)
testArray1

AboutArray.maxProfit(testArray1)
