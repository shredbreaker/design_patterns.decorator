//
//  UILabel+Hyperlink.swift
//  Decorator
//
//  Created by Andrey Soloviov on 11/8/20.
//

import UIKit

extension UILabel {
  
  var url: URL? {
    get {
      subview(type: URLContainer.self)?.url
    }
    set {
      if let urlContainer = subview(type: URLContainer.self) {
        urlContainer.url = newValue
      } else {
        _ = URLContainer(url: newValue, parent: self)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hyperlinkedLabelTapped)))
      }
    }
  }
  
  @discardableResult func url(_ url: URL?) -> Self {
    self.url = url
    return self
  }
  
}

extension UILabel {
  @objc private func hyperlinkedLabelTapped() {
    if let url = url, UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.open(url)
    }
  }
}

