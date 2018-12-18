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
enum Enum{
    case math
    case chinese
    case english
    case null
}
//协议
protocol SchoolProtocol {
    var des:Enum{get}
    mutating func lendBook()
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
    func run(){
        print("Person"+fullName+"   is   running")
    }

}

class Student:Person,SchoolProtocol{//由Person派生出Student子类
    var stuNo:String
    init(firstName:String,lastName:String,age:Int,gender:Gender,stuNo:String){
        self.stuNo = stuNo
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
        //调用父类的构造函数
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:18,gender:Gender.male,stuNo:"2016110401")
    }
    override var description:String{
        return super.description + "  stuNo:\(stuNo)"
    }
    override func run(){
        print("Student"+fullName+"  is   running")
    }
    var des: Enum = Enum.chinese
    func lendBook() {
        print("student lend books")
    }
}

class Teacher:Person,SchoolProtocol{ //由Person派生出Teacher子类
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
    override func run(){
        print("Teacher"+fullName+"   is   running")
    }
    var des: Enum = Enum.math
    func lendBook() {
        print("teacher lend books")
    }
}
//实例化对象并输出
let p1 = Person(firstName:"xiao",lastName:"ming",age:16,gender:Gender.male)
p1.run()

let s1 = Student(firstName:"xiao",lastName:"hong",age:19,gender:Gender.female,stuNo:"201")
s1.run()
s1.lendBook()

let t1 = Teacher(firstName:"xiao",lastName:"fang",age:32,gender:Gender.female,title:"math")
t1.run()
t1.lendBook()
//***************************************************************************************************

//分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中；
var people = [Person]()//初始化一个空的Person类型数组
people.append(p1)//将不同对象存入数组

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

for p in people{
    if p is Student  {
        (p as! Student).lendBook()
    }else if p is Teacher{
        (p as! Teacher).lendBook()
    }
    p.run()
}





