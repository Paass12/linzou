//
//  ViewController.swift
//  实验9-2
//
//  Created by student on 2018/11/10.
//  Copyright © 2018年 zoulin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addLabel(_ sender: Any) {
        //定义随机添加的位置
        let x = Int(arc4random())%Int(view.bounds.width)
        let y = Int(arc4random())%Int(view.bounds.height)
         let maxWidth: CGFloat = 150
        let width = Int(arc4random() % UInt32(maxWidth))
        let height = Int(arc4random() % UInt32(maxWidth))
        let label = UILabel(frame: CGRect(x:x,y:y,width:width,height:height))
        label.text = "hands"
        label.textAlignment = .center
        label.backgroundColor = UIColor.orange
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 5, height: 5)
        label.layer.shadowOpacity = 0.8
        label.isUserInteractionEnabled = true
        //pan移动效果
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        label.addGestureRecognizer(panRecognizer)// 实现交互
        //tap删除效果
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        label.addGestureRecognizer(tapRecognizer)
        //pinch缩放效果
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        label.addGestureRecognizer(pinchRecognizer)
        //rotation旋转效果
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotation(gestrue:)))
        label.addGestureRecognizer(rotationGesture)
        self.view.addSubview(label)
    }
    //必须加上@objc ，否则不能识别，添加移动效果
    @objc func pan(recognizer:UIPanGestureRecognizer){
        //print("手势识别")
        //设置手势识别的作用效果
        switch recognizer.state{
        case .changed:
            fallthrough
        case.ended:
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x//移动距离为累加，速度太快，看不到效果
            recognizer.view?.center.y += translation.y
            //将每一次动作前的位移量清零
            recognizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
    }
    //tap删除
    @objc func tap(recognizer: UITapGestureRecognizer) {
        //设置手势识别的作用效果
        if recognizer.state == .recognized {
            recognizer.view?.removeFromSuperview()
        }
    }
    //pinch缩放
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {
        switch recognizer.state{
        case .changed:
            fallthrough
        case.ended:
            let scale = recognizer.scale;
            recognizer.view?.bounds.size = CGSize(width:label.bounds.width * scale, height: label.bounds.height * scale)
            recognizer.scale = 1//缩放比例控制
        default:
            break
        }
        
    }
    //rotation旋转
    @objc func rotation(gestrue: UIRotationGestureRecognizer) {
        print("手势控制旋转")
        let rotation = gestrue.rotation
        gestrue.view?.transform = view.transform.rotated(by: rotation)
        gestrue.rotation = 0
    }
    
    @IBAction func moveLabel(_ sender: Any) {
        for label in view.subviews{
            if label is UILabel{
                //定义随机添加的位置
                UIView.animate(withDuration: 1){
                    //view必须加上self才不会报错
                    let x = Int(arc4random())%Int(self.view.bounds.width)
                    let y = Int(arc4random())%Int(self.view.bounds.height)
                    label.center.x = CGFloat(x)
                    label.center.y = CGFloat(y)
                }
            }
        }
    }
    
    @IBAction func deleteLabel(_ sender: Any) {
        for label in view.subviews{
            if label is UILabel {
                label.removeFromSuperview()
            }
        }
    }
    
}

