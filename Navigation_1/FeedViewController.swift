import UIKit

class FeedViewController: UIViewController {
    var post = Post(title: "Пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        view.addSubview(postButton)
        setupPostButton()
    }
    
    let postButton: UIButton = {
        let uiButton = UIButton()
        uiButton.setTitle("Перейти на пост", for: .normal)
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        uiButton.addTarget(FeedViewController?.self, action: #selector(addPostButtonAction), for: .touchUpInside)
        return uiButton
    }()
    
    func setupPostButton() {
        postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        postButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc func addPostButtonAction() {
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        vc.titlePost = self.post.title
    }
}
