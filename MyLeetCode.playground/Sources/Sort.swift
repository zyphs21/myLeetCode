import Foundation

public class Sort {
    
    public class func quickSort(_ nums: inout [Int], left: Int, right: Int) {
        if left >= right {
            return
        }
        var i = left
        var j = right
        let key = nums[left]
        while i < j {
            while i < j &&  nums[j] >= key {
                j -= 1
            }
            nums[i] = nums[j]
            while i < j && nums[i] <= key {
                i += 1
            }
            nums[j] = nums[i]
        }
        nums[i] = key
        
        quickSort(&nums, left: left, right: i - 1)
        quickSort(&nums, left: i + 1, right: right)
    }
}
