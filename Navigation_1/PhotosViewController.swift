import UIKit

class PhotosViewController: UIViewController {
    
    let photosCollectionView = PhotosCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Gallery"
        view.addSubview(photosCollectionView)
        photosCollectionView.backgroundColor = .white
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

