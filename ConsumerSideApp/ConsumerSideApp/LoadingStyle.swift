//
//  LoadingStyle.swift
//  ConsumerSideApp
//
//  Created by Frederik Lohner on 9/Mar/16.
//  Copyright © 2016 Writing. All rights reserved.
//

import Foundation
import GradientCircularProgress

public struct LoadingStyle : StyleProperty {
    /*** style properties **********************************************************************************/
     
     // Progress Size
    public var progressSize: CGFloat = 200
    
    // Gradient Circular
    public var arcLineWidth: CGFloat = 3.0
    public var startArcColor: UIColor = UIColor.clearColor()
    public var endArcColor: UIColor = UIColor(red:0.69, green:0.73, blue:0.75, alpha:1.0)
    
    // Base Circular
    public var baseLineWidth: CGFloat? = 3.0
    public var baseArcColor: UIColor? = UIColor.darkGrayColor()
    
    // Ratio
    public var ratioLabelFont: UIFont? = UIFont(name: "Verdana-Bold", size: 16.0)
    public var ratioLabelFontColor: UIColor? = UIColor.whiteColor()
    
    // Message
    public var messageLabelFont: UIFont? = UIFont.systemFontOfSize(16.0)
    public var messageLabelFontColor: UIColor? = UIColor.whiteColor()
    
    // Background
    public var backgroundStyle: BackgroundStyles = .Dark
    
    /*** style properties **********************************************************************************/
    
    public init() {}
}