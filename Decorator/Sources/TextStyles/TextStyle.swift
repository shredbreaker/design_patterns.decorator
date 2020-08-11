//
//  TextStyles.swift
//  Decorator
//
//  Created by Andrey Soloviov on 10/8/20.
//

import UIKit

/// Deifine list of text styles
enum TextStyle: Equatable {
  case header
  case body
  case hyperlink
  case price(crossed: Bool = false)
}

extension TextStyle {
  /// Information about font, allow us to add custom font or use system one
  enum Font {
    case custom(name: String, size: CGFloat)
    case system(size: CGFloat, weight: UIFont.Weight = .regular)
  }
  
  /// List of modifiers for text processing
  enum Modifiers {
    case caps
    case underline
    case strikethrough
  }
}
