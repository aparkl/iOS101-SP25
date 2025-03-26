import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var difficulty: UISegmentedControl!
    
    @IBAction func startGameTapped(_ sender: UIButton) {
        print("🚀 Start button tapped!")

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let triviaVC = storyboard.instantiateViewController(withIdentifier: "TriviaViewController") as? TriviaViewController {
            triviaVC.categoryId = selectedCategoryId
            triviaVC.difficulty = selectedDifficulty
            navigationController?.pushViewController(triviaVC, animated: true)
        } else {
            print("❌ Could not instantiate TriviaViewController")
        }
    }
    
    let categories = [
        (id: 9, name: "General Knowledge"),
        (id: 10, name: "Books"),
        (id: 11, name: "Film"),
        (id: 12, name: "Music"),
        (id: 18, name: "Computers"),
        (id: 19, name: "Mathematics"),
        (id: 21, name: "Sports")
    ]

    var selectedCategoryId: Int = 9 // Default
    var selectedDifficulty: String = "easy" // Default

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        categoryPickerView.selectRow(0, inComponent: 0, animated: false)
    }

    @IBAction func difficultyChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: selectedDifficulty = "easy"
        case 1: selectedDifficulty = "medium"
        case 2: selectedDifficulty = "hard"
        default: selectedDifficulty = "easy"
        }
    }
}

// MARK: - Picker View Delegate & Data Source
extension StartViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategoryId = categories[row].id
    }
}
