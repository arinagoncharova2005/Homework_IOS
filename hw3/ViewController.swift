//
//  ViewController.swift
//  hw3
//
//  Created by Arina Goncharova on 20.06.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var circleView: UIView!
    
    
    @IBOutlet weak var initialsLabel: UILabel!
    
    @IBOutlet weak var textFieldName: UITextField!
    
    
    @IBOutlet weak var universityLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var buttonUniversity: UIButton!
    
    
    @IBOutlet weak var buttonCity: UIButton!
    var userName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        print("\(#function) is called when the view controller's view was loaded into memory")

        
        // Do any additional setup after loading the view.
        
        //        let diameter = UIScreen.main.bounds.width/2
        //        // Circular view
        //        circleView.frame = CGRect(x:diameter/2 , y: 150, width: diameter, height: diameter)
        //
        //        circleView.layer.cornerRadius = diameter / 2
        //        circleView.layer.cornerRadius = view.frame.width / 2
        //
        //        circleView.clipsToBounds = true
        initialsLabel.text = "AG"
        textFieldName.text = "Arina Goncharova"
        textFieldName.delegate = self
        textFieldName.addTarget(self, action: #selector(textFieldNameDidChange(_:)), for: .editingChanged)
        
        universityLabel.text = "Enter your university"
        cityLabel.text = "Enter your city"
       
        
        //        textViewUniversity.text = "Enter your university"
        //        textViewCity.text = "Enter your city"
        
       
        let newFontSize: CGFloat = 20.0 // Новый размер шрифта, который нужно установить
        if let font = textFieldName.font {
            textFieldName.font = font.withSize(newFontSize)
        }
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: textFieldName.frame.size.height + 10, width: textFieldName.frame.size.width, height: 2)
        bottomBorder.backgroundColor = UIColor.black.cgColor
        textFieldName.layer.addSublayer(bottomBorder)
        
    }
    
    @IBAction func saveName(_sender: Any){
        if let enteredText = textFieldName.text {
            // Assign the entered text to the corresponding UITextField
            textFieldName.text = enteredText
            userName = enteredText
            //            let formatter = PersonNameComponentsFormatter()
            let inputString = userName
            let words = inputString.components(separatedBy: " ")
            
            var initials = ""
            for word in words {
                if let initial = word.first {
                    initials.append(initial)
                }
            }
        }
        
    }
    
    
    
    @IBAction func onClickUni(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Enter university", message: nil, preferredStyle: .alert)
        // Добавляем текстовое поле для ввода нового значения
        alertController.addTextField { (textField) in
            textField.placeholder = "University"
        }
        // Создаем действие для кнопки "Сохранить"
        let doneAction = UIAlertAction(title: "Done", style: .default) { (action) in
            // Получаем текст из текстового поля
            if let textField = alertController.textFields?.first,
               let enteredText = textField.text {
                // Выполняем действия с новым значением
                self.universityLabel.text = enteredText
                print("Text view was updated with value \(enteredText)")
            }
        }
        
        // Создаем действие для кнопки "Отмена"
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // Добавляем действия к UIAlertController
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        
        // Показываем UIAlertController
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func onClickCity(_ sender: Any) {
        let alertController = UIAlertController(title: "Enter city", message: nil, preferredStyle: .alert)
        // Добавляем текстовое поле для ввода нового значения
        alertController.addTextField { (textField) in
            textField.placeholder = "City"
        }
        // Создаем действие для кнопки "Сохранить"
        let doneAction = UIAlertAction(title: "Done", style: .default) { (action) in
            // Получаем текст из текстового поля
            if let textField = alertController.textFields?.first,
               let enteredText = textField.text {
                // Выполняем действия с новым значением
                self.cityLabel.text = enteredText
                print("Text view was updated with value \(enteredText)")
            }
        }
        
        // Создаем действие для кнопки "Отмена"
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // Добавляем действия к UIAlertController
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        
        // Показываем UIAlertController
        present(alertController, animated: true, completion: nil)
        
    }
    
    @objc func textFieldNameDidChange(_ textField: UITextField) {
        if let text = textField.text {
            let initials = getInitials(name: text)
            if let initialsLabel = initialsLabel{
                initialsLabel.text = initials
                print("Initials Label changed to \(initials)")
            }
            //            print("Initials Label changed to \(initials)")
        }
    }
    
    //function that returns the initials of the given string
    
    func getInitials(name: String) -> String {
        let arrayEnteredString = name.components(separatedBy: " ")
        var initials = ""
        
        for i in 0..<min(2, arrayEnteredString.count){
            if let firstLetter = arrayEnteredString[i].first{
                initials.append(firstLetter)
            }
        }
        return initials
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("\(#function)  is called after the system finishes laying out the subviews within the view controller's view. It ensures that the sizes and positions of all subviews are properly set.")
        // universityLabel.text = "Enter your university"
        
        // cityLabel.text = "Enter your city"
        
        //        let diameter = view.frame.width / 2
        // Circular view
        //                circleView.frame = CGRect(x:diameter/2 , y: 150, width: diameter, height: diameter)
        
        circleView.layer.cornerRadius = circleView.frame.width / 2
        circleView.clipsToBounds = true
        
        universityLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        universityLabel.numberOfLines = 0
        
        cityLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cityLabel.numberOfLines = 0
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(#function) is called before the view is displayed on the screen.")

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(#function) is called when the view is displayed on the screen.")

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(#function) is called before the view disappears from the screen.")

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(#function) is called when the view has disappeared from the screen. ")
    }
    
    
    
}

