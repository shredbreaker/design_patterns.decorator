//
//  UILabel+Style.swift
//  Decorator
//
//  Created by Andrey Soloviov on 11/8/20.
//

import UIKit

extension UILabel {  
  var style: TextStyle {
    get {
      let labelStyle = subview(type: LabelStyle.self) ?? LabelStyle(label: self)
      return labelStyle.style
    }
    set {
      let labelStyle = subview(type: LabelStyle.self) ?? LabelStyle(label: self)
      labelStyle.style = newValue
    }
  }
  
  @discardableResult func style(_ style: TextStyle) -> Self {
    self.style = style
    return self
  }
}
