import Foundation

public class AboutString {
    
    // MARK: - 反转字符串
    public class func reverseString(_ s: String) -> String {
        var arrayString = [String]()
        for char in s {
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
        return arrayString.joined()
    }
    
    // MARK: - 颠倒整数
    // 给定一个 32 位有符号整数，将整数中的数字进行反转。
    // 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−2^31,  2^31 − 1]。根据这个假设，如果反转后的整数溢出，则返回 0。
    public class func reverse32Int(_ x: Int) -> Int {
        var x = x
        var result = 0
        while x != 0 {
            let temp = result
            // 不断将一个数字%10和/10，可以得到该数字各位分离的数字
            result = result * 10 + x % 10
            if result / 10 != temp || result > Int32.max || result < Int32.min {
                return 0
            }
            x = x / 10
        }
        return result
    }
    
    // 其它人的版
    public class func reverse32Int2(_ x: Int) -> Int {
        var i = x
        var j = 0
        while i != 0  {
            let max = Int32.max
            if (abs(j) > (max / 10)) {
                return 0;
            }
            j = j * 10 + i % 10
            i = i / 10
        }
        return j
    }
    
    
    // MARK: - 字符串中的第一个唯一字符
    public class func firstUniqChar(_ s: String) -> Int {
        var dics = Dictionary<Character, Int>()
        let array = Array(s)
        for i in array.indices {
            if let data = dics[array[i]] {
                dics[array[i]] = data + 1
            } else {
                dics[array[i]] = 0
            }
        }
        for i in array.indices {
            if dics[array[i]] == 0 {
                return i
            }
        }
        return -1
    }
}
