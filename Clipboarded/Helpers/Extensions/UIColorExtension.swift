//
//  UIColorExtension.swift
//  Clipboarded
//
//  Created by Leonardo Cardoso on 24/12/2016.
//  Copyright © 2016 leocardz.com. All rights reserved.
//

import UIKit
import CGFloatLiteral

extension UIColor {
    
    // MARK: - App's custom colors
    open class var blueText: UIColor { return UIColor("#16757C") }
    open class var blueBackground: UIColor { return UIColor("#2A2A37") }
    open class var redText: UIColor { return UIColor("#C20A26") }
    open class var greenText: UIColor { return UIColor("#0BA24A") }
    open class var purpleText: UIColor { return UIColor("#8B1D6D") }
    
    // MARK: - Input
    public convenience init(_ hexString: String, alpha: CGFloat = 1.0) {
        
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) { cString.remove(at: cString.startIndex) }
        
        if ((cString.characters.count) != 6) { self.init(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.f)} else {
            
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
            
        }
        
    }
    
}

