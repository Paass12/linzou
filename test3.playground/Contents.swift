//: Playground - noun: a place where people can play

import UIKit
//第1题
let currentDate = Date()
var dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy年M月dd日E a HH:mm"
dateFormatter.locale = Locale(identifier: "zh_CN")

let timeBeiJing = dateFormatter.string(from:currentDate)
print("beijing："+timeBeiJing)

dateFormatter.timeZone = TimeZone(abbreviation:"UTC+9:00")
let timeTokyo = dateFormatter.string(from: currentDate)
print("dongjing："+timeTokyo)

dateFormatter.timeZone = TimeZone(secondsFromGMT:-4*3600)
let timeNY = dateFormatter.string(from: currentDate)
print("niuyue："+timeNY)

dateFormatter.timeZone = TimeZone(secondsFromGMT:1*3600)
let timeLondon = dateFormatter.string(from: currentDate)
print("london："+timeLondon)
//第2题
var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS"
let index1 = str.index(str.startIndex, offsetBy: 6)
let index2 = str.index(str.startIndex, offsetBy: 26)
let str1 = str[index1..<index2]
print(str1)
let str2 = str.replacingOccurrences(of: "OS", with: "")
print(str2)
//第3题
//var dictionary = ["beijingtime":timeBeiJing,"dongjingtime":timeTokyo,"niuyuetime":timeNY,"londontime":timeLondon,"str":str]
//let filename = FileManager.default
//var url = fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!
//url.appendPathComponent("test3.txt")
//print(url)
//try? dictionary.write(to: url, atomically: true)
let dic = ["date": ["beijing": timeBeiJing, "tokyo": timeTokyo, "newYork": timeNY, "london": timeLondon], "string": str] as AnyObject
let fileManager = FileManager.default
print(fileManager.currentDirectoryPath)
if var path = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
    path.append("/test3.txt")  //在文件夹路径下增加一个test.txt
    print(dic.write(toFile: path, atomically: true))  //新建上面指定的文件，并将数据写入(输出true)
}
//var urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
//urls.appendPathComponent("test3-3.txt")
//print(dic.write(toFile:urls,atomically:true,encoding:.utf8)
//第4题
let image = try Data(contentsOf: URL(string: "http://t2.hddhhn.com/uploads/tu/201707/200/2.jpg")!) //通过指定的url获取图片，并转换为二进制数据
if var url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first{
    url.appendPathComponent("image.png")
    try image.write(to: url)  //将转换后的二进制数据存储为png图片
}
//第5题
enum MyError:Error {
    case Zero
    case NotURL
}
//guard let weather = dic["weatherinfo"] as? [String:String] else{
//    throw MyError.NotURL
//}
//let url = URL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")! //api的路径
//let strs = try String(contentsOf: url)
//print(strs)  //显示json数据内容
//let data = try Data(contentsOf: url)  //将json转换为二进制数据
//let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)  //序列化json
////解析json数据
//if let dics = json as? [String: Any] {
//    if let weather = dics["weatherinfo"] as? [String: Any] {
//        let city = weather["city"]!
//        let temp = weather["temp"]!
//        let wd = weather["WD"]!
//        let ws = weather["WS"]!
//        print("城市: \(city), 温度: \(temp), 风向: \(wd), 风力: \(ws)")
//        //输出: 城市: 西安, 温度: 20, 风向: 西南风, 风力: 1级
//    }
//}
guard let postUrl = URL(string:"http://www.weather.com.cn/data/sk/101010100.html" )else{
    throw MyError.NotURL
}
let jsondata = try! Data(contentsOf: postUrl) //将json转换为二进制数据
let json = try!JSONSerialization.jsonObject(with: jsondata, options:.allowFragments )
guard let dics = json as? [String:Any] else{
    throw MyError.NotURL
}
print(dics)
guard let informationInfo = dics["message"] as? [String:String] else {
    throw MyError.NotURL
}
print(informationInfo)

    







