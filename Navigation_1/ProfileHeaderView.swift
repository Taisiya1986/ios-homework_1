import UIKit

class ProfileHeaderView: UIView {
    
    let avatarView: UIImageView = {
        let avatar = UIImageView()
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.contentMode = .scaleAspectFill
        avatar.image = UIImage(named: "img")
        return avatar
    }()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.text = "Hipster cat"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let labelStatus: UILabel = {
        let status = UILabel()
        status.text = "Waiting for something..."
        status.font = .systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        return status
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
        return button
    }()
    
    let textFieldStatus: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private var statusText = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(avatarView)
        self.addSubview(labelName)
        self.addSubview(labelStatus)
        self.addSubview(buttonStatus)
        self.addSubview(textFieldStatus)
        
        
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelStatus.translatesAutoresizingMaskIntoConstraints = false
        buttonStatus.translatesAutoresizingMaskIntoConstraints = false
        textFieldStatus.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarView.widthAnchor.constraint(equalToConstant: 120),
            avatarView.heightAnchor.constraint(equalToConstant: 120),
            
            labelName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 160),
            labelName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            
            labelStatus.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 160),
            labelStatus.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 50),
            
            buttonStatus.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStatus.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            buttonStatus.heightAnchor.constraint(equalToConstant: 50),
            buttonStatus.topAnchor.constraint(equalTo: textFieldStatus.bottomAnchor, constant: 16),
            
            textFieldStatus.leadingAnchor.constraint(equalTo: labelStatus.leadingAnchor),
            textFieldStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textFieldStatus.topAnchor.constraint(equalTo: labelStatus.bottomAnchor, constant: 16),
            textFieldStatus.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = String(textField.text!)
    }
    
    @objc func buttonStatusAction() {
        labelStatus.text = statusText
        if textFieldStatus.text == "" {
            textFieldStatus.layer.borderColor = UIColor.red.cgColor
        } else {
            textFieldStatus.layer.borderColor = UIColor.black.cgColor
            print(textFieldStatus.text ?? "")
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .lightGray
        avatarView.layer.cornerRadius = avatarView.frame.width / 2
        avatarView.clipsToBounds = true
        textFieldStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        buttonStatus.addTarget(Any?.self, action: #selector(buttonStatusAction), for: .touchUpInside)
    }
    
}
