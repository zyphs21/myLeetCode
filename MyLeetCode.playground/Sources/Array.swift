
// About Array

public class AboutArray {
    
    
    // MARK: - Remove Duplicates From Sorted Array
    // 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
    // https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/21/
    
    public class func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var size = 0
        for i in 0..<nums.count {
            if nums[i] != nums[size] {
                size += 1
                nums[size] = nums[i]
            }
        }
        return size + 1
    }
    
    // MARK: - maxProfit
    // 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
    // https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/22/
    
    public class func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var sum = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i - 1] {
                sum += (prices[i] - prices[i - 1])
            }
        }
        return sum
    }
    
    
    // MARK: - Rotate Array
    // 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
    // https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/23/
    
    public class func rotateArray(_ nums: inout [Int], k: Int) {
        guard nums.count > 0 else { return }
        // [Int](repeating: 0, count: nums.count)
        var newNums = [Int](repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            newNums[(i + k) % nums.count] = nums[i]
        }
        nums = newNums
    }
    
    public class func rotateArray2(_ nums: inout [Int], k: Int) {
        guard nums.count > 0 else { return }
        self.reverse(&nums, startIdx: 0, endIdx: nums.count - 1 - k)
        self.reverse(&nums, startIdx: nums.count - k, endIdx: nums.count - 1)
        self.reverse(&nums, startIdx: 0, endIdx: nums.count - 1)
    }
    
    private class func reverse(_ nums: inout [Int], startIdx: Int, endIdx: Int) {
        var startIdx = startIdx
        var endIdx = endIdx
        while startIdx < endIdx {
            let temp = nums[startIdx]
            nums[startIdx] = nums[endIdx]
            nums[endIdx] = temp
            startIdx += 1
            endIdx -= 1
        }
    }
    
    
    // MARK: - containsDuplicate
    // 给定一个整数数组，判断是否存在重复元素。
    // https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/24/
    
    public class func containsDuplicate(_ nums: [Int]) -> Bool {
        if nums.count == 1 || nums.isEmpty {
            return false
        }
        let nums = nums.sorted()
        for i in 0..<nums.count - 1 {
            if nums[i] == nums[i + 1] {
                return true
            }
        }
        return false
    }
    
    public class func containsDuplicate2(_ nums: [Int]) -> Bool {
        let set = Set(nums)
        return set.count != nums.count
    }
    
    public class func containsDuplicate3(_ nums: [Int]) -> Bool {
        var dic: Dictionary<Int, Int> = [:]
        for i in 0..<nums.count {
            if let _ = dic[nums[i]] {
                return true
            }
            dic[nums[i]] = i
        }
        return false
    }
    
    
    // MARK: - singleNumber
    // 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
    // https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/25/
    
    public class func singleNumber(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        // 排序后，步长为2来遍历，利用题目『其余每个元素均出现两次』条件
        for i in stride(from: 0, to: nums.count, by: 2) {
            if i + 1 >= nums.count {
                return nums[i]
            }
            if nums[i] != nums[i + 1] {
                return nums[i]
            }
        }
        return 0
    }
    
    // 异或运算：
    // a ^ b = b ^ a
    // a ^ b ^ c = a ^ (b ^ c) = (a ^ b) ^ c
    // 1 ⊕ 0 = 1; 0 ⊕ 1 = 1; 1 ⊕ 1 = 0; 0 ⊕ 0 = 0
    //  (a^a) ^ (b^b) ^ c = 0 ^ 0 ^ c = c
    // 两个相同数 ^(异或运算)为 0
    // 两个相同数字做 & 运算得到相同的数； 两个相同数字做 | 运算得到相同的数
    
    public class func singleNumber2(_ nums: [Int]) -> Int {
        if nums.count == 0 { return 0 }
        var num = nums.first!
        for i in 1..<nums.count {
            num = num ^ nums[i]
        }
        return num
    }
    
    public class func singleNumber3(_ nums: [Int]) -> Int {
        // func reduce(initial: U, combine: (U, T) -> U) -> U
        return nums.reduce(0) { (res: Int, item) -> Int in
            return res ^ item
        }
    }
    
    // 利用字典
    public class func singleNumber4(_ nums: [Int]) -> Int {
        var dic = Dictionary<Int, Int>()
        for num in nums {
            if let value = dic[num] {
                dic[num] = value + 1
            } else {
                dic[num] = 1
            }
        }
        for entry in dic {
            if entry.value == 1 {
                return entry.key
            }
        }
        return 0
    }
    
    
    // MARK: - intersect
    // 给定两个数组，写一个方法来计算它们的交集。
    
    public class func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dic = Dictionary<Int, Int>()
        for num in nums1 {
            if let value = dic[num] {
                dic[num] = value + 1
            } else {
                dic[num] = 1
            }
        }
        var result = [Int]()
        for num in nums2 {
            if dic.keys.contains(num) && dic[num]! > 0 {
                result.append(num)
                dic[num] = dic[num]! - 1
            }
        }
        return result
    }
    
    public class func intersect2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var num1 = nums1.sorted(by: <)
        var num2 = nums2.sorted(by: <)
        var i = 0
        var j = 0
        var num3 = Array<Int>()
        
        while i < num1.count && j < num2.count {
            if num1[i] < num2[j] {
                i = i + 1
            } else if num1[i] > num2[j] {
                j = j + 1
            } else {
                num3.append(num1[i])
                i = i + 1
                j = j + 1
            }
        }
        return num3
    }
    
    // [soapyigu 的解法](https://github.com/soapyigu/LeetCode-Swift/blob/master/Array/IntersectionTwoArraysII.swift)
    public class func intersect3(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // Dictionary(nums1.map { ($0, 1) } , uniquingKeysWith: +)
        var frequencies = Dictionary(nums1.map { ($0, 1) } , uniquingKeysWith: +)
        var res = [Int]()
        
        for num in nums2 {
            guard let frequent = frequencies[num] else {
                continue
            }
            if frequent > 0 {
                frequencies[num]! = frequent - 1
                res.append(num)
            }
        }
        return res
    }
    
    
    // MARK: - plusOne
    // 加一： 给定一个非负整数组成的非空数组，在该数的基础上加一，返回一个新的数组。
    
    public class func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        for i in (0..<digits.count).reversed() {
            if digits[i] < 9 {
                digits[i] += 1
                return digits
            } else {
                digits[i] = 0
                if i == 0 {
                    digits.insert(1, at: 0)
                }
            }
        }
        return digits
    }
    
    // 网上的方法：求余后，设置一个标志位判断是否进位
    public class func plusOne2(_ digits: [Int]) -> [Int] {
        var digits = digits
        var carray = 1
        for i in (0..<digits.count).reversed() {
            let sum = digits[i] + carray
            //如果进位即sum = 10，digits[i] = 0
            digits[i] = sum % 10
            carray = sum / 10
            //如果进位 carray = 1，不进位则为零，那么循环结束
            if carray == 0 { return digits }
        }
        
        //运行至此说明carray还是等于1，即全是9的情况，需要在首位插入数字1
        digits.insert(1, at: 0)
        return digits
    }
    
    
    // MARK: - Move zeroes
    // 移动零：给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
    public class func moveZeroes(_ nums: inout [Int]) {
        var j = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                let temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
                // nums.swapAt(i, j)
                j += 1
            }
        }
    }
    
    
    // MARK: - TwoSum
    // 给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
    public class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return []
    }
    
    // hashtable来保存与之契合的数
    public class func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var map = Dictionary<Int, Int>()
        for i in 0..<nums.count {
            if let value = map[nums[i]] {
                return [i, value]
            } else {
                map[target - nums[i]] = i
            }
        }
        return []
    }
    
    // MARK: - isValidSudoku
    // 判断一个 9x9 的数独是否有效
    public class func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowSet = Set<Character>()
        var columnSet = Set<Character>()
        for i in 0..<9 {
            // 注意要清空
            rowSet.removeAll()
            columnSet.removeAll()
            for j in 0..<9 {
                // board[i][j]是行
                if board[i][j] != "." {
                    if rowSet.contains(board[i][j]) {
                        return false
                    }
                    rowSet.insert(board[i][j])
                }
                // board[j][i]是列
                if board[j][i] != "." {
                    if columnSet.contains(board[j][i]) {
                        return false
                    }
                    columnSet.insert(board[j][i])
                }
                // blockSet 一个九宫
                if i % 3 == 0 && j % 3 == 0 {
                    var blockSet = Set<Character>()
                    for r in i..<(i + 3) {
                        for c in j..<(j + 3) {
                            if board[r][c] != "." {
                                if blockSet.contains(board[r][c]) {
                                    return false
                                }
                                blockSet.insert(board[r][c])
                            }
                        }
                    }
                }
            }
        }
        return true
    }
}
