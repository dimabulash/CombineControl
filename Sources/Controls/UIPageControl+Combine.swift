//
//  UIPageControl+Combine.swift
//  CombineControl
//
//  Created by Dima Bulash on 08/03/2023.
//

#if os(iOS) || os(tvOS)
import Combine
import UIKit.UIControl

public extension UIControlPublishers where Self: UIPageControl {
    /// Publisher that emits `currentPage` whenever the value changes
    var pagePublisher: AnyPublisher<Int, Never> {
        PropertyPublisher(control: self, events: .valueChanged, keyPath: \.currentPage)
            .map { $0.1 }
            .eraseToAnyPublisher()
    }
}
#endif
