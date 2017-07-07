//
//  SecondViewController.swift
//  StackViewsDemo
//
//  Created by Parker Rushton on 2/4/16.
//  Copyright © 2016 Parker Rushton. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
