//
//  ChooseWordTableViewController.swift
//  Slang Master
//
//  Created by Kaichi Momose on 2017/10/19.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

class ChooseWordTableViewController: UIViewController {
    
    var slangs: [Slang] = []
    var selectedword: Slang?
    
    var delegate: SlangDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ChooseWordTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return slangs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordTableViewCell", for: indexPath)
        
        cell.textLabel?.text =  slangs[indexPath.row].mean
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedSlang = slangs[indexPath.row]
        
        
        // TODO:  You will want to inform your delegate HERE that a pokemon was selected
        delegate?.checkSlang(selectedSlang: selectedSlang)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
