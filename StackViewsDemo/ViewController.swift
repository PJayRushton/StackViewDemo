//
//  ViewController.swift
//  StackViewsDemo
//
//  Created by Parker Rushton on 11/12/15.
//  Copyright © 2015 Parker Rushton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stack: UIStackView!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stack.axis = UILayoutConstraintAxis.Horizontal
        stack.leadingAnchor
    }
    
    func changeAxis(animated animated: Bool) {
        if animated {
            UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: UIViewAnimationOptions.LayoutSubviews, animations: { () -> Void in
                self.stack.axis = self.stack.axis == .Vertical ? .Horizontal : .Vertical
                self.button.setTitle(self.stack.axis == .Vertical ? "Vertical" : "Horizontal", forState: .Normal)
                self.stack.subviews.last!.hidden = !self.stack.subviews.last!.hidden
                }, completion: nil)
        } else {
            stack.axis = stack.axis == .Vertical ? .Horizontal : .Vertical
            self.button.setTitle(self.stack.axis == .Vertical ? "Vertical" : "Horizontal", forState: .Normal)
            stack.setNeedsLayout()
        }
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        changeAxis(animated: true)
    }

}

