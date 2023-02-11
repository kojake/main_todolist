//
//  ViewController.swift
//  main_todo_list
//
//  Created by kaito on 2023/01/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITabBarDelegate{
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //予定を読み込む
        if let todo_list_obj = UserDefaults.standard.object(forKey: "todo_list_key") as? [String] {
            todo_list = todo_list_obj
            todo_check = Array(repeating: false, count: todo_list.count)
        } else {
            todo_list = [String]()
            todo_check = [Bool]()
        }
        
        for(index, name) in segmentnames.enumerated() {
            segment.insertSegment(withTitle: name, at: index, animated: false)
        }
        
        //ショートカットを読み込む
        if let segmentnames_obj = UserDefaults.standard.object(forKey: "segment_key") as? [String] {
            segmentnames = segmentnames_obj
            segment.removeAllSegments()
            for (index, name) in segmentnames.enumerated() {
                segment.insertSegment(withTitle: name, at: index, animated: false)
            }
            tableview.reloadData()
        } else {
            segmentnames = [String]()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo_list.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        TodoCell.textLabel?.text = todo_list[indexPath.row]
        
        let accesory: UITableViewCell.AccessoryType = todo_check[indexPath.row] ? .checkmark: .none
        TodoCell.accessoryType = accesory
        
        return TodoCell
    }
    
    //セルの消去
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todo_list.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .top)
    }
    
    //チェックマーク
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableview.deselectRow(at: indexPath, animated: true)
        todo_check[indexPath.row] = !todo_check[indexPath.row]
        tableview.reloadRows(at: [indexPath], with: .automatic)
        
        let cell = tableView.cellForRow(at: indexPath)
        let accesory: UITableViewCell.AccessoryType = todo_check[indexPath.row] ? .checkmark: .none
        cell?.accessoryType = accesory
    }
    
    //読み込む
    @IBAction func load_button(_ sender: Any) {
        tableview.reloadData()
    }
    
    
    //予定を追加
    @IBAction func add_memo(_ sender: Any) {
        let alert = UIAlertController(title: "追加する内容", message: "TodoListに新しい内容を追加します。", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_) in
            if let title = alert.textFields?[0].text
            {
                if title == ""{
                    let al = UIAlertController(title: "エラー", message: "テキストを入力してください", preferredStyle: .alert)
                    al.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(al, animated: true, completion: nil)
                }else{
                    self.add_event(title: title)
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    //テキストを追加する
    func add_event(title: String) {
        todo_list.append(title)
        todo_check.append(false)
        UserDefaults.standard.set(title, forKey: "todo_list_key")
        UserDefaults.standard.synchronize()
        print("保存が成功しました。")

        //追加されたアラートを表示する
        let alert = UIAlertController(title: "追加", message: ("入力された" + title + "は追加されました"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    //ショートカットを追加
    @IBAction func add_shortcut_button(_ sender: Any) {
        let alert = UIAlertController(title: "追加する内容", message: "ショートカットに新しい内容を追加します。", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_) in
            if let title = alert.textFields?[0].text
            {
                if title == ""{
                    let al = UIAlertController(title: "エラー", message: "テキストを入力してください", preferredStyle: .alert)
                    al.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(al, animated: true, completion: nil)
                }else{
                    self.add_shortcut(title: title)
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func add_shortcut(title: String) {
        segmentnames.append(title)
        UserDefaults.standard.set(title, forKey: "segment_key")
        UserDefaults.standard.synchronize()
        print("保存が成功しました。")
        
        //追加されたアラートを表示する
        let alert = UIAlertController(title: "追加", message: ("入力された" + "[" + title + "]" + "は追加されました"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
