//
//  LabelStyleDecorator.swift
//  Decorator
//
//  Created by Andrey Soloviov on 11/8/20.
//

import UIKit

class LabelStyleDecorator: UIView, ViewDecorator {
  private weak var label: UILabel?
  private let kvoProperty = "text"
  
  var style: TextStyle = .body {
    didSet {
      if style != oldValue {
        applyStyle()
      }
    }
  }
  
  deinit {
    removeKVOObserver()
  }
  
  required init(object: UILabel) {
    self.label = object
    super.init(frame: .zero)
    object.addSubview(self)
    registerKVOObserver()
    applyStyle()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented. It's not meant to be used with Xib or Storyboard either.")
  }
}

extension LabelStyleDecorator {
  
  
  private func applyStyle() {
    guard let label = label else { return }
    label.attributedText = style.descriptor
      .attributedString(text: label.text ?? "")
  }
    
  private func registerKVOObserver() {
    guard let label = label else { return }
    label.addObserver(self,
                      forKeyPath: kvoProperty,
                      options: .new,
                      context: nil)
  }

  private func removeKVOObserver() {
    guard let label = label else { return }
    label.removeObserver(self,
                         forKeyPath: kvoProperty,
                         context: nil)
  }

  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    guard keyPath == kvoProperty,
          let object = object as? UILabel,
          object === label else { return }
    applyStyle()
  }
}
