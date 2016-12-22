//
//  ColorExtension.swift
//  NYC_EatTheAlphabet
//
//  Created by Erica Millado on 10/9/16.
//  Copyright © 2016 Erica Millado. All rights reserved.
//

import Foundation

extension UIColor{
    
    class func getRandomColor() -> UIColor{
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
    }
    
}

