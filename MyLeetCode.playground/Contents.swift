//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var testArray: [Int] = [1, 1, 1, 2, 2, 5, 5, 7]
AboutArray.removeDuplicates(&testArray)
testArray

var testArray1: [Int] = [2, 5, 7, 3, 9, 8]
AboutArray.rotateArray(&testArray1, k: 1)
testArray1
AboutArray.rotateArray2(&testArray1, k: 2)
testArray1

Sort.quickSort(&testArray1, left: 0, right: testArray1.count - 1)
testArray1

AboutArray.maxProfit([1,1,2,2,5,5,7])

AboutArray.containsDuplicate([1,1,2,2,5,5,7])
AboutArray.containsDuplicate2([1,1,2,2,5,5,7])
AboutArray.containsDuplicate3([1,1,2,2,5,5,7])

AboutArray.singleNumber([1,1,2,2,5,5,7])
AboutArray.singleNumber2([1,1,2,2,5,5,7])
AboutArray.singleNumber3([1,1,2,2,5,5,7])
AboutArray.singleNumber4([1,1,2,2,5,5,8])

AboutArray.intersect([1,1,2,2,5,5,8], [1,5,8])

var dic = ["one": 10, "two": 20]

//merge方法合并
let tuples = [("one", 5), ("three", 30)]
dic.merge(tuples, uniquingKeysWith: min)
print("dic：\(dic)")

//merging方法合并
let dic2 = ["one": 0, "four": 40]
let dic3 = dic.merging(dic2, uniquingKeysWith: min)
print("dic3：\(dic3)")

var moveZeroesArray = [0, 1, 0, 3, 12]
AboutArray.moveZeroes(&moveZeroesArray)

var twoSumArray = [2, 7, 11, 15]
AboutArray.twoSum(twoSumArray, 9)
AboutArray.twoSum2(twoSumArray, 9)

