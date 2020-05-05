//
//  BreedDetailViewController.swift
//  NavigationControllerPractice
//
//  Created by Ludo van Orden on 29/04/2020.
//  Copyright © 2020 Ludo van Orden. All rights reserved.
//

import UIKit
import Kingfisher


class BreedDetailViewController: UIViewController {
    
    var breed: Breed!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.breed.name
        
        // Create UI
        self.view.backgroundColor = .white
        
        // Stack view
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let stackViewWidth = stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0)
        let stackViewTop = stackView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor)
        let stackViewBottom = stackView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor)
        NSLayoutConstraint.activate([
            stackViewWidth,
            stackViewTop,
            stackViewBottom
        ])
        
        /*
        // Image
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(imageView)
        
        
        let imageViewWidth = imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1.0)
//        let imageViewHeight = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: stackView, attribute: .width, multiplier: 1.0, constant: 0)
        let imageViewHeight = imageView.heightAnchor.constraint(equalToConstant: 180.0)
        NSLayoutConstraint.activate([imageViewWidth, imageViewHeight])
        
        if let imageUrl = self.breed.imageUrl {
            imageView.kf.setImage(with: imageUrl, completionHandler: { result in
                /*
                 TODO
                 Once the image has loaded, we should get its on-screen height with contentMode .scaleAspectFit.
                 We must then use this height as a constant to update constraint `imageViewHeight`.
                 The height is unknown until the image has been loaded, so this must be done in this completion handler.
                 */
                print("IMAGE LOADED")
                
                let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
                let blurEffectView = UIVisualEffectView(effect: blurEffect)
                blurEffectView.frame = imageView.bounds
                blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                imageView.layer.contents = [blurEffectView]
            })
        }
        */
        
        // Image
        let stackedImageView = StackedImageView()
        stackView.addArrangedSubview(stackedImageView)
        
        let imageViewWidth = stackedImageView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1.0)
        let imageViewHeight = NSLayoutConstraint(item: stackedImageView, attribute: .height, relatedBy: .equal, toItem: stackView, attribute: .width, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([imageViewWidth, imageViewHeight])
        
        // Label for breed name
        let breedNameLabel = UILabel()
        breedNameLabel.text = self.breed.name
        stackView.addArrangedSubview(breedNameLabel)
        
        // Text area for description
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        
        if let desc = self.breed.description {
            descriptionLabel.text = desc
        } else {
            descriptionLabel.text = "No description available."
        }
        descriptionLabel.sizeToFit()
        stackView.addArrangedSubview(descriptionLabel)
        
        // Filler view
        let fillerView = UIView()
        stackView.addArrangedSubview(fillerView)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


/**
 * Source: Hacking with Swift
 */
extension UIImageView {
    var getShownImageSize: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }

        let scale: CGFloat
        if image.size.width > image.size.height {
            scale = bounds.width / image.size.width
        } else {
            scale = bounds.height / image.size.height
        }

        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let x = (bounds.width - size.width) / 2.0
        let y = (bounds.height - size.height) / 2.0

        return CGRect(x: x, y: y, width: size.width, height: size.height)
    }
}


/**
 * Source: https://stackoverflow.com/a/54294991/8333667
 */
class ResizableImageView: UIImageView {
  override var image: UIImage? {
    didSet {
      guard let image = image else { return }

      let resizeConstraints = [
        self.heightAnchor.constraint(equalToConstant: image.size.height),
        self.widthAnchor.constraint(equalToConstant: image.size.width)
      ]

      if superview != nil {
        addConstraints(resizeConstraints)
      }
    }
  }
}
