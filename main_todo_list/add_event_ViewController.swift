//
//  add_event_ViewController.swift
//  main_todo_list
//
//  Created by kaito on 2023/01/21.
//

import UIKit

class add_event_ViewController: UIViewController {
    @IBOutlet weak var event_textfiled: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //増やすボタンが押されたら
    @IBAction func add_button(_ sender: Any) {
        let add_event = event_textfiled.text!
        todo_list.append(add_event)
    }
}
