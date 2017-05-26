import UIKit
import MarkdownView

class Example1ViewController: UIViewController {

  //Just for unit testing
  public var onMarkdownRendered: (() -> Void)?

  override func viewDidLoad() {
    super.viewDidLoad()

    let mdView = MarkdownView()
    view.addSubview(mdView)
    mdView.translatesAutoresizingMaskIntoConstraints = false
    mdView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
    mdView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    mdView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    mdView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true

    let path = Bundle.main.path(forResource: "sample", ofType: "md")!

    let url = URL(fileURLWithPath: path)
    let markdown = try! String(contentsOf: url, encoding: String.Encoding.utf8)
    mdView.load(markdown: markdown)
    mdView.onRendered = { [weak self] _ in
      self?.onMarkdownRendered?()
    }

  }

  static func make() -> Example1ViewController {
    return UIStoryboard(
      name: "Main", bundle: nil
    ).instantiateViewController(withIdentifier: "Example1") as! Example1ViewController
  }

}

