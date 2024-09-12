//
//  CombineControl.swift
//  CombineControl
//
//  Created by Dima Bulash on 08/03/2023.
//

#if os(iOS) || os(tvOS)
import Combine
import UIKit.UIControl

public protocol UIControlPublishers: UIControl {}

extension UIControl: UIControlPublishers {}

#endif
