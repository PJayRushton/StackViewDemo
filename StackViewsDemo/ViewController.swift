//
//  ViewController.swift
//  StackViewsDemo
//
//  Created by Parker Rushton on 11/12/15.
//  Copyright © 2015 Parker Rushton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var axisButton: UIButton!
    @IBOutlet weak var animatedSwitch: UISwitch!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var alphaSwitch: UISwitch!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func axisButtonPressed(_ sender: AnyObject) {
        toggleAxis(animatedSwitch.isOn)
    }
    
    @IBAction func removeButtonPressed(_ sender: UIButton) {
        toggleOrangeView(remove: !orangeView.isHidden)
    }
    
}

extension ViewController {

    fileprivate func toggleAxis(_ animated: Bool = true) {
        if animated {
            UIView.animate(withDuration: 1, animations: {
                self.mainStack.axis = self.mainStack.axis == .vertical ? .horizontal : .vertical
            }, completion: { success in
                    self.updateAxisButtonTitle()
            })
        } else {
            mainStack.axis = mainStack.axis == .vertical ? .horizontal : .vertical
            updateAxisButtonTitle()
        }
    }
    
    fileprivate func updateAxisButtonTitle() {
        let newTitle = mainStack.axis == .horizontal ? "Go vertical" : "Go horizontal"
        axisButton.setTitle(newTitle, for: UIControlState())
    }
    
    // MARK: - Toggle orange view
    
    fileprivate func toggleOrangeView(remove: Bool) {
        if animatedSwitch.isOn {
            UIView.animate(withDuration: 0.5, animations: {
                self.orangeView.isHidden = remove
                self.orangeView.alpha = self.alphaSwitch.isOn && remove ? 0 : 1
            })
        } else {
            orangeView.isHidden = remove
        }
    }
    
}
