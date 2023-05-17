//
//  ViewController.swift
//  HomeWork9
//
//  Created by Nguyen Trung on 5/17/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onStartAnimation(_ sender: Any) {
        let drawerVC = DrawerViewController()
        drawerVC.modalPresentationStyle = .fullScreen
        present(drawerVC, animated: true)
    }
}

