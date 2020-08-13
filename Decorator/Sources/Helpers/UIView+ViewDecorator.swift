//
//  UIView+DynamicDecorator.swift
//  Decorator
//
//  Created by Andrey Soloviov on 13/8/20.
//

import UIKit

extension UIView {
  func viewDecorator<V: ViewDecorator>(type: V.Type = V.self) -> V {
    return subview(type: V.self) ?? V(object: self as! V.View)
  }
}
