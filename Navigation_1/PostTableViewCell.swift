import UIKit

class PostTableViewCell: UITableViewCell {
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    let someImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    let numberOfLikesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let numberOfViewsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(style : UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContentView() {
        
        contentView.addSubview(authorLabel)
        contentView.addSubview(someImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(numberOfLikesLabel)
        contentView.addSubview(numberOfViewsLabel)
        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        someImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfViewsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            authorLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            authorLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            
            someImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            someImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            someImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            someImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: someImageView.bottomAnchor, constant: 16),
            descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            
            numberOfLikesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            numberOfLikesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            numberOfViewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            numberOfViewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
}
