//
//  ReachabilityManager.swift
//  365Live
//
//  Created by mac on 09/07/19.
//  Copyright © 2019 Engineer Babu. All rights reserved.
//

import UIKit

public protocol NetworkStatusListener : class {
    func networkStatusDidChange(status: Reachability.Connection)
}


class ReachabilityManager: NSObject {
    
    static  let shared = ReachabilityManager()
    
    // Boolean to track network reachability
    var isNetworkAvailable : Bool {
        return reachabilityStatus != .unavailable
    }
    
    // Tracks current NetworkStatus (notReachable, reachableViaWiFi, reachableViaWWAN)
    var reachabilityStatus: Reachability.Connection = .unavailable
    
    // Reachability instance for Network status monitoring
    let reachability =  try! Reachability()
    
    // Array of delegates which are interested to listen to network status change
    var listeners = [NetworkStatusListener]()
    
    /// Called whenever there is a change in NetworkReachibility Status
    ///
    /// — parameter notification: Notification with the Reachability instance
    @objc func reachabilityChanged(notification: Notification) {
        let reachability = notification.object as! Reachability
        if reachabilityStatus != reachability.connection{
            reachabilityStatus = reachability.connection
            switch reachability.connection {
            case .unavailable:
                debugPrint("Network became unreachable")
            case .wifi:
                debugPrint("Network reachable through WiFi")
            case .cellular:
                debugPrint("Network reachable through Cellular Data")
            case .none:
                debugPrint("Unkown netwoprk status")
            }
            
            // Sending message to each of the delegates
            for listener in listeners {
                listener.networkStatusDidChange(status: reachability.connection)
            }
        }
    }
    
    /// Starts monitoring the network availability status
    func startMonitoring() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.reachabilityChanged),
                                               name: Notification.Name.reachabilityChanged,
                                               object: reachability)
        do{
            try reachability.startNotifier()
        } catch {
            debugPrint("Could not start reachability notifier")
        }
    }
    
    /// Stops monitoring the network availability status
    func stopMonitoring(){
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self,
                                                  name: Notification.Name.reachabilityChanged,
                                                  object: reachability)
    }
    
    /// Adds a new listener to the listeners array
    ///
    /// - parameter delegate: a new listener
    func addListener(listener: NetworkStatusListener){
        listeners.append(listener)
    }
    
    /// Removes a listener from listeners array
    ///
    /// - parameter delegate: the listener which is to be removed
    func removeListener(listener: NetworkStatusListener){
        listeners = listeners.filter{ $0 !== listener}
    }
}
