//
//  PasteViewModel.swift
//  Clipboarded
//
//  Created by Leonardo Cardoso on 24/12/2016.
//  Copyright © 2016 leocardz.com. All rights reserved.
//

#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

protocol PasteViewModelType {
    
    // MARK: - 2-way Binding
    
    // MARK: - Input
    
    // MARK: - Output
    
    // MARK: - Flow
    
    // MARK: - Initializers
    init()
    
}

class PasteViewModel: PasteViewModelType {
    
    // MARK: - Properties
    
    // MARK: - Rx
    private let disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - 2-way Binding
    
    // MARK: - Input
    
    // MARK: - Output
    
    // MARK: - Flow
    
    // MARK: - Initializers
    required init() {
        
    }
    
}
