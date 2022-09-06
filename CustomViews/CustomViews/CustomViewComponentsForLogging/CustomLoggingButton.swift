//
//  CustomLoggingButton.swift
//  CustomViews
//
//  Created by Houston Park on 2022/09/06.
//

import UIKit


open class CustomButton: UIButton {
    
    @IBInspectable
    var eventName: String?
    
    var loggingParameters: [String: Any]? = nil
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isTouchInside {
            guard let parentViewController = parentViewController() as? CustomViewController else {
                return
            }
            CustomViewController.loggingDelegate?.whenButtonClicked(viewController: parentViewController, clickedButton: self, parameters: loggingParameters ?? [:])
        }
        
        super.touchesEnded(touches, with: event)
    }
}

extension UIView {
    
    func parentViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        }
        else if let nextResponder = self.next as? UIView {
            return nextResponder.parentViewController()
        } else {
            return nil
        }
    }
}
