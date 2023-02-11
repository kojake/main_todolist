//
//  add_shortcut_ViewController.swift
//  main_todo_list
//
//  Created by kaito on 2023/01/28.
//

import UIKit

class add_shortcut_ViewController: UIViewController {
    @IBOutlet weak var short_cut_text_filed: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //キーボードを閉じるためのボタンを追加する
        //ツールバーの作成
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        toolBar.barStyle = UIBarStyle.default
        toolBar.sizeToFit()
        
        //閉じるボタンを右に配置するためのスペース
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        //閉じるボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.commitButtonTappend))
        toolBar.items = [spacer, commitButton]
        short_cut_text_filed.inputAccessoryView = toolBar
    }
    

    
    //キーボードを閉じる
    @objc func commitButtonTappend(){
        self.view.endEditing(true)
    }
}
