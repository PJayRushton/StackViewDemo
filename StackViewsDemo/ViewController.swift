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
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func axisButtonPressed(sender: AnyObject) {
        toggleAxis(animatedSwitch.on)
    }
    
    @IBAction func removeButtonPressed(sender: UIButton) {
        toggleOrangeView(remove: !orangeView.hidden)
    }
    
}

extension ViewController {

    private func toggleAxis(animated: Bool = true) {
        if animated {
            UIView.animateWithDuration(1, animations: {
                self.mainStack.axis = self.mainStack.axis == .Vertical ? .Horizontal : .Vertical
            }, completion: { success in
                    self.updateAxisButtonTitle()
            })
        } else {
            mainStack.axis = mainStack.axis == .Vertical ? .Horizontal : .Vertical
            updateAxisButtonTitle()
        }
    }
    
    private func updateAxisButtonTitle() {
        let newTitle = mainStack.axis == .Horizontal ? "Go vertical" : "Go horizontal"
        axisButton.setTitle(newTitle, forState: .Normal)
    }
    
    // MARK: - Toggle orange view
    
    private func toggleOrangeView(remove remove: Bool) {
        if animatedSwitch.on {
            UIView.animateWithDuration(0.5, animations: {
                self.orangeView.hidden = remove
                self.orangeView.alpha = self.alphaSwitch.on && remove ? 0 : 1
            })
        } else {
            orangeView.hidden = remove
        }
    }
    
}
