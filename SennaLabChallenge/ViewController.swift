//
//  ViewController.swift
//  SennaLabChallenge
//
//  Created by Chace Teera on 20/01/2020.
//  Copyright © 2020 chaceteera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Hello World")
        

    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let alertController = UIAlertController(title: "Hello World", message: nil, preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: { (action) in
            let seconds: Double = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: {
                self.dismiss(animated: true, completion: nil)

            })
            
        })
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

