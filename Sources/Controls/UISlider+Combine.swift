//
//  UISlider+Combine.swift
//  CombineControl
//
//  Created by Dima Bulash on 08/03/2023.
//

#if os(iOS) || os(tvOS)
import Combine
import UIKit.UIControl

public extension UIControlPublishers where Self: UISlider {
    /// Publisher that emits `value` whenever the value changes
    var valuePublisher: AnyPublisher<Float, Never> {
        PropertyPublisher(control: self, events: .valueChanged, keyPath: \.value)
            .map { $0.1 }
            .eraseToAnyPublisher()
    }
}
#endif
