//
//  ViewController.swift
//  实验10-3
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 sicnu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    //动画
    lazy var animator = UIDynamicAnimator(referenceView: self.backView)
    
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
    }

    @IBAction func addClick(_ sender: Any) {
        //让小方块增加水平位置随机
        let width = Int(backView.bounds.width / 10)
        let randx = Int(arc4random() % 10) * width
        let lable = UILabel(frame: CGRect(x: randx, y: 20, width: width, height: width))
        lable.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        lable.text = "😊"
        lable.textAlignment = .center
        backView.addSubview(lable)
        gravity.addItem(lable)
        collision.addItem(lable)
    }
    
    @IBAction func upClick(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    
    @IBAction func downClick(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    
    @IBAction func leftClick(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    
    @IBAction func rightClick(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    
    @IBAction func deleteClick(_ sender: Any) {
        for item in backView.subviews{
            if item is UILabel{
                //不能实现删除
                item.removeFromSuperview()
                //删除了lable，但位置并没有删除
                gravity.removeItem(item)
                collision.removeItem(item)
            }
        }
    }
}

