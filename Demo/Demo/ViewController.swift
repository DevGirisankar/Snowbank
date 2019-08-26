//
//  ViewController.swift
//  Demo
//
//  Created by Giri on 26/08/19.
//  Copyright © 2019 Syoolah. All rights reserved.
//

import UIKit
import Snowbank

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Snowbank.initUser { (response, error) in
            
        }
    }


}

