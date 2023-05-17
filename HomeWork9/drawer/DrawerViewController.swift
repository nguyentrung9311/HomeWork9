//
//  DrawerViewController.swift
//  HomeWork9
//
//  Created by Nguyen Trung on 5/17/23.
//

import UIKit

class DrawerViewController: UIViewController {
    @IBOutlet var drawerView: UIView!
    @IBOutlet weak var tileView: TileView!
    @IBOutlet weak var constraintVertical: NSLayoutConstraint!
    
    var timer: Timer? = nil
    let stepHeight = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isHidden = true
        constraintVertical.constant = -(view.bounds.height / 2 + tileView.bounds.height / 2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.isHidden = false
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: { [self] timer in
            let value = constraintVertical.constant + CGFloat(stepHeight)
            if value >= (view.bounds.height / 2 - tileView.bounds.height / 2) {
                constraintVertical.constant = (view.bounds.height / 2 - tileView.bounds.height / 2)
                timer.invalidate()
            } else {
                constraintVertical.constant += CGFloat(stepHeight)
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
}
