import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let reusableID = "collectionCell"
    
    let photo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
}
