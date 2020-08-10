//
//  LabelStyle.swift
//  Decorator
//
//  Created by Andrey Soloviov on 11/8/20.
//

import UIKit

class LabelStyle: UIView {
  
  private weak var label: UILabel?
  private let textObserverProperty = "text"
  
  var style: TextStyle = .body {
    didSet {
      if style != oldValue, let label = label {
        applyStyle(label.text)
      }
    }
  }
  
  deinit {
    removeTextObserver()
  }
  
  init(label: UILabel) {
    self.label = label
    super.init(frame: .zero)
    label.addSubview(self)
    registerTextObserver()
    applyStyle(label.text)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented. It's not meant to be used with Xib or Storyboard either.")
  }
  
}

extension LabelStyle {
  private func applyStyle(_ text: String? = nil) {
    label?.attributedText = style.descriptor.attributedString(text: text ?? "")
  }
    
  private func registerTextObserver() {
    guard let label = label else { return }
    label.addObserver(self, forKeyPath: textObserverProperty, options: .new, context: nil)
  }
  
  private func removeTextObserver() {
    guard let label = label else { return }
    label.removeObserver(self, forKeyPath: textObserverProperty, context: nil)
  }
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    guard keyPath == textObserverProperty, let object = object as? UILabel, object === label else { return }
    applyStyle()
  }
}
