
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
}
