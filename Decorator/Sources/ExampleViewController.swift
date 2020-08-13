//
//  ExampleViewController.swift
//  Decorator
//
//  Created by Andrey Soloviov on 10/8/20.
//

import UIKit

class ExampleViewController: UIViewController {

  @IBOutlet weak var headerLabel: UILabel!
  @IBOutlet weak var bodyLabel: UILabel?
  @IBOutlet weak var linkLabel: UILabel?
  @IBOutlet weak var priceOldLabel: UILabel?
  @IBOutlet weak var priceNewLabel: UILabel?

  override func viewDidLoad() {
    super.viewDidLoad()
    headerLabel?.style(.header)
    bodyLabel?.style(.body)
    linkLabel?
      .style(.hyperlink)
      .url(URL(string: "https://medium.com"))
    
    priceOldLabel?.style(.price(crossed: true))
    priceNewLabel?.style(.price())
    

    headerLabel.url = URL(string: "https://medium.com")
//    let hyperlinkDecorator = HyperlinkDecoratorOld(label: headerLabel!)
//    hyperlinkDecorator.url = URL(string: "https://medium.com")
//    self.hyperlinkDecorator = hyperlinkDecorator
    
  }
}


class ViewController: UIViewController {  
  @IBOutlet weak var hyperLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    hyperLabel.url = URL(string: "https://medium.com")
  }
}

