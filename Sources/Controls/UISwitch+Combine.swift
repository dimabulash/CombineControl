//
//  UISwitch+Combine.swift
//  CombineControl
//
//  Created by Dima Bulash on 08/03/2023.
//

#if os(iOS) || os(tvOS)
import Combine
import UIKit.UIControl

public extension UIControlPublishers where Self: UISwitch {
    /// Publisher that emits `isOn` whenever the value changes
    var isOnPublisher: AnyPublisher<Bool, Never> {
        PropertyPublisher(control: self, events: .valueChanged, keyPath: \.isOn)
            .map { $0.1 }
            .eraseToAnyPublisher()
    }
}
#endif
