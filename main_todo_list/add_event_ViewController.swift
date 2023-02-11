//
//  add_event_ViewController.swift
//  main_todo_list
//
//  Created by kaito on 2023/01/21.
//

import UIKit

class add_event_ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
   
    

    //キーボードを閉じる
    @objc func commitButtonTappend(){
        self.view.endEditing(true)
    }
}
