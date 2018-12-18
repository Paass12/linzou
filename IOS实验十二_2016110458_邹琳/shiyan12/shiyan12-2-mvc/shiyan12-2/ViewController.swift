//
//  ViewController.swift
//  shiyan12-2
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 zoulin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfSex: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    //设置代理,强转为自己的代理对象
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //保留上下文
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(NSHomeDirectory())
        // Do any additional setup after loading the view, typically from a nib.
    }
    //添加
    @IBAction func cancleClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addClick(_ sender: Any) {
        let person = Person(context:context)
        person.name = tfName.text
        person.sex = tfSex.text
        person.age = tfAge.text
        person.phone = tfPhone.text
        //保存
        //appDelegate.saveContext()
        dismiss(animated: true, completion: nil)
    }
    
}

