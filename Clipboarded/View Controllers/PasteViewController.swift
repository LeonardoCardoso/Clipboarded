//
//  PasteViewController.swift
//  Clipboarded
//
//  Created by Leonardo Cardoso on 24/12/2016.
//  Copyright © 2016 leocardz.com. All rights reserved.
//

import UIKit
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

class PasteViewController: BaseViewController {
    
    // MARK: - Properties
    private var pasteView: PasteView?
    
    // MARK: - Initializers
    convenience init(viewModel: PasteViewModelType) {
        
        self.init()
        
        self.edgesForExtendedLayout = []
        
        // Attach the custom view to UIViewController's view
        self.pasteView = PasteView(superview: self.view)
        self.pasteView?.layout()
        
        self.configureBindings(viewModel: viewModel)
        
    }
    
    // MARK: - ViewModel Configuration
    private func configureBindings(viewModel: PasteViewModelType) {
        
        
    }
    
}

