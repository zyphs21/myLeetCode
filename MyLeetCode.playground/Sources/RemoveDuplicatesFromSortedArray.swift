// Remove Duplicates From Sorted Array


public class RemoveDuplicatesFromSortedArray {
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
}
