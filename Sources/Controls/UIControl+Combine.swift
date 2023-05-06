//
//  UIControl+Combine.swift
//  CombineControl
//
//  Created by Dima Bulash on 08/03/2023.
//

#if os(iOS) || os(tvOS)
import Combine
import UIKit.UIControl

public extension UIControlPublishers {
    /// - Parameter events: UIControl events.
    /// - Returns: AnyPublisher
    func publisher(for events: UIControl.Event) -> AnyPublisher<Self, Never> {
        EventPublisher(control: self, events: events).map { $0 }
            .eraseToAnyPublisher()
    }

    /// Publisher that emits whenever the
    /// `touchUpInside` event trigger.
    var tap: AnyPublisher<Void, Never> {
        publisher(for: .touchUpInside)
            .map { _ in }
            .eraseToAnyPublisher()
    }

    /// Publisher that emits `self` whenever
    /// the `touchDown` event trigger.
    var touchDown: AnyPublisher<Self, Never> {
        publisher(for: .touchDown)
    }

    /// Publisher that emits `self` whenever
    /// the `touchDownRepeat` event trigger.
    var touchDownRepeat: AnyPublisher<Self, Never> {
        publisher(for: .touchDownRepeat)
    }

    /// Publisher that emits `self` whenever
    /// the `touchDragInside` event trigger.
    var touchDragInside: AnyPublisher<Self, Never> {
        publisher(for: .touchDragInside)
    }

    /// Publisher that emits `self` whenever
    /// the `touchDragOutside` event trigger.
    var touchDragOutside: AnyPublisher<Self, Never> {
        publisher(for: .touchDragOutside)
    }

    /// Publisher that emits `self` whenever
    /// the `touchDragEnter` event trigger.
    var touchDragEnter: AnyPublisher<Self, Never> {
        publisher(for: .touchDragEnter)
    }

    /// Publisher that emits `self` whenever
    /// the `touchDragExit` event trigger.
    var touchDragExit: AnyPublisher<Self, Never> {
        publisher(for: .touchDragExit)
    }

    /// Publisher that emits `self` whenever
    /// the `touchUpInside` event trigger.
    var touchUpInside: AnyPublisher<Self, Never> {
        publisher(for: .touchUpInside)
    }

    /// Publisher that emits `self` whenever
    /// the `touchUpOutside` event trigger.
    var touchUpOutside: AnyPublisher<Self, Never> {
        publisher(for: .touchUpOutside)
    }

    /// Publisher that emits `self` whenever
    /// the `touchCancel` event trigger.
    var touchCancel: AnyPublisher<Self, Never> {
        publisher(for: .touchCancel)
    }

    /// Publisher that emits `self` whenever
    /// the `valueChanged` event trigger.
    var valueChanged: AnyPublisher<Self, Never> {
        publisher(for: .valueChanged)
    }

    /// Publisher that emits `self` whenever
    /// the `primaryActionTriggered` event trigger.
    var primaryActionTriggered: AnyPublisher<Self, Never> {
        publisher(for: .primaryActionTriggered)
    }

    /// Publisher that emits `self` whenever
    /// the `menuActionTriggered` event trigger.
    @available(iOS 14.0, *)
    var menuActionTriggered: AnyPublisher<Self, Never> {
        publisher(for: .menuActionTriggered)
    }

    /// Publisher that emits `self` whenever
    /// the `editingDidBegin` event trigger.
    var editingDidBegin: AnyPublisher<Self, Never> {
        publisher(for: .editingDidBegin)
    }

    /// Publisher that emits `self` whenever
    /// the `editingChanged` event trigger.
    var editingChanged: AnyPublisher<Self, Never> {
        publisher(for: .editingChanged)
    }

    /// Publisher that emits `self` whenever
    /// the `editingDidEnd` event trigger.
    var editingDidEnd: AnyPublisher<Self, Never> {
        publisher(for: .editingDidEnd)
    }

    /// Publisher that emits `self` whenever
    /// the `editingDidEndOnExit` event trigger.
    var editingDidEndOnExit: AnyPublisher<Self, Never> {
        publisher(for: .editingDidEndOnExit)
    }

    /// Publisher that emits `self` whenever
    /// the `allTouchEvents` event trigger.
    var allTouchEvents: AnyPublisher<Self, Never> {
        publisher(for: .allTouchEvents)
    }

    /// Publisher that emits `self` whenever
    /// the `allEditingEvents` event trigger.
    var allEditingEvents: AnyPublisher<Self, Never> {
        publisher(for: .allEditingEvents)
    }

    /// Publisher that emits `self` whenever
    /// the `applicationReserved` event trigger.
    var applicationReserved: AnyPublisher<Self, Never> {
        publisher(for: .applicationReserved)
    }

    /// Publisher that emits `self` whenever
    /// the `systemReserved` event trigger.
    var systemReserved: AnyPublisher<Self, Never> {
        publisher(for: .systemReserved)
    }

    /// Publisher that emits `self` whenever
    /// the `allEvents` event trigger.
    var allEvents: AnyPublisher<Self, Never> {
        publisher(for: .allEvents)
    }
}
#endif
