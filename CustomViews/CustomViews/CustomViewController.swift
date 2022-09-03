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
    
    public static func create<T: CustomViewController>(viewControllerType: T.Type, data: [String: Any]? = nil) -> T {
        
        let screenName = String(describing: viewControllerType.self)
        
        let viewController = UIStoryboard(name: screenName, bundle: .main).instantiateViewController(withIdentifier: screenName) as! T
        
        viewController.inheritatedData = data
        return viewController
    }
    
    private var inheritatedData: [String: Any]? = nil
}
