//
//  SexondViewController.swift
//  Hello World
//
//  Created by student on 2018/10/20.
//  Copyright © 2018年 2016110458. All rights reserved.
//

import UIKit

class SexondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        let shape1 = myView(frame: CGRect(x: 100, y: 400, width: 200, height: 200))
        view.addSubview(shape1)
        
        let shape2 = TrangleView(frame:CGRect(x:50,y:100,width:60,height:130))
        view.addSubview(shape2)
        
        let shape3 = TrangleView(frame:CGRect(x:210,y:220,width:150,height:80))
        view.addSubview(shape3)
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
