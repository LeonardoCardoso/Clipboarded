//
//  BaseViewController.swift
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

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    // MARK: - Rx
    let disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Initializers
    init() { super.init(nibName: nil, bundle: nil) }
    
    required convenience init?(coder aDecoder: NSCoder) { self.init() }
    
    
}
