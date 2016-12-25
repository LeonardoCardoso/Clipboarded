//
//  PasteViewModel.swift
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

protocol PasteViewModelType {
    
    // MARK: - Input
    var tapAction: PublishSubject<Void> { get }
    
    // MARK: - Output
    var tapTextHidden: Variable<Bool> { get }
    var readTextHidden: Variable<Bool> { get }
    var errorTextHidden: Variable<Bool> { get }
    var saveTextHidden: Variable<Bool> { get }
    var deliverPicture: PublishSubject<UIImage?> { get }
    
    // MARK: - Initializers
    init()
    
}

class PasteViewModel: PasteViewModelType {
    
    // MARK: - Properties
    private var processing: Bool = false
    
    // MARK: - Rx
    private let disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Input
    var tapAction: PublishSubject<Void> = PublishSubject<Void>()
    
    // MARK: - Output
    var tapTextHidden: Variable<Bool> = Variable(false)
    var readTextHidden: Variable<Bool> = Variable(true)
    var errorTextHidden: Variable<Bool> = Variable(true)
    var saveTextHidden: Variable<Bool> = Variable(true)
    var deliverPicture: PublishSubject<UIImage?> = PublishSubject<UIImage?>()
    
    // MARK: - Initializers
    required init() {
        
        self.tapAction
            .subscribe(
                onNext: { [weak self] _ in
                    
                    if let p: Bool = self?.processing, !p {
                        
                        self?.processing = true
                        
                        self?.show(tap: false, read: true, save: false, error: false)
                        
                        Flow.delay(for: 1.0) {
                            
                            
                            self?.show(tap: false, read: false, save: true, error: false)
                            
                            //                self?.deliverPicture.onNext(nil)
                            
                            self?.processing = false
                            
                        }
                        
                    }
                    
                }
            ).addDisposableTo(self.disposeBag)
        
    }
    
    // MARK: - Functions
    func show(tap: Bool, read: Bool, save: Bool, error: Bool) {
        
        self.tapTextHidden.value = !tap
        self.readTextHidden.value = !read
        self.saveTextHidden.value = !save
        self.errorTextHidden.value = !error
        
    }
    
}
