//
//  Device.swift
//  Clipboarded
//
//  Created by Leonardo Cardoso on 24/12/2016.
//  Copyright © 2016 leocardz.com. All rights reserved.
//

import DeviceKit

extension Device {
    
    // All devices with iPhone 4 sizes
    var isPhone4Size: Bool { return self.isOneOf([.iPhone4, .simulator(.iPhone4), .iPhone4s, .simulator(.iPhone4s)]) }
    
    // All devices with iPhone 5 sizes
    var isPhone5Size: Bool {
        
        return self.isOneOf([.iPhone5, .simulator(.iPhone5), .iPhone5s, .simulator(.iPhone5s), .iPhone5c, .simulator(.iPhone5c), .iPhoneSE, .simulator(.iPhoneSE)])
        
    }
    
    // All devices with iPhone 6 sizes
    var isPhone6Size: Bool { return self.isOneOf([.iPhone6, .simulator(.iPhone6), .iPhone6s, .simulator(.iPhone6s), .iPhone7, .simulator(.iPhone7)]) }
    
    // All devices with Plus sizes
    var isPhone6PSize: Bool {
        
        return self.isOneOf([.iPhone6Plus, .simulator(.iPhone6Plus), .iPhone6sPlus, .simulator(.iPhone6sPlus), .iPhone7Plus, .simulator(.iPhone7Plus)])
        
    }
    
    // Return proper dimension
    var properDimentions: DimensionsType {
        
        if(self.isPhone4Size) { return Dimensions4() }
        else if(self.isPhone5Size) { return Dimensions5() }
        else if(self.isPhone6Size) { return Dimensions6() }
        else { return Dimensions6P() }
        
    }
    
}
