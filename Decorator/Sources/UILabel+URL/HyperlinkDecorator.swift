//
//  HyperlinkDecorator.swift
//  Decorator
//
//  Created by Andrey Soloviov on 13/8/20.
//

import UIKit

class HyperlinkDecoratorOld: UIView, ViewDecorator {
  var url: URL?
  weak var object: UIView?

  required init(object: UIView) {
    self.object = object
    super.init(frame: .zero)

    object.isUserInteractionEnabled = true
    object.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hyperlinkedLabelTapped)))

    object.addSubview(self)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc private func hyperlinkedLabelTapped() {
    if let url = url, UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.open(url)
    }
  }
}

class HyperlinkDecorator: UIView, ViewDecorator {
  var url: URL?
  weak var label: UILabel?
  
  required init(object: UILabel) {
    self.label = object
    super.init(frame: .zero)
    object.isUserInteractionEnabled = true
    object.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hyperlinkedLabelTapped)))
    object.addSubview(self)
  }
  
  // It's required to have for UIView subclasses
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  
  @objc private func hyperlinkedLabelTapped() {
    if let url = url, UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.open(url)
    }
  }
}
