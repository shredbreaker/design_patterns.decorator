//
//  TextStyleDescriptor.swift
//  Decorator
//
//  Created by Andrey Soloviov on 10/8/20.
//

import UIKit

struct TextStyleDescriptor {
  var font: TextStyle.Font
  var modifiers: Set<TextStyle.Modifiers> = []
  var textAlignment: NSTextAlignment?
  var lineHeightMultiple: CGFloat?
}

extension TextStyleDescriptor {
  func attributes(additional: [NSAttributedString.Key: Any]? = nil) -> [NSAttributedString.Key: Any] {
    var attributes = buildAttributes()
    additional?.forEach { key, value in
      attributes[key] = value
    }
    return attributes
  }
  
  /// Create NSAttributedString that could be assigned to UILabel, UITextField or UITextView
  func attributedString(text: String, additional: [NSAttributedString.Key: Any]? = nil) -> NSAttributedString {
    let textAttributes = self.attributes(additional: additional)
    let modifiedText = modify(text)
    return NSAttributedString(string: modifiedText, attributes: textAttributes)
  }
  
  /// Modifying source text based on modifiers property
  func modify(_ text: String) -> String {
    if modifiers.contains(.caps) {
      return text.uppercased()
    } else {
      return text
    }
  }
}

extension TextStyleDescriptor {
  var uiFont: UIFont {
    switch font {
    case let .custom(name, size):
      // We use force unwrap to crash on the QA stage in case we haven't properly import custom font to the project
      return UIFont(name: name, size: size)!
    case let .system(size, weight):
      return .systemFont(ofSize: size, weight: weight)
    }
  }
  
  // Building NSAttributedString
  private func  buildAttributes() -> [NSAttributedString.Key: Any] {
    var textAttributes = [NSAttributedString.Key: Any]()
    textAttributes[.font] = uiFont

    modifiers.forEach { modifier in
      switch modifier {
      case .underline: textAttributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
      default: break
      }
    }
    
    if let paragraphStyle = self.paragraphStyle {
      textAttributes[.paragraphStyle] = paragraphStyle
    }
    
    return textAttributes
  }
  
  private var paragraphStyle: NSMutableParagraphStyle? {
    if lineHeightMultiple == nil, textAlignment == nil { return nil }
    let paragraphStyle = NSMutableParagraphStyle()
    
    if let alignment = textAlignment {
      paragraphStyle.alignment = alignment
    }
    
    if let lineHeightMultiply = lineHeightMultiple {
      paragraphStyle.lineHeightMultiple = lineHeightMultiply
    }
    
    return paragraphStyle
  }
}
