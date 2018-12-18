//
//  myView.swift
//  Hello World
//
//  Created by student on 2018/10/20.
//  Copyright © 2018年 2016110458. All rights reserved.
//

import UIKit

class myView: UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let firstpath = UIBezierPath(rect: rect)
        //创建一个UIBezierPath变量，UIBezierPath可创建基于矢量的路径，常用来绘图
        UIColor.red.setStroke()  //红色边界
        firstpath.stroke()   //将视图边界弄成红色
        UIColor.yellow.setFill()//黄色填充
        firstpath.fill()//将TrangleView将视图填充为黄色
        
        //画椭圆和圆
        let secondpath = UIBezierPath(ovalIn:rect)
        UIColor.blue.setStroke()
        secondpath.stroke()
        UIColor.green.setFill()
        secondpath.fill()
        
        //画三角形
        path.move(to: CGPoint(x:rect.size.width/2,y:0))
        path.addLine(to: CGPoint(x:rect.size.width,y:rect.size.height))
        path.addLine(to: CGPoint(x:0,y:rect.size.height))
        path.close()
        UIColor.black.setStroke()
        path.stroke()
        UIColor.cyan.setFill()
        path.fill()
    }
}
class TrangleView:UIView{  //从view中派生出自定义的View
    override func draw(_ rect:CGRect){  //重写父类的draw方法
        //        let firstpath = UIBezierPath(rect: rect)
        
        //创建一个UIBezierPath变量，用于画三角形
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.size.width/2, y: 0)) //设置线段的起始点
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))//添加一条线段
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))//添加一条线段
        UIColor.black.setStroke()
        path.stroke()
        UIColor.green.setFill()
        path.fill()
        
        
        //画椭圆和圆
        let path3 = UIBezierPath(ovalIn:rect)
        UIColor.blue.setStroke()
        path3.stroke()
        UIColor.yellow.setFill()
        path3.fill()
        
        
    }
}

