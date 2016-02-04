//
//  ViewController.swift
//  StackViewsDemo
//
//  Created by Parker Rushton on 11/12/15.
//  Copyright © 2015 Parker Rushton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var axisButton: UIButton!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var animatedSwitch: UISwitch!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var alphaSwitch: UISwitch!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = true
    }
    
    
    // MARK: - IBActions
    
    @IBAction func buttonPressed(sender: AnyObject) {
        toggleAxis()
    }
    
    @IBAction func removeOrangeButtonPressed(sender: UIButton) {
        toggleOrangeView(!orangeView.hidden)
    }
    
    
    // MARK: - Private functions
    
    private func toggleAxis() {
        if animatedSwitch.on {
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.mainStack.axis = self.mainStack.axis == .Vertical ? .Horizontal : .Vertical
                }, completion: { success in
                    self.handleAxisChangeComplete()
//                    self.removeLastSubview() // Uncomment to see what removing the last arrangedSubview looks like
            })
        } else {
            mainStack.axis = mainStack.axis == .Vertical ? .Horizontal : .Vertical
            handleAxisChangeComplete()
//            removeLastSubview() // Uncomment to see what removing the last arrangedSubview looks like
        }
    }
    
    private func handleAxisChangeComplete() {
        axisButton.setTitle(mainStack.axis == .Horizontal ? "Horizontal" : "Veritcal", forState: .Normal)
    }
    
    private func removeLastSubview(hidden: Bool = true) { // If `false` views are removed from `arrangedSubviews` but still visible ( and no longer managed by the stackView)
            let last = mainStack.arrangedSubviews.last!
            last.hidden = hidden
            mainStack.removeArrangedSubview(last)
            print("Subviews: \(mainStack.subviews.count)")
            print("ArrangedSubviews: \(mainStack.arrangedSubviews.count)")
    }
    
    private func toggleOrangeView(remove: Bool) {
        if animatedSwitch.on {
            UIView.animateWithDuration(0.5, animations: {
                self.orangeView.hidden = remove
                self.orangeView.alpha = self.alphaSwitch.on && remove ? 0 : 1
            })
        } else {
            orangeView.hidden = remove
        }
        orangeButton.setTitle(orangeView.hidden ? "Add" : "Remove", forState: .Normal)
    }
    
}
