//
//  PasteViewModel.swift
//  Clipboarded
//
//  Created by Leonardo Cardoso on 24/12/2016.
//  Copyright © 2016 leocardz.com. All rights reserved.
//

import UIKit
import CGFloatLiteral
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

protocol PasteViewModelType {
    
    // MARK: - Input
    var tapAction: PublishSubject<Void> { get }
    
    // MARK: - Output
    var pasteboardString: Variable<String> { get }
    var tapTextHidden: Variable<Bool> { get }
    var readTextHidden: Variable<Bool> { get }
    var errorTextHidden: Variable<Bool> { get }
    var saveTextHidden: Variable<Bool> { get }
    var deliverPicture: PublishSubject<UIImage?> { get }
    
    // MARK: - Initializers
    init()
    
}

class PasteViewModel: NSObject, PasteViewModelType {
    
    // MARK: - Properties
    private var processing: Bool = false
    private let pasteboard: UIPasteboard = UIPasteboard.general
    
    // MARK: - Rx
    private let disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Input
    var tapAction: PublishSubject<Void> = PublishSubject<Void>()
    
    // MARK: - Output
    var pasteboardString: Variable<String> = Variable("")
    var tapTextHidden: Variable<Bool> = Variable(false)
    var readTextHidden: Variable<Bool> = Variable(true)
    var errorTextHidden: Variable<Bool> = Variable(true)
    var saveTextHidden: Variable<Bool> = Variable(true)
    var deliverPicture: PublishSubject<UIImage?> = PublishSubject<UIImage?>()
    
    // MARK: - Initializers
    required override init() {
        
        super.init()
        
        self.tapAction
            .subscribe(
                onNext: { [] _ in
                    
                    if !self.processing {
                        
                        self.processing = true
                        
                        self.show(tap: false, read: true, save: false, error: false)
                        
                        Flow.async {
                            
                            if let image: UIImage = self.pasteboard.image {
                                
                                UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
                                
                            } else { self.error() }
                            
                        }
                        
                    }
                    
            }
            ).addDisposableTo(self.disposeBag)
        
    }
    
    // MARK: - Functions
    // Show and hide messages
    func show(tap: Bool, read: Bool, save: Bool, error: Bool) {
        
        self.tapTextHidden.value = !tap
        self.readTextHidden.value = !read
        self.saveTextHidden.value = !save
        self.errorTextHidden.value = !error
        
    }
    
    // Image saving process
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        
        if error == nil {
            
            self.show(tap: false, read: false, save: true, error: false)
            
            self.deliverPicture.onNext(image.RBSquareImageTo(size: CGSize(width: 200.f, height: 200.f)))
            
            self.reset()
            
        } else { self.error() }
        
    }
    
    // Error
    func error() {
        
        self.show(tap: false, read: false, save: false, error: true)
        
        if let string: String = self.pasteboard.string { self.pasteboardString.value = string }
        
        self.reset()
        
    }
    
    func reset() {
        
        Flow.delay(for: 2.5) {
            
            self.show(tap: true, read: false, save: false, error: false)
            
            self.pasteboardString.value = ""
            
            self.deliverPicture.onNext(nil)
            
            self.processing = false
        
        }
    
    }
    
}
