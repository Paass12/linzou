//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
enum Gender:Int{
    case male
    case female
    static func >(Ihs:Gender,rhs:Gender)->Bool{
        return Ihs.rawValue < rhs.rawValue
    }
}

class Person{//Person类(父类)
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        get{
            return firstName+""+lastName
        }
    }
    static func == (p1:Person,p2:Person)->Bool {
        return p1.firstName == p2.firstName
    }
    init(firstName:String,lastName:String,age:Int,gender:Gender){//初始构造函数
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(name:String){//便利构造函数
        self.init(firstName:name,lastName:"",age:18,gender:Gender.female)
    }
    var description:String{//实现Person实例可以直接用print输出
        return "Name:\(fullName)    Age:\(age)    Gender:\(gender)  "
    }
}

class Student:Person{//由Person派生出Student子类
    var stuNo:String
    init(firstName:String,lastName:String,age:Int,gender:Gender,stuNo:String){
        self.stuNo = stuNo
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
        //调用父类的构造函数
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:18,gender:Gender.male,stuNo:"201611001")
    }
    override var description:String{
        return super.description + "  stuNo:\(stuNo)"
    }
}

class Teacher:Person{ //由Person派生出Teacher子类
    var title:String
    init(firstName:String,lastName:String,age:Int,gender:Gender,title:String){
        self.title = title
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
        //调用父类的构造函数
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:36,gender:Gender.male,title:"math")
    }
    override var description:String{
        return super.description + "  title:\(title)"
    }
}
//实例化对象并输出
let p1 = Person(firstName:"ahi",lastName:"sdf",age:36,gender:Gender.male)
let p2 = Person(name:"hekk")
print(p1.description)
print(p2.description)
let s1 = Student(firstName:"xiao",lastName:"lan",age:19,gender:Gender.male,stuNo:"201")
let s2 = Student(name:"xiaoliu")
print(s1.description)
print(s2.description)
let t1 = Teacher(firstName:"zao",lastName:"wi",age:32,gender:Gender.male,title:"math")
let t2 = Teacher(name:"liuwu")
print(t1.description)
print(t2.description)
//两个Person实例对象可以用==和!=进行比较
let p3 = p1
if p1 == p3 {
    print("is the same people")
}else{
    print("is not the same people")
}
//分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中；
var people = [Person]()//初始化一个空的Person类型数组
people.append(p1)//将不同对象存入数组
people.append(p2)
people.append(s1)

//生成3个Person对象
for i in 1...3 {
    let p = Person(firstName: "李", lastName: "\(i)", age: 30, gender:Gender.male)
    people.append(p)
}
//生成3个Student对象
for i in 1...3 {
    let s = Student(firstName:"赵",lastName: "\(i)",age:18,gender:Gender.female,stuNo:"20160100\(i)")
    people.append(s)
}
//生成3个Teacher对象
for i in 1...3 {
    let t = Teacher(firstName:"王",lastName:"\(i)",age:20,gender:Gender.male,title:"数学")
    people.append(t)
}
print(people)
//定义一个字典，用于统计每个类的对象个数
var dictionary = ["Person":0,"Student":0,"Teacher":0]
for item in people {
    if item is Student {
        dictionary["Teacher"]! += 1
    }else if item is Teacher {
        dictionary["Student"]! += 1
    }else{
        dictionary["Person"]! += 1
    }
}
for (key,value) in dictionary {
    print("\(key) has \(value) items")
}

for item in people{
    print(item.description)
}
//按照age值从小到大排序
people.sort{
    return $0.age < $1.age
}
for item in people {
    print(item.description)
}
//按照fullName从小到大排序
people.sort{
    return $0.fullName < $1.fullName
}
for item in people {
    print(item.description)
}
//按照gender+age从小到大排序
people.sort{
    return ($0.gender > $1.gender) && ($0.age > $1.age)
}
for item in people {
    print(item.description)
}

