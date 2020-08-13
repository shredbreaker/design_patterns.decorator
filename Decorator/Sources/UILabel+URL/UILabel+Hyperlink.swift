//
//  UILabel+Hyperlink.swift
//  Decorator
//
//  Created by Andrey Soloviov on 11/8/20.
//

import UIKit

//extension UILabel {
//  var url: URL? {
//    get { subview(type: HyperlinkDecorator.self)?.url }
//    set {
//      let decorator = subview(type: HyperlinkDecorator.self) ?? HyperlinkDecorator(label: self)
//      decorator.url = newValue
//    }
//  }
//
//  @discardableResult func url(_ url: URL?) -> Self {
//    self.url = url
//    return self
//  }
//}
//
//extension UILabel {
//  func subview<V: UIView>(type: V.Type = V.self ) -> V? {
//    return subviews.first(where: { $0 is V }) as? V
//  }
//}

extension UILabel {
  var url: URL? {
    get { viewDecorator(type: HyperlinkDecorator.self).url }
    set { viewDecorator(type: HyperlinkDecorator.self).url = newValue }
  }

  @discardableResult func url(_ url: URL?) -> Self {
    self.url = url
    return self
  }
}



