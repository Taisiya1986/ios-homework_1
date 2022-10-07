import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        self.view.addSubview(alertButton)
        setupAlertButton()
    }
    
    let alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemCyan
        button.setTitle("Alert", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(InfoViewController?.self, action: #selector(addAlertAction), for: .touchUpInside)
        
        return button
    }()
    
    func setupAlertButton() {
        alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        alertButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
    }
    
    @objc func addAlertAction() {
        let alertController = UIAlertController(title: "Сообщение", message: "Открыть сообщение?", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default) { okButton in
            print("OK")
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { cancelButton in
            print("Cancel")
        }
        
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true, completion: nil)
    }
}
