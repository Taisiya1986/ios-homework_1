import UIKit

class LogInViewController: UIViewController, UIScrollViewDelegate {
    
    var standardLogin = "taisiya"
    var standardPassword = "777777"
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    let vkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Email of phone"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.textColor = .black
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textField.font = .systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Password"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.textColor = .black
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.font = .systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.addTarget(LogInViewController?.self, action: #selector(textFieldWasChanged), for: .editingChanged)
        return textField
    }()
    
    let logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "myColor")
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(LogInViewController?.self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    let hiddenLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество символов меньше 6"
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
    @objc func buttonAction() {
        if loginTextField.text == "" {
            loginTextField.layer.backgroundColor = UIColor.red.cgColor
        } else if passwordTextField.text == "" {
            passwordTextField.layer.backgroundColor = UIColor.red.cgColor
        } else {
            loginTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
            passwordTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
            if loginTextField.text == standardLogin && passwordTextField.text == standardPassword {
                let profileVC = ProfileViewController()
                self.navigationController?.pushViewController(profileVC, animated: true)
            } else {
                let alertController = UIAlertController(title: "Предупреждение", message: "Проверьте логин и пароль", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default) { okButton in
                    print("OK")
                }
                alertController.addAction(okButton)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @objc func textFieldWasChanged (_ textField: UITextField) {
        let textCount = textField.text?.count
        if let tc = textCount {
            if tc < 6 {
                hiddenLabel.isHidden = false
            } else {
                hiddenLabel.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        setupScrollView()
        setupView()
        scrollView.keyboardDismissMode = .onDrag
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 900),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    func setupView() {
        contentView.addSubview(vkImage)
        contentView.addSubview(loginTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(logInButton)
        contentView.addSubview(hiddenLabel)
        
        vkImage.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        hiddenLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vkImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vkImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vkImage.widthAnchor.constraint(equalToConstant: 100),
            vkImage.heightAnchor.constraint(equalToConstant: 100),
            
            loginTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginTextField.topAnchor.constraint(equalTo: vkImage.bottomAnchor, constant: 120),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            loginTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            
            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            
            hiddenLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            hiddenLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotification()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeKeyboardNotification()
    }
    
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
            return
        }
        scrollView.contentOffset = CGPoint(x: 0, y: ks.height)
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        scrollView.contentOffset = .zero
    }
    
}

