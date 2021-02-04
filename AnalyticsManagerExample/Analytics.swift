//
//  Events.swift
//  Ways
//
//  Created by Marcos Vinicius Majeveski De Angeli on 26/01/21.
//

import Foundation
import Firebase

class AnalyticsManager{
    
    /// Unique instance of EventManager (SINGLETON)
    static var shared: AnalyticsManager = AnalyticsManager()
    
    
    // --- Stored Properties
//    var authorizationHandlerTrigger: AuthorizationHandlerTrigger = .NotTraceable
    // --- Stored Properties
    
    
    fileprivate init(){}
    
    /// Logs an app event in Firebase Analytics.
    /// - Parameters:
    ///   - name: The name of the event.
    ///   - parameters: The dictionary of event parameters. Passing nil indicates that the event has no parameters.
    static func logEvent(_ event: AnalyticsEvent) {
        //        #if !DEBUG
        Analytics.logEvent(event.name, parameters: event.parameters)
        //        #endif
    }
    
}

/// All events and its parameters
enum AnalyticsEvent {
    case ButtonTapped
    case SliderNumber(number: Int)
    case PickerSelected(color: String)
    case FormSent(number: Int, color: String)
}

extension AnalyticsEvent{
    /// The name sent to the Analyitics Dashboard
    var name: String {
        switch self {
            case .ButtonTapped:
                return "button_tapped"
                
            case .SliderNumber:
                return "slider_number"
                
            case .PickerSelected:
                return "picker_selected"
                
            case .FormSent:
                return "form_sent"
        }
    }
}

extension AnalyticsEvent{
    /// The parameters dictionary sent to the Analyitics Dashboard
    var parameters: [String : Any]? {
        switch self {
            case .SliderNumber(let number):
                return ["Number" : number]
                
            case .PickerSelected(let color):
                return ["Color" : color]
                
            case .FormSent(let number, let color):
                return ["Number" : number, "Color" : color]
                    
            default:
                return nil
        }
    }
}
