import UIKit

class FeedViewController: UIViewController {
    var post = Post(title: "Пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        let uiButton = UIButton()
        self.view.addSubview(uiButton)
        uiButton.setTitle("Перейти на пост", for: .normal)
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        uiButton.addAction(UIAction(handler: {_ in
            let vc = PostViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            vc.titlePost = self.post.title
        }), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            uiButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
