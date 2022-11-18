import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let galleryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        return button
    }()
    
    let photo1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image0")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 4
        image.clipsToBounds = true
        return image
    }()
    
    let photo2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image1")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 4
        image.clipsToBounds = true
        return image
    }()
    
    let photo3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image2")
        image.layer.cornerRadius = 4
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let photo4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image3")
        image.layer.cornerRadius = 4
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let photosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    override init(style : UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContentView() {
        photosStackView.addArrangedSubview(photo1)
        photosStackView.addArrangedSubview(photo2)
        photosStackView.addArrangedSubview(photo3)
        photosStackView.addArrangedSubview(photo4)
        
        contentView.addSubview(photosLabel)
        contentView.addSubview(galleryButton)
        contentView.addSubview(photosStackView)
        
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        galleryButton.translatesAutoresizingMaskIntoConstraints = false
        photosStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            galleryButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            galleryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            photosStackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photosStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -24),
            photosStackView.heightAnchor.constraint(equalTo: photo1.widthAnchor)
        ])
    }
    
}
