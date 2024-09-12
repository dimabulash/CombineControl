//
//  UIDatePicker+Combine.swift
//  CombineControl
//
//  Created by Dima Bulash on 08/03/2023.
//

#if os(iOS) || os(tvOS)
import Combine
import UIKit.UIControl

public extension UIControlPublishers where Self: UIDatePicker {
    /// Publisher that emits `date` whenever the value changes
    var datePublisher: AnyPublisher<Date, Never> {
        PropertyPublisher(control: self, events: .valueChanged, keyPath: \.date)
            .map { $0.1 }
            .eraseToAnyPublisher()
    }
}
#endif
