
import UIKit

class CalculatorViewController: UIViewController {

    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
// закрытие клавиатуры при нажатии на любую из кнопок
        billTextField.endEditing(true)
        
        //Отмена подсветки всех кнопок
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = false

                //Подсветка выбранной/нажатой кнопки
                sender.isSelected = true

                //Получение текущего заголовка нажатой кнопки.
                let buttonTitle = sender.currentTitle!

                //Удалите последний символ (%) из заголовка, а затем снова превратите его в строку.
                let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())

                //Превратите строку в Double.
                let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!

                //Разделите процент, выраженный от 100, на десятичную дробь, например. 10 становится 0,1
                tip = buttonTitleAsANumber / 100

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != ""{
            billTotal = Double(bill) ?? 0.0
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            finalResult = String(format: "%.2f", result)
            print(resultTo2DecimalPlaces)
        }
//        переход на второй экран
            self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
            
        }
    }
}

