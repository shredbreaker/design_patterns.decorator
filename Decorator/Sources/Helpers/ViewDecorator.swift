//
//  ViewDecorator.swift
//  Decorator
//
//  Created by Andrey Soloviov on 14/8/20.
//

import UIKit

protocol ViewDecorator: UIView {
  associatedtype View: UIView
  init(object: View)
}
