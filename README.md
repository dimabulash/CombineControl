# CombineControl
![iOS 13.0+](https://img.shields.io/badge/iOS/tvOS-13%2B-green.svg) ![Swift 5.0+](https://img.shields.io/badge/Swift-5.0%2B-orange.svg) ![SPM](https://img.shields.io/badge/Swift%20Package%20Manager-Support-green.svg) 

Complete set of Combine publishers for UIControl classes.
## Installation
Add the following as a dependency to your `Package.swift`:
```swift
.package(url: "https://github.com/dimabulash/CombineControl.git"),
```
## Usage
```swift
import Combine
import CombineControl

var cancellables = Set<AnyCancellable>()

control.tap.sink {
    // triggered when control tapped
}
.store(in: &cancellables)

textField.textPublisher.sink { text in
    // triggered when textField text changes
}
.store(in: &cancellables)
```

## Publishers list
```swift
/// Publisher that emits whenever the
/// `touchUpInside` event trigger.
var tap: AnyPublisher<Void, Never>
```
#### UISwitch
```swift
/// Publisher that emits `isOn` whenever the value changes
var isOnPublisher: AnyPublisher<Bool, Never>
```
#### UISlider
```swift
/// Publisher that emits `value` whenever the value changes
var valuePublisher: AnyPublisher<Float, Never>
```
#### UIDatePicker
```swift
/// Publisher that emits `date` whenever the value changes
var datePublisher: AnyPublisher<Date, Never>
```
#### UISegmentedControl
```swift
/// Publisher that emits `selectedSegmentIndex` whenever the value changes
var indexPublisher: AnyPublisher<Int, Never>
```
#### UIStepper
```swift
/// Publisher that emits `value` whenever the value changes
var valuePublisher: AnyPublisher<Double, Never>
```
#### UITextField
```swift
/// Publisher that emits `text` whenever the
/// `valueChanged` or `allEditingEvents` events trigger
var textPublisher: AnyPublisher<String?, Never>

/// Publisher that emits `attributedText` whenever the
/// `valueChanged` or `allEditingEvents` events trigger
var attributedTextPublisher: AnyPublisher<NSAttributedString?, Never>

/// Publisher that emits whenever the
/// `editingDidEndOnExit` event trigger
var returnPublisher: AnyPublisher<Void, Never>

/// Publisher that emits whenever the
/// `editingDidBegin` event trigger
var didBeginEditingPublisher: AnyPublisher<Void, Never>
```
#### UIPageControl
```swift
/// Publisher that emits `currentPage` whenever the value changes
var pagePublisher: AnyPublisher<Int, Never>
```
#### UIControl
Supports all UIControl events:
```swift
/// - Parameter  events: UIControl events.
/// - Returns: Publisher that emits `self` whenever provided event trigger
func publisher(for events: UIControl.Event) -> AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `touchDown` event trigger.
var touchDown: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `touchDownRepeat` event trigger.
var touchDownRepeat: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `touchDragInside` event trigger.
var touchDragInside: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `touchDragOutside` event trigger.
var touchDragOutside: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `touchDragEnter` event trigger.
var touchDragEnter: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `touchDragExit` event trigger.
var touchDragExit: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `touchUpInside` event trigger.
var touchUpInside: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `touchUpOutside` event trigger.
var touchUpOutside: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `touchCancel` event trigger.
var touchCancel: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `valueChanged` event trigger.
var valueChanged: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `primaryActionTriggered` event trigger.
var primaryActionTriggered: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `menuActionTriggered` event trigger.
var menuActionTriggered: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `editingDidBegin` event trigger.
var editingDidBegin: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `editingChanged` event trigger.
var editingChanged: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `editingDidEnd` event trigger.
var editingDidEnd: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `editingDidEndOnExit` event trigger.
var editingDidEndOnExit: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `allTouchEvents` event trigger.
var allTouchEvents: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `allEditingEvents` event trigger.
var allEditingEvents: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `applicationReserved` event trigger.
var applicationReserved: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `systemReserved` event trigger.
var systemReserved: AnyPublisher<Self, Never>

/// Publisher that emits `self` whenever
/// the `allEvents` event trigger.
var allEvents: AnyPublisher<Self, Never>
```
