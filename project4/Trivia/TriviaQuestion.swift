import Foundation

struct TriviaQuestion: Decodable {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]

    var correctAnswer: String {
        correct_answer
    }

    var incorrectAnswers: [String] {
        incorrect_answers
    }

    var allAnswersShuffled: [String] {
        (incorrect_answers + [correct_answer]).shuffled()
    }
}
