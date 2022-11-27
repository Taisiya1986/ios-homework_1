import UIKit

class PhotosCollectionView: UICollectionView {
    
    var arrayOfPhotos = [UIImage]()
    
    let button = UIButton()
    
    let view = UIView()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        super.init(frame: .zero, collectionViewLayout: layout)
        register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.reusableID)
        contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        dataSource = self
        delegate = self
        
        for i in 0...19 {
            let image = UIImage(named: "image\(i)")!
            arrayOfPhotos.append(image)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.reusableID, for: indexPath) as! PhotosCollectionViewCell
        let image = arrayOfPhotos[indexPath.item]
        cell.photo.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.bounds.width-32)/3, height: (collectionView.bounds.width-32)/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.5, delay: 0, animations: { [self] in
            view.backgroundColor = UIColor(white: 1, alpha: 0.5)
            collectionView.addSubview(view)
            view.isHidden = false
            view.frame = collectionView.bounds
            cell?.superview?.bringSubviewToFront(cell!)
            cell!.frame.size.width = collectionView.frame.width
            cell!.frame.size.height = collectionView.frame.width
            cell!.center.x = collectionView.center.x - 8
            cell!.center.y = collectionView.center.y - 100
            
        }, completion: { finished in
            UIView.animate(withDuration: 0.3, delay: 0, animations: { [self] in
                cell?.addSubview(button)
                button.alpha = 1
                button.frame = CGRect(x: 385, y: 5, width: 20, height: 20)
                button.setBackgroundImage(UIImage(named: "multiply"), for: .normal)
                button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
            })
        })
    }
    
    @objc func backButtonAction() {
        UIView.animate(withDuration: 0.3, animations: {
            self.button.alpha = 0
            
        }, completion: { finished in
            UIView.animate(withDuration: 0.5, animations: {
                self.view.backgroundColor = UIColor(white: 1, alpha: 0)
                let indPath = self.indexPathsForSelectedItems!
                self.reloadItems(at: indPath)
                
            }, completion: { finished in
                self.view.isHidden = true
            })
        })
    }
    
}

