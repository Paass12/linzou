//
//  CircleView.swift
//  实验9-2
//
//  Created by student on 2018/11/10.
//  Copyright © 2018年 zoulin. All rights reserved.
//

import UIKit
@IBDesignable//使视图在main.storyboard课件可见
class CircleView: UIView {
    //实现手势控制
    func setup(){
        //设置阴影
        self.layer.cornerRadius = 50
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 0.8
        //设置视图的内容模式为重绘
        self.contentMode = .redraw
        //pan移动效果
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(panRecognizer)// 实现交互
        //tap删除效果
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapGesture)
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.numberOfTapsRequired = 2
        //pinch缩放效果
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        self.addGestureRecognizer(pinchGesture)
        //rotation旋转效果
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotation(gestrue:)))
        self.addGestureRecognizer(rotationGesture)
    
    }
    //必须加上@objc ，否则不能识别，添加移动效果
    @objc func pan(recognizer:UIPanGestureRecognizer){
        //print("手势识别")
        //设置手势识别的作用效果
        switch recognizer.state{
        case .changed:
            fallthrough
        case.ended:
            let translation = recognizer.translation(in: self)
            center.x += translation.x//移动距离为累加，速度太快，看不到效果
            center.y += translation.y
            //将每一次动作前的位移量清零
            recognizer.setTranslation(.zero, in: self)
        default:
            break
        }
    }
    //tap删除
    @objc func tap(recognizer: UITapGestureRecognizer) {
        //设置手势识别的作用效果
        switch recognizer.state{
        case .recognized:
            print("双击删除")
        default:
            break
        }
    }
    //pinch缩放
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {
        print("手势控制缩放")
//        let scale = gesture.scale
//        self.transform = self.transform.scaledBy(x: scale, y: scale)
//        gesture.scale = 1
        //设置手势识别的作用效果
        switch recognizer.state{
        case .changed:
            fallthrough
        case.ended:
           bounds.size = CGSize(width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
            recognizer.scale = 1 //缩放比例控制
        default:
            break
        }
        
    }
    //rotation旋转
    @objc func rotation(gestrue: UIRotationGestureRecognizer) {
        print("手势控制旋转")
        let rotation = gestrue.rotation
        self.transform = self.transform.rotated(by: rotation)
        gestrue.rotation = 0
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setup()
    }
    @IBInspectable var fillColor:UIColor?//使视图能够在main.storyboard中调整颜色
    @IBInspectable var strokeColor:UIColor?
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        //画圆
        let path = UIBezierPath(rect: rect)
        //颜色填充
        fillColor?.setFill()
        strokeColor?.setStroke()
        path.fill()
        path.stroke()
    }
}
