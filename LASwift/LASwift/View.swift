//
//  View.swift
//  LASwift
//
//  Created by Andres Arciniegas on 6/15/16.
//  Copyright © 2016 Andres Arciniegas. All rights reserved.

import UIKit

class View: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.darkGrayColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}