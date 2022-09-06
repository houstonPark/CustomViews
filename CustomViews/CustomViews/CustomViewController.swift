//
//  CustomViewController.swift
//  CustomViews
//
//  Created by Houston Park on 2022/09/03.
//

import UIKit

open class CustomViewController: UIViewController {
    
    open var presentingStyle: PresentingStyle {
        .navigationPush
    }
    
    open var screenName: String {
        ""
    }
    
    static var loggingDelegate: CustomLoggingDelegate?
    
    public static func create<T: CustomViewController>(viewControllerType: T.Type, data: [String: Any]? = nil) -> T {
        
        let screenName = String(describing: viewControllerType.self)
        
        let viewController = UIStoryboard(name: screenName, bundle: .main).instantiateViewController(withIdentifier: screenName) as! T
        
        viewController.inheritatedData = data
        return viewController
    }
    
    private var inheritatedData: [String: Any]? = nil
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        CustomViewController.loggingDelegate?.whenViewDidAppear(viewController: self, parameters: [:])
        
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        CustomViewController.loggingDelegate?.whenViewDidDisappear(viewController: self, parameters: [:])
    }
    
    
    open func showViewController(targetViewController: CustomViewController) {
        switch targetViewController.presentingStyle {
        case .presentFullScreen:
            targetViewController.modalPresentationStyle = .fullScreen
            present(targetViewController, animated: true)
        case .presentModal:
            present(targetViewController, animated: true)
        case .navigationPush:
            navigationController?.pushViewController(targetViewController, animated: true)
        }
    }
    
    open func dismissViewController() {
        switch presentingStyle {
        case .navigationPush:
            navigationController?.popViewController(animated: true)
        case .presentModal, .presentFullScreen:
            dismiss(animated: true)
        }
    }
    
    open func buttonClickLoggingEvent(button: CustomButton, parameters: [String: Any]) {
        CustomViewController.loggingDelegate?.whenButtonClicked(viewController: self, clickedButton: button, parameters: parameters)
    }
}
