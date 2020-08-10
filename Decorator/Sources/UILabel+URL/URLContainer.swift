//
//  URLContainer.swift
//  Decorator
//
//  Created by Andrey Soloviov on 11/8/20.
//

import UIKit

class URLContainer: UIView {
  var url: URL?
  weak var parent: UIView?
  
  init(url: URL?, parent: UIView) {
    self.url = url
    self.parent = parent
    super.init(frame: .zero)
    parent.addSubview(self)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
