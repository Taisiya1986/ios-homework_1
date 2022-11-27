import UIKit

class ProfileViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: "cell1")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var arrayOfPosts = [Post1]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        arrayOfPosts = [firstPost, secondPost, thirdPost, fourthPost]
    }
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return arrayOfPosts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! PhotosTableViewCell
            cell.galleryButton.addTarget(self, action: #selector(goToGallery), for: .touchUpInside)
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
            let model = arrayOfPosts[indexPath.row]
            cell.authorLabel.text = model.author
            cell.someImageView.image = UIImage(named: model.imageName)
            cell.descriptionLabel.text = model.description
            cell.numberOfLikesLabel.text = "Likes:\(model.likes)"
            cell.numberOfViewsLabel.text = "Views:\(model.views)"
            
            let tapgesture = UITapGestureRecognizer.init(target: self, action: #selector(addLike))
            tapgesture.numberOfTapsRequired = 1
            cell.numberOfLikesLabel.isUserInteractionEnabled = true
            cell.numberOfLikesLabel.addGestureRecognizer(tapgesture)
            cell.numberOfLikesLabel.tag = indexPath.row
            
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(showPost))
            tap.numberOfTapsRequired = 1
            cell.someImageView.isUserInteractionEnabled = true
            cell.someImageView.addGestureRecognizer(tap)
            cell.someImageView.tag = indexPath.row
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 165
        } else {
            return 600
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = ProfileHeaderView()
            return headerView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 260
        } else {
            return 0
        }
    }
    
    @objc func goToGallery() {
        let photosVC = PhotosViewController()
        self.navigationController?.pushViewController(photosVC, animated: true)
    }
    
    @objc func addLike(gesture: UITapGestureRecognizer) {
        let indexPath = IndexPath(row: gesture.view!.tag, section: 1)
        let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
        let model = arrayOfPosts[indexPath.row]
        cell.numberOfLikesLabel.text = "Likes:\(model.likes + 1)"
    }
    
    @objc func showPost(gesture: UITapGestureRecognizer) {
        let showPostVC = ShowPostViewController()
        self.present(showPostVC, animated: true)
        let indexPath = IndexPath(row: gesture.view!.tag, section: 1)
        let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
        let model = arrayOfPosts[indexPath.row]
        showPostVC.view = cell
        cell.numberOfViewsLabel.text = "Views:\(model.views + 1)"
    }
    
}

