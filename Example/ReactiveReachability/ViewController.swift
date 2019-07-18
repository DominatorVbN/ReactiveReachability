//
//  ViewController.swift
//  ReactiveReachability
//
//  Created by DominatorVbN on 07/18/2019.
//  Copyright (c) 2019 DominatorVbN. All rights reserved.
//

import UIKit
import ReactiveReachability

class ViewController: UIViewController {

    @IBOutlet weak var networkStatusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ReachabilityManager.shared.addListener(listener: self)
        ReachabilityManager.shared.startMonitoring()
    }
    deinit {
        ReachabilityManager.shared.removeListener(listener: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController: NetworkStatusListener{
    func networkStatusDidChange(status: Reachability.Connection) {
        switch status {
        case .cellular, .wifi:
            networkStatusLabel.text = "Online"
        default:
            networkStatusLabel.text = "Offline"
        }
    }
}
