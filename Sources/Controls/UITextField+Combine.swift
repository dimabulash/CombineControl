//
//  UITextField+Combine.swift
//  CombineControl
//
//  Created by Dima Bulash on 08/03/2023.
//

#if os(iOS) || os(tvOS)
import Combine
import UIKit.UIControl

public extension UIControlPublishers where Self: UITextField {
    /// Publisher that emits `text` whenever the
    /// `valueChanged` or `allEditingEvents` events trigger
    var textPublisher: AnyPublisher<String?, Never> {
        PropertyPublisher(control: self,
                          events: [.valueChanged, .allEditingEvents],
                          keyPath: \.text)
        .map { $0.1 }
        .eraseToAnyPublisher()
    }

    /// Publisher that emits `attributedText` whenever the
    /// `valueChanged` or `allEditingEvents` events trigger
    var attributedTextPublisher: AnyPublisher<NSAttributedString?, Never> {
        PropertyPublisher(control: self,
                          events: [.valueChanged, .allEditingEvents],
                          keyPath: \.attributedText)
        .map { $0.1 }
        .eraseToAnyPublisher()
    }

    /// Publisher that emits whenever the
    /// `editingDidEndOnExit` event trigger
    var returnPublisher: AnyPublisher<Void, Never> {
        publisher(for: .editingDidEndOnExit).map { _ in }
            .eraseToAnyPublisher()
    }

    /// Publisher that emits whenever the
    /// `editingDidBegin` event trigger
    var didBeginEditingPublisher: AnyPublisher<Void, Never> {
        publisher(for: .editingDidBegin).map { _ in }
            .eraseToAnyPublisher()
    }
}
#endif
