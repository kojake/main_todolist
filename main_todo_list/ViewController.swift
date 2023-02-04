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
        } else {
            todo_list = [String]()
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
    }
    
    //読み込む
    @IBAction func load_button(_ sender: Any) {
        tableview.reloadData()
    }
    
}
