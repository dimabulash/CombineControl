//
//  EventPublisher.swift
//  CombineControl
//
//  Created by Dima Bulash on 08/03/2023.
//

#if os(iOS) || os(tvOS)
import Combine
import UIKit.UIControl

// MARK: - Publisher
extension UIControl {
    internal struct EventPublisher<Control: UIControl>: Publisher {
        public typealias Output = Control
        public typealias Failure = Never

        private let control: Control
        private let events: Control.Event

        public init(control: Control,
                    events: Control.Event) {
            self.control = control
            self.events = events
        }

        public func receive<S: Subscriber>(subscriber: S) where S.Failure == Failure, S.Input == Output {
            let subscription = Subscription(subscriber: subscriber,
                                            control: control,
                                            events: events)

            subscriber.receive(subscription: subscription)
        }
    }
}

// MARK: - Subscription
private final class Subscription<S: Subscriber, Control: UIControl>: Combine.Subscription where S.Input == Control {
    private var subscriber: S?
    private weak var control: Control?
    private let events: Control.Event

    init(subscriber: S, control: Control, events: Control.Event) {
        self.subscriber = subscriber
        self.control = control
        self.events = events
        control.addTarget(self, action: #selector(event), for: events)
    }

    func cancel() {
        control?.removeTarget(self, action: #selector(event), for: events)
        subscriber = nil
    }

    @objc private func event() {
        guard let control else { return }
        _ = subscriber?.receive(control)
    }

    func request(_ demand: Subscribers.Demand) { }
}
#endif
