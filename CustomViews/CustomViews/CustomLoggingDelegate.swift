//
//  CustomLoggingDelegate.swift
//  CustomViews
//
//  Created by Houston Park on 2022/09/06.
//

import Foundation

protocol CustomLoggingDelegate {
    
    func whenViewDidAppear(viewController: CustomViewController, parameters: [String: Any])
    
    func whenViewDidDisappear(viewController: CustomViewController, parameters: [String: Any])
    
    func whenButtonClicked(viewController: CustomViewController, clickedButton: CustomButton, parameters: [String: Any])
}

class CustomLoggingDelegateImplemention: CustomLoggingDelegate {
    
    func sendAnalytics(EventName: String, Parameters: [String: Any]) {
        print("Event Name: ", EventName)
        print("Parameters: ", Parameters)
    }
    
    func whenViewDidAppear(viewController: CustomViewController, parameters: [String: Any]) {
        
        var param = parameters
        param = ["screenName": viewController.screenName]
        
        sendAnalytics(EventName: "View Appear", Parameters: param)
    }
    
    func whenViewDidDisappear(viewController: CustomViewController, parameters: [String: Any]) {
        
        var param = parameters
        param = ["screenName": viewController.screenName]
        
        sendAnalytics(EventName: "View Disappear", Parameters: param)
    }
    
    func whenButtonClicked(viewController: CustomViewController, clickedButton: CustomButton, parameters: [String: Any]) {
        
        var param = parameters
        
        if let eventName = clickedButton.eventName {
            param = ["event": eventName]
        }
        
        sendAnalytics(EventName: "Click", Parameters: param)
    }
}
