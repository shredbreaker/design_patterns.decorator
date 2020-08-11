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
  var paragraph: Set<TextStyle.Paragraph> = []
}

extension TextStyleDescriptor {
  func attributedString(text: String) -> NSAttributedString {
    let textAttributes = buildAttributes()
//    let textAttributes = self.attributes(additional: additional)
    let modifiedText = modify(text)
    return NSAttributedString(string: modifiedText, attributes: textAttributes)
  }
}

extension TextStyleDescriptor {
//  private func attributes(additional: [NSAttributedString.Key: Any]? = nil) -> [NSAttributedString.Key: Any] {
//    var attributes = buildAttributes()
//    additional?.forEach { key, value in
//      attributes[key] = value
//    }
//    return attributes
//  }
//
  private func modify(_ text: String) -> String {
    if modifiers.contains(.caps) {
      return text.uppercased()
    } else {
      return text
    }
  }
}

extension TextStyleDescriptor {

  private func buildAttributes() -> [NSAttributedString.Key: Any] {
    var textAttributes = [NSAttributedString.Key: Any]()
    textAttributes[.font] = uiFont
    
    if let attributes = self.modifierAttributes {
      attributes.forEach { key, value in
        textAttributes[key] = value
      }
    }
    
    if let paragraphStyle = self.paragraphStyle {
      textAttributes[.paragraphStyle] = paragraphStyle
    }
    return textAttributes
  }
  
  private var uiFont: UIFont {
    switch font {
    case let .custom(name, size):
      // Force unwrap using "!" to detect issue during development
      return UIFont(name: name, size: size)!
    case let .system(size, weight):
      return .systemFont(ofSize: size, weight: weight)
    }
  }
  
  private var modifierAttributes: [NSAttributedString.Key: Any]? {
    guard modifiers.count > 0 else { return nil }
    
    var textAttributes = [NSAttributedString.Key: Any]()
    modifiers.forEach { modifier in
      switch modifier {
      case .underline: textAttributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
      case .strikethrough: textAttributes[.strikethroughStyle] = NSUnderlineStyle.single.rawValue
      default: break
      }
    }
    return textAttributes
  }
  
  private var paragraphStyle: NSParagraphStyle? {
    guard paragraph.count > 0 else { return nil }
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraph.forEach { style in
      switch style {
      case .lineHeightMultiple(let value):
        paragraphStyle.lineHeightMultiple = value
      case .textAlignment(let value):
        paragraphStyle.alignment = value
      }
    }
    return paragraphStyle
  }
}
