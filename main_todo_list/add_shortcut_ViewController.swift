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
    
    @IBAction func add_button(_ sender: Any) {
        let add_short_cut = String(short_cut_text_filed.text!)
        segmentnames.append(add_short_cut)
        UserDefaults.standard.set(add_short_cut, forKey: "segment_key")
        UserDefaults.standard.synchronize()
        print("保存が成功しました。")
        
        //追加されたアラートを表示する
        let alert = UIAlertController(title: "追加", message: ("入力された" + "[" + add_short_cut + "]" + "は追加されました"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //キーボードを閉じる
    @objc func commitButtonTappend(){
        self.view.endEditing(true)
    }
}
