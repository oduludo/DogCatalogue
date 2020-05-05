//
//  StackedImageView.swift
//  Doggify
//
//  Created by Ludo van Orden on 30/04/2020.
//  Copyright © 2020 Ludo van Orden. All rights reserved.
//

import UIKit
import Kingfisher


class StackedImageView: UIView {

    let backgroundImageView = UIImageView()
    let presentationImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundImageView.backgroundColor = .red
        self.addSubview(self.backgroundImageView)
        let backgroundImageViewLeading = NSLayoutConstraint(item: self.backgroundImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)
        let backgroundImageViewTrailing = NSLayoutConstraint(item: self.backgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)
        let backgroundImageViewTop = NSLayoutConstraint(item: self.backgroundImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
        let backgroundImageViewBottom = NSLayoutConstraint(item: self.backgroundImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([backgroundImageViewLeading, backgroundImageViewTrailing, backgroundImageViewTop, backgroundImageViewBottom])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
