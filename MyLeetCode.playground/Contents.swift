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

var sudokuArray: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
AboutArray.isValidSudoku(sudokuArray)

var matrix: [[Int]] =  [[1,2,3], [4,5,6], [7,8,9]]
AboutArray.rotate2(&matrix)
var matrix2: [[Int]] = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]]
AboutArray.rotate2(&matrix2)

var rotateString = "hell"
var arrayString = [String]()
for char in rotateString {
    arrayString.append("\(char)")
}
var left = 0
var right = arrayString.count - 1
while left < right {
    let temp = arrayString[left]
    arrayString[left] = arrayString[right]
    arrayString[right] = temp
    left += 1
    right -= 1
}
arrayString.joined()

AboutString.reverse32Int(-918)
Int32.min

AboutString.firstUniqChar2("hhello")

// 删除在另一个字符串中出现的字符
public func removeString(from: String, with: String) {
    var tempMap: [Character: Bool] = [:]
    var fromStringArray = Array(from)
    var withStringArray = Array(with)
    for i in fromStringArray.indices {
        tempMap[fromStringArray[i]] = false
    }
    for i in withStringArray.indices {
        if let _ = tempMap[withStringArray[i]] {
            tempMap[withStringArray[i]]! = true
        }
    }
    for i in fromStringArray.indices {
        if !tempMap[fromStringArray[i]]! {
            print(fromStringArray[i])
        }
    }
}

removeString(from: "helloworld", with: "eo")
