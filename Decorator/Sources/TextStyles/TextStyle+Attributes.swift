//
//  TextStyle+Attributes.swift
//  Decorator
//
//  Created by Andrey Soloviov on 10/8/20.
//

import UIKit

extension TextStyle {
  var descriptor: TextStyleDescriptor {
    switch self {
    case .header: return headerDescriptor
    case .body: return bodyDescriptor
    case .hyperlink: return hyperlinkDescriptor
    }
  }
  
  private var headerDescriptor: TextStyleDescriptor {
    TextStyleDescriptor(font: .custom(name: "Lobster-Regular", size: 20.0), modifiers: [.caps], textAlignment: .center)
  }
  
  private var bodyDescriptor: TextStyleDescriptor {
    TextStyleDescriptor(font: .system(size: 14, weight: .thin), lineHeightMultiple: 1.13)
  }
  
  private var hyperlinkDescriptor: TextStyleDescriptor {
    TextStyleDescriptor(font: .system(size: 14, weight: .light), modifiers: [.underline], textAlignment: .right)
  }
}
