//
//  UILabel+Style.swift
//  Decorator
//
//  Created by Andrey Soloviov on 11/8/20.
//

import UIKit

extension UILabel {  
  var style: TextStyle {
    get { viewDecorator(type: LabelStyleDecorator.self).style }
    set { viewDecorator(type: LabelStyleDecorator.self).style = newValue }
  }
  
  @discardableResult func style(_ style: TextStyle) -> Self { self.style = style; return self }
}
