import UIKit

class ProfileHeaderView: UIView {

    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pooh")
        return imageView
    }()
    
    let fullNameLebel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.text = "Full name"
        return label
    }()
    
    let statusLebel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.text = "Status"
        return label
    }()
    
    let statusTextField: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemGray
        textView.text = "Some text"
        return textView
    }()
    
    let setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemTeal
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLebel)
        self.addSubview(statusLebel)
        self.addSubview(statusTextField)
        self.addSubview(setStatusButton)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLebel.translatesAutoresizingMaskIntoConstraints = false
        statusLebel.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            
            fullNameLebel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fullNameLebel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            fullNameLebel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150),
            fullNameLebel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            fullNameLebel.heightAnchor.constraint(equalToConstant: 20),
            
            statusLebel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            statusLebel.topAnchor.constraint(equalTo: fullNameLebel.bottomAnchor, constant: 15),
            statusLebel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150),
            statusLebel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            statusLebel.heightAnchor.constraint(equalToConstant: 20),
            
            statusTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            statusTextField.topAnchor.constraint(equalTo: statusLebel.bottomAnchor, constant: 15),
            statusTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 15),
            setStatusButton.widthAnchor.constraint(equalToConstant: 350),
            setStatusButton.heightAnchor.constraint(equalToConstant: 30),
        ])
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let newButton = UIButton()
        newButton.backgroundColor = .systemPurple
        newButton.setTitle("New button", for: .normal)
        self.addSubview(newButton)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        newButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}
