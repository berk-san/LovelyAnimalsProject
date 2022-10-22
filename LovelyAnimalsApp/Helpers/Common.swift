//
//  Common.swift
//  LovelyAnimalsApp
//
//  Created by Berk on 17.10.2022.
//

import Foundation
import UIKit

class Common: NSObject {
    
    class func showAlert(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        vc.present(alert, animated: true)
    }
    
    class func setupLayout() {
        let colorBackground = UIColor(red: 243/255.0, green: 224/255.0, blue: 181/255.0, alpha: 1)
        let colorOrange = UIColor(red: 255/255, green: 110/255, blue: 18/255, alpha: 0.8)
        let colorBorderOrange = CGColor(red: 255/255, green: 110/255, blue: 18/255, alpha: 0.8)

    }
}
