//
//  PropertyPublisher.swift
//  CombineControl
//
//  Created by Dima Bulash on 08/03/2023.
//

#if os(iOS) || os(tvOS)
import Combine
import UIKit.UIControl

// MARK: - Publisher
public extension UIControl {
    /// EventPublisher is a publisher that
    /// emits `self` and keyPath `value`
    /// whenever the provided events trigger.
    struct PropertyPublisher<Control: UIControl, Value>: Publisher {
        public typealias Output = (Control, Value)
        public typealias Failure = Never

        private let control: Control
        private let events: Control.Event
        private let keyPath: KeyPath<Control, Value>

        /// - parameter control: UIControl.
        /// - parameter events: UIControl Events.
        /// - parameter keyPath: A Key Path from the UI Control to the requested value.
        public init(control: Control,
                    events: Control.Event,
                    keyPath: KeyPath<Control, Value>) {
            self.control = control
            self.events = events
            self.keyPath = keyPath
        }

        public func receive<S: Subscriber>(subscriber: S) where S.Failure == Failure, S.Input == Output {
            let subscription = Subscription(subscriber: subscriber,
                                            control: control,
                                            events: events,
                                            keyPath: keyPath)

            subscriber.receive(subscription: subscription)
        }
    }
}

// MARK: - Subscription
private final class Subscription<S: Subscriber, Control: UIControl, Value>: Combine.Subscription where S.Input == (Control, Value) {
    private var subscriber: S?
    private weak var control: Control?
    private let events: Control.Event
    private let keyPath: KeyPath<Control, Value>
    private var initialWasFired: Bool = false

    init(subscriber: S, control: Control, events: Control.Event, keyPath: KeyPath<Control, Value>) {
        self.subscriber = subscriber
        self.control = control
        self.events = events
        self.keyPath = keyPath
        control.addTarget(self, action: #selector(event), for: events)
    }

    func cancel() {
        control?.removeTarget(self, action: #selector(event), for: events)
        subscriber = nil
    }

    @objc private func event() {
        guard let control else { return }
        _ = subscriber?.receive((control, control[keyPath: keyPath]))
    }

    func request(_ demand: Subscribers.Demand) {
        guard let control, let subscriber, !initialWasFired else { return }
        _ = subscriber.receive((control, control[keyPath: keyPath]))
        initialWasFired = true
    }
}
#endif
