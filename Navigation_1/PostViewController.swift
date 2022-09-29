import UIKit

class PostViewController: UIViewController {
    var titlePost = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        navigationItem.title = titlePost
        
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openInfoViewController))
        
        navigationItem.rightBarButtonItem = myButton
    }
    
    @objc func openInfoViewController() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true, completion: nil)
    }
}
