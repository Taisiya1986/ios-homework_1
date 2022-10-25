import UIKit
class ProfileHeaderView: UIView {
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let avatarView: UIImageView = {
        let avatar = UIImageView()
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.image = UIImage(named: "img")
        return avatar
    }()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.text = "Hipster cat"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let buttonStatus: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(Any?.self, action: #selector(buttonStatusAction), for: .touchUpInside)
        return button
    }()
    
    let labelStatus: UILabel = {
        let status = UILabel()
        status.text = "Waiting for something..."
        status.font = .systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        return status
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(mainView)
        mainView.addSubview(avatarView)
        mainView.addSubview(labelName)
        mainView.addSubview(buttonStatus)
        mainView.addSubview(labelStatus)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        buttonStatus.translatesAutoresizingMaskIntoConstraints = false
        labelStatus.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainView.widthAnchor.constraint(equalTo: self.widthAnchor),
            mainView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            avatarView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 16),
            avatarView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            avatarView.widthAnchor.constraint(equalToConstant: 120),
            avatarView.heightAnchor.constraint(equalToConstant: 120),
            
            labelName.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 160),
            labelName.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 27),
            
            buttonStatus.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            buttonStatus.widthAnchor.constraint(equalTo: mainView.widthAnchor, constant: -32),
            buttonStatus.heightAnchor.constraint(equalToConstant: 50),
            buttonStatus.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 152),
            
            labelStatus.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 160),
            labelStatus.bottomAnchor.constraint(equalTo: buttonStatus.topAnchor, constant: -34)
        ])
    }
    
    @objc func buttonStatusAction() {
        print(labelStatus.text ?? "")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarView.layer.cornerRadius = avatarView.frame.width / 2
        avatarView.clipsToBounds = true
    }
    
}
