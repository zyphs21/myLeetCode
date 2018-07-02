
// About Array

public class AboutArray {
    
    
    // MARK: - Remove Duplicates From Sorted Array
    
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
    
    
    // MARK: - Rotate Array
    
    public class func rotateArray(_ nums: inout [Int], k: Int) {
        guard nums.count > 0 else { return }
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
    
    
    // MARK: - maxProfit
    
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
}
