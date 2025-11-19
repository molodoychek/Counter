//
//  ViewController.swift
//  Counter
//
//  Created by Александр on 17.11.25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
   
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var nullButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startHistory()
    }
    
    private func startHistory() {
        countLabel.text = "0"
        
        historyTextView.text = "История изменений:\n"
        
        historyTextView.isEditable = false
        
        historyTextView.isScrollEnabled = true
    }
    
    private func getTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    private func addToHistory(_ message: String){
        let time = getTime()
        let historyEntry = "[\(time)]: \(message)\n"
        
        historyTextView.text += historyEntry
        
        let range = NSRange(location: historyTextView.text.count - 1, length: 0)
                historyTextView.scrollRangeToVisible(range)
    }
    

    @IBAction func plusOneButton(_ sender: Any) {
        count += 1
        
        countLabel.text = "Значение счетчика: \(count)"
        addToHistory("Значение изменено на +1")
    }
    
    @IBAction func minusOneButton(_ sender: Any) {
        if count > 0 {
            count -= 1
            if count == 0 {
                countLabel.text = "0"
            } else {
                countLabel.text = "Значение счетчика: \(count)"
            }
            addToHistory("Значение изменено на -1")
        } else {
            addToHistory("Попытка уменьшить значение счетчика ниже 0")
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        count = 0
        
        countLabel.text = "0"
        addToHistory("Значение сброшено")
    }
    
    
}

