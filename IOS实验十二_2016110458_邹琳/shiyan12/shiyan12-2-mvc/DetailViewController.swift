//
//  DetailViewController.swift
//  shiyan12-2
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 zoulin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var person:Person?
    
    @IBOutlet weak var tfName: UILabel!
    @IBOutlet weak var tfSex: UILabel!
    @IBOutlet weak var tfAge: UILabel!
    @IBOutlet weak var tfPhone: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        tfName.text = person?.name
        tfSex.text = person?.sex
        tfAge.text = person?.age
        tfPhone.text = person?.phone
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
