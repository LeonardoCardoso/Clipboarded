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
        
        guard
            let pasteView: PasteView = self.pasteView,
            let initialLabel: UILabel = pasteView.initialLabel,
            let readingLabel: UILabel = pasteView.readingLabel,
            let savedLabel: UILabel = pasteView.savedLabel,
            let errorLabel: UILabel = pasteView.errorLabel
            else { return }
        
        // Input
        pasteView.rx.controlEvent(.touchUpInside).bindNext({ viewModel.tapAction.onNext() }).addDisposableTo(self.disposeBag)
        
        // Output
        viewModel.tapTextHidden.asObservable().map({ $0 }).bindTo(initialLabel.rx.isHidden).addDisposableTo(self.disposeBag)
        viewModel.readTextHidden.asObservable().map({ $0 }).bindTo(readingLabel.rx.isHidden).addDisposableTo(self.disposeBag)
        viewModel.saveTextHidden.asObservable().map({ $0 }).bindTo(savedLabel.rx.isHidden).addDisposableTo(self.disposeBag)
        viewModel.errorTextHidden.asObservable().map({ $0 }).bindTo(errorLabel.rx.isHidden).addDisposableTo(self.disposeBag)
        
    }
    
}

