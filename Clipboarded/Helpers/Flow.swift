//
//  Flow.swift
//  Clipboarded
//
//  Created by Leonardo Cardoso on 25/12/2016.
//  Copyright © 2016 leocardz.com. All rights reserved.
//

import Foundation

class Flow {
    
    // MARK: - Functions
    // Execute code block asynchronously
    static func async(block: @escaping () -> Void) { DispatchQueue.main.async(execute: block) }
    
    // Execute code block asynchronously after given delay time
    static func delay(for delay: TimeInterval, block: @escaping () -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: block)
        
    }
    
}
