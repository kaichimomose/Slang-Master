//
//  DisplaySlangViewController.swift
//  Slang Master
//
//  Created by Kaichi Momose on 2017/10/19.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

protocol SlangDelegate: class {
    func checkSlang(selectedSlang: Slang)
}

class DisplaySlangViewController: UIViewController, SlangDelegate {
    
    @IBOutlet weak var whatSlangLabel: UILabel!
    @IBOutlet weak var slangWordLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var nextWordButton: UIButton!
    @IBOutlet weak var slangImage: UIImageView!
    
    static let slangs = [
        Slang(word: "Dope", mean: "awsome", image: "dope"),
        Slang(word: "Dank", mean: "cool", image: "dank" ),
        Slang(word: "To Flake", mean: "To ditch", image: "flake"),
        Slang(word: "Bumpin'", mean: "enjoying litening music", image: "bumpin"),
        Slang(word: "Wildin'out", mean: "acting crazy",image: "wildinout"),
        Slang(word: "Clutch", mean: "performing under pressure", image: "clutch")
    ]
    
    static func randomSlang() -> Slang {
        let index = Int(arc4random()) % slangs.count
        return slangs[index]
    }
    
    var selectedSlang: Slang?
    var displaySlang: Slang = randomSlang()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slangWordLabel.text = displaySlang.word
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToChooseWordViewController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let chooseWordController = storyboard.instantiateViewController(withIdentifier: "ChooseWordViewController") as! ChooseWordTableViewController
        
        chooseWordController.slangs = DisplaySlangViewController.slangs
        
        chooseWordController.delegate = self
        
        self.navigationController?.pushViewController(chooseWordController, animated: true)
        
    }
    
    func checkSlang(selectedSlang: Slang) {
        self.selectedSlang = selectedSlang
        
        if selectedSlang == displaySlang {
            whatSlangLabel.text = "You're right! \(displaySlang.word) means \"\(displaySlang.mean)\""
        } else {
            whatSlangLabel.text = "Your guess was wrong, \(displaySlang.word) means \"\(displaySlang.mean)\""
        }
        
        slangImage.loadGif(name: displaySlang.image)
    }
    
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        goToChooseWordViewController()
    }
    
    @IBAction func nextWordButtonTapped(_ sender: UIButton) {
        let randomSlang = DisplaySlangViewController.randomSlang()
        displaySlang = randomSlang
        slangWordLabel.text = randomSlang.word
        whatSlangLabel.text = "What does this slang word mean?"
        slangImage.image = nil
    }
    
}
