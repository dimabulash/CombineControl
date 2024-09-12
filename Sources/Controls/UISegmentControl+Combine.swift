//
//  UISegmentControl+Combine.swift
//  CombineControl
//
//  Created by Dima Bulash on 08/03/2023.
//

#if os(iOS) || os(tvOS)
import Combine
import UIKit.UIControl

public extension UIControlPublishers where Self: UISegmentedControl {
    /// Publisher that emits `selectedSegmentIndex` whenever the value changes
    var indexPublisher: AnyPublisher<Int, Never> {
        PropertyPublisher(control: self, events: .valueChanged, keyPath: \.selectedSegmentIndex)
            .map { $0.1 }
            .eraseToAnyPublisher()
    }
}
#endif
