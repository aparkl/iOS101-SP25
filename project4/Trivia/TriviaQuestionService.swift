import Foundation

struct APIResponse: Decodable {
    let results: [TriviaQuestion]
}

class TriviaQuestionService {
    func fetchQuestions(amount: Int = 5, category: Int?, difficulty: String?, completion: @escaping ([TriviaQuestion]?) -> Void) {
        var urlString = "https://opentdb.com/api.php?amount=\(amount)&type=multiple"
        
        if let category = category {
            urlString += "&category=\(category)"
        }
        
        if let difficulty = difficulty {
            urlString += "&difficulty=\(difficulty)"
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,
                  let decodedResponse = try? JSONDecoder().decode(APIResponse.self, from: data),
                  error == nil else {
                completion(nil)
                return
            }
            completion(decodedResponse.results)
        }.resume()
    }
}
