//
//  ExampleViewController.swift
//  Decorator
//
//  Created by Andrey Soloviov on 10/8/20.
//

import UIKit

class ExampleViewController: UIViewController {

  @IBOutlet weak var headerLabel: UILabel?
  @IBOutlet weak var bodyLabel: UILabel?
  @IBOutlet weak var linkLabel: UILabel?

  override func viewDidLoad() {
    super.viewDidLoad()
    headerLabel?.style = .header
    bodyLabel?.style = .body
    linkLabel?
      .style(.hyperlink)
      .url(URL(string: "https://medium.com"))
  }
}

