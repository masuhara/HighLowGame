//
//  ResultViewController.swift
//  HighRowGame
//
//  Created by Masuhara on 2018/08/03.
//  Copyright © 2018年 Ylab, Inc. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDataSource {
    
    var resultArray: [Bool]?
    
    @IBOutlet var resultTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTableView.dataSource = self
        
        let ud = UserDefaults.standard
        resultArray = ud.object(forKey: "resultArray") as? [Bool]
        resultArray?.reverse()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let resultArray = resultArray {
            return resultArray.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        if let resultArray = resultArray {
            if resultArray[indexPath.row] == true {
                cell.textLabel?.text = "正解"
            } else {
                cell.textLabel?.text = "不正解"
            }
        }
        return cell
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }

}
