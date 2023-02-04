//
//  trash_shortcut_ViewController.swift
//  main_todo_list
//
//  Created by kaito on 2023/01/29.
//

import UIKit

class trash_shortcut_ViewController: UIViewController, UITableViewDataSource{
    
    //ショートカット削除用のtableview
    @IBOutlet weak var trash_event_tableview: UITableView!
    //loadlabel
    @IBOutlet weak var load_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ショートカットを読み込む
        if let segmentnames_obj = UserDefaults.standard.object(forKey: "segment_key") as? [String] {
            segmentnames = segmentnames_obj
        } else {
            segmentnames = [String]()
        }
        print(segmentnames)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segmentnames.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trash_event_cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        trash_event_cell.textLabel?.text = segmentnames[indexPath.row]
        
        return trash_event_cell
    }
    
    //セルの消去
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        segmentnames.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .top)
    }
    
    //読み込む
    @IBAction func load(_ sender: Any) {
        if let segmentnames_obj = UserDefaults.standard.object(forKey: "segment_key") as? [String] {
            load_label.text = "ショートカットはあります"
        } else {
            load_label.text = "ショートカットはありません"
        }
    }
}
