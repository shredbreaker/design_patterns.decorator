//
//  UIView+Subviews.swift
//  Decorator
//
//  Created by Andrey Soloviov on 11/8/20.
//

import UIKit

extension UIView {
  func subview<V: UIView>(type: V.Type = V.self ) -> V? {
    return subviews.first(where: { $0 is V }) as? V
  }
}
