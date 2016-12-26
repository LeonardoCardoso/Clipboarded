//
//  PasteView.swift
//  Clipboarded
//
//  Created by Leonardo Cardoso on 24/12/2016.
//  Copyright © 2016 leocardz.com. All rights reserved.
//

import Foundation

import UIKit
import Then
import CGFloatLiteral
import SnapKit
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

class PasteView: UIControl {
    
    // MARK: - Properties
    var imageView: UIImageView?
    var dataLabel: UILabel?
    var initialLabel: UILabel?
    var readingLabel: UILabel?
    var savedLabel: UILabel?
    var errorLabel: UILabel?
    
    // MARK: - Initializers
    init(superview: UIView) {
        
        super.init(frame: .zero)
        
        self.backgroundColor = .blueBackground
        
        self.configureSubviews()
        
        if let view: UIImageView = self.imageView { self.addSubview(view) }
        if let view: UILabel = self.dataLabel { self.addSubview(view) }
        if let view: UILabel = self.initialLabel { self.addSubview(view) }
        if let view: UILabel = self.readingLabel { self.addSubview(view) }
        if let view: UILabel = self.savedLabel { self.addSubview(view) }
        if let view: UILabel = self.errorLabel { self.addSubview(view) }
        
        superview.addSubview(self)
        
    }
    
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    // MARK: - Functions
    // Configure Subviews
    func configureSubviews() {
        
        self.imageView = UIImageView().then {
            
            $0.backgroundColor = .clear
            
        }
        
        self.dataLabel = UILabel().then {
            
            $0.textColor = .white
            $0.numberOfLines = 1
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 20.f)
            
        }
        
        self.initialLabel = UILabel().then {
            
            $0.textColor = .blueText
            $0.text = R.string.localizable.tapToPaste().uppercased()
            self.commonAttributes($0)
            
        }
        
        self.readingLabel = UILabel().then {
            
            $0.textColor = .purpleText
            $0.text = R.string.localizable.readingClipboard().uppercased()
            $0.isHidden = true
            self.commonAttributes($0)
            
        }
        
        self.savedLabel = UILabel().then {
            
            $0.textColor = .greenText
            $0.text = R.string.localizable.imageSaved().uppercased()
            $0.isHidden = true
            self.commonAttributes($0)
            
        }
        
        self.errorLabel = UILabel().then {
            
            $0.textColor = .redText
            $0.text = R.string.localizable.dataNotImage().uppercased()
            $0.isHidden = true
            self.commonAttributes($0)
            
        }
        
    }
    
    // Common label attributes
    func commonAttributes(_ label: UILabel) {
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 40.f)
        label.sizeToFit()
        
    }
    
    // Set up layout
    func layout() {
        
        self.snp.makeConstraints { (make) -> Void in
            
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            
        }
        
        self.imageView?.snp.makeConstraints { (make) -> Void in
            
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
            make.width.equalToSuperview().inset(50)
            
        }
        
        self.dataLabel?.snp.makeConstraints { (make) -> Void in
            
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
            make.width.equalToSuperview().inset(50)
            make.height.equalTo(40)
            
        }
        
        self.initialLabel?.snp.makeConstraints { (make) -> Void in self.commonConstraints(make) }
        
        self.readingLabel?.snp.makeConstraints { (make) -> Void in self.commonConstraints(make) }
        
        self.savedLabel?.snp.makeConstraints { (make) -> Void in self.commonConstraints(make) }
        
        self.errorLabel?.snp.makeConstraints { (make) -> Void in self.commonConstraints(make) }
        
    }
    
    // Common label constraints
    func commonConstraints(_ make: ConstraintMaker) {
        
        make.center.equalToSuperview()
        make.width.equalToSuperview().inset(50)
        make.height.equalTo(300)
        
    }
    
    
}
