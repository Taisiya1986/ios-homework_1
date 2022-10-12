import UIKit

class ProfileViewController: UIViewController {
    
    let profile = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(profile)
        setupProfileView()
    }
    
    func setupProfileView() {
        profile.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profile.widthAnchor.constraint(equalTo: view.widthAnchor),
            profile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profile.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

}

