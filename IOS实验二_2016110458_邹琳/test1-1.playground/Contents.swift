//: Playground - noun: a place where people can play

import UIKit

var primes = [Int]()
for i in 2...10000{
    var isprime = true
    for j in 2..<i{
        if i%j == 0 {
            isprime = false
        }
    }
    if isprime{
        primes.append(i)
    }
}
//print(primes)
////对数组进行正反排序并输出所有结果
////方法1：
////primes.reverse()
////print(primes)
////方法2：
//func onSort(s1:Int,s2:Int)->Bool{
//    return s1>s2
//}
//primes.sort(by:onSort)
//print(primes)
//
////方法3：
//primes.sort(by:{(s1:Int,s2:Int)->Bool in return s1>s2})
//方法4
//primes.sort(by:{(s1,s2) in return s1>s2})
//方法5
//primes.sort(by:{return $0>$1})
//方法6
//primes.sort(by:{$0>$1})
//方法7
primes.sort(){
    $0>$1
}
print(primes)




