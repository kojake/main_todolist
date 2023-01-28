//
//  ViewController.swift
//  main_todo_list
//
//  Created by kaito on 2023/01/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource{
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
        
        //ショートカットを読み込む
        if let segmentnames_obj = UserDefaults.standard.object(forKey: "segment_key") as? [String] {
            segmentnames = segmentnames_obj
        } else {
            segmentnames = [String]()
        }
        
        segment.removeAllSegments()
        for (index, name) in segmentnames.enumerated() {
            segment.insertSegment(withTitle: name, at: index, animated: false)
        }
        tableview.reloadData()
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
        
        
        return TodoCell
    }
    
}
