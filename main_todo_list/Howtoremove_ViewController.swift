//
//  Howtoremove_ViewController.swift
//  main_todo_list
//
//  Created by kaito on 2023/02/04.
//

import UIKit

class Howtoremove_ViewController: UIViewController,UITableViewDataSource{
    
    var remove_list = [String]()
    
    //削除用tableview
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        remove_list.removeAll()
        for i in 1...6{
            remove_list.append("削除テスト")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return remove_list.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        TodoCell.textLabel?.text = remove_list[indexPath.row]
        
        
        return TodoCell
    }
    
    //セルの消去
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        remove_list.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .top)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loadView()
            self.viewDidLoad()
        }
    }
    
}
