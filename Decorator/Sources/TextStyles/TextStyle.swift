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
  enum Font {
    case custom(name: String, size: CGFloat)
    case system(size: CGFloat, weight: UIFont.Weight = .regular)
  }
  
  enum Modifiers {
    case caps
    case underline
    case strikethrough
  }
  
  enum Paragraph: Hashable {
    case textAlignment(_ value: NSTextAlignment)
    case lineHeightMultiple(_ value: CGFloat)
  }
}
