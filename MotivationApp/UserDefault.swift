//
//  UserDefault.swift
//  MotivationApp
//
//  Created by Manal alwayeli on 15/06/1444 AH.
//

import Foundation


extension UserDefaults {
    @objc dynamic var savedImageName: String {
        get { string(forKey: "savedImageName") ?? "bg2" }
        set { setValue(newValue, forKey: "savedImageName") }
    }
}


