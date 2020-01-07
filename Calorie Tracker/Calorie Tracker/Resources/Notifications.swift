//
//  Notifications.swift
//  Calorie Tracker
//
//  Created by Brandi Bailey on 1/6/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

import Foundation

extension Notification.Name {
    static var caloriesAdded = Notification.Name("caloriesWereAdded")
}

extension NotificationCenter {
    func postOnMainThread(name: NSNotification.Name, object: Any?) {
        DispatchQueue.main.async {
            NotificationCenter.self.default.post(name: name, object: object)
        }
    }
}
