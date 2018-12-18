//
//  FirsrViewController.swift
//  Hello World
//
//  Created by student on 2018/10/20.
//  Copyright © 2018年 2016110458. All rights reserved.
//

import UIKit

class FirsrViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建标签
        let label = UILabel(frame:CGRect(x:200,y:80,width:300,height:150))
        label.text = "Hello World! 😁"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.white
        label.center = view.center
        view.addSubview(label)
        //创建按钮
        let button = UIButton(frame:CGRect(x:150,y:460,width:100,height:40))
        button.setTitle("click me😊", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.gray
        view.addSubview(button)
        //添加事件响应
        // Do any additional setup after loading the view.
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        //创建图片
        let imagView = UIImageView(frame: CGRect(x:0,y:0,width:430,height:220))
        imagView.image = UIImage(named:"montain")
        view.addSubview(imagView)
        
        let imagView2 = UIImageView(frame: CGRect(x:0,y:530,width:430,height:250))
        imagView2.image = UIImage(named: "lion")
        view.addSubview(imagView2)
    }
    @IBAction func buttonClicked(){
        if let label = view.subviews.first as? UILabel {
            label.text = "I was clicked! 🏃"
            label.textColor = UIColor.yellow
            label.backgroundColor = UIColor.red
            present(SexondViewController(),animated: true,completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
