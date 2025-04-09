import UIKit
import Nuke

class DetailViewController: UIViewController {

    var post: Post!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        print("🪵 post is: \(String(describing: post))")

        guard let post = post else {
            print("❗️Post is nil — not passed correctly")
            return
        }

        captionTextView.text = post.caption.trimHTMLTags()

        if let photo = post.photos.first {
            let url = photo.originalSize.url
            print("✅ Image URL: \(url)")
            Nuke.loadImage(with: url, into: imageView)
        } else {
            print("⚠️ No photos found in post")
        }
    }

}
