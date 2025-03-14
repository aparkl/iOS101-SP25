import UIKit

class ViewController: UIViewController {
    
    private var playAgainButton: UIButton!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    var questions: [Question] = []
    var currentQuestionIndex = 0
    var score = 0 // for tracking correct answer
    
    func loadQuestions() {
        questions = [
            Question(text: "How many championships have Warriors won so far?", answers: ["None", "2", "5", "7"], correctAnswer: "7"),
            Question(text: "Who was the first player in NBA history to make 400 three-pointers in a season?", answers: ["Steph Curry", "Klay Thompson", "Christ Mullin", "Kevin Durant"], correctAnswer: "Steph Curry"),
            Question(text: "Which player scored 100 points in a single game?", answers: ["Wilt Chamberlain", "Klay Thompson", "Steph Curry", "Draymond Green"], correctAnswer: "Wilt Chamberlain")
        ]
    }
    
    func showQuestion() {
        guard currentQuestionIndex < questions.count else {
            endQuiz()
            return
        }
        
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.text
        
        for (index, button) in answerButtons.enumerated() {
            button.setTitle(currentQuestion.answers[index], for:
                    .normal)
            button.isHidden = false
        }
    }
    
    func endQuiz() {
        questionLabel.text = "Game Over! Your score: \(score)/\(questions.count)"

        for button in answerButtons {
            button.isHidden = true
        }

        playAgainButton = UIButton(type: .system)
        playAgainButton.setTitle("Play Again", for: .normal)
        playAgainButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        playAgainButton.backgroundColor = UIColor.systemBlue
        playAgainButton.setTitleColor(.white, for: .normal)
        playAgainButton.layer.cornerRadius = 10
        playAgainButton.translatesAutoresizingMaskIntoConstraints = false

        // Add button action
        playAgainButton.addTarget(self, action: #selector(restartQuiz), for: .touchUpInside)

        // Add button to view
        view.addSubview(playAgainButton)

        // Set constraints
        NSLayoutConstraint.activate([
            playAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playAgainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            playAgainButton.widthAnchor.constraint(equalToConstant: 200),
            playAgainButton.heightAnchor.constraint(equalToConstant: 50)
        ])
            
    }

    @objc func restartQuiz() {
        // Reset game variables
        currentQuestionIndex = 0
        score = 0
        
        // Show answer buttons again
        for button in answerButtons {
            button.isHidden = false
        }
        
        // Remove "Play Again" button
        playAgainButton.removeFromSuperview()

        // Restart quiz
        showQuestion()
    }

        
    @IBAction func answerTapped(_ sender: UIButton) {
        guard currentQuestionIndex < questions.count else { return }

        let selectedAnswer = sender.currentTitle
        let correctAnswer = questions[currentQuestionIndex].correctAnswer

        if selectedAnswer == correctAnswer {
            print("✅ Correct!")
            score += 1
        } else {
            print("❌ Wrong!")
        }

        // Move to the next question
        currentQuestionIndex += 1
        showQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadQuestions()
        showQuestion()
    }
}
