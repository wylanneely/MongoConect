//
//  ViewController.swift
//  MongoDB
//
//  Created by ALIA M NEELY on 9/8/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mongoController = MongoController()
    var messages: [MGMessage] = []
    
    @IBOutlet weak var messageText: UITextField!
    
    @IBAction func postMessageButtonTapped(_ sender: Any) {
        guard let text = messageText.text, text != "" else {return}
        let message = MGMessage(message: text)
        mongoController.postMessage(message: message) { (success) in
            if success == true {
                print("success")
                } else {
                print("error posting ot mongoDB")
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mongoController.fetchTest { (message) in
            self.messages = message
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

