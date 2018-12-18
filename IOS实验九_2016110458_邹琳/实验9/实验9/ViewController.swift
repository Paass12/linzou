//
//  ViewController.swift
//  实验9
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 zoulin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionSheet(_ sender: Any) {
        let alert = UIAlertController(title: "action sheet", message: "this is a new message", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "gray", style: .default, handler: { (action) in
            print("ok clicked")
            self.view.backgroundColor = UIColor.gray
        }))
        alert.addAction(UIAlertAction(title: "green", style: .destructive, handler: { (action) in
            print("destructive clicked")
            self.view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        }))
        alert.addAction(UIAlertAction(title: "blue", style: .cancel, handler: { (action) in
            print("cancel clicked")
            self.view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }))
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "Login", message: "login message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: {(action) in
            guard let username = alert.textFields?.first?.text,let password = alert.textFields?.last?.text else{
                return
            }
            print("username=\(username),password=\(password)")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
        }))
        
        alert.addTextField { (textField) in
            textField.placeholder = "please input  your name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "please input your password"
            textField.isSecureTextEntry = true
        }
        present(alert, animated: true, completion: nil)

    }
}

