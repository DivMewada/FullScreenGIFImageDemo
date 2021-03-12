//
//  ViewController.swift
//  FullScreenGIFImageDemo
//
//  Created by iOS Developer on 11/03/21.
//

import UIKit
import SDWebImage
import Lightbox

class ViewController: UIViewController {

  @IBOutlet weak var imageView: SDAnimatedImageView!
  let imageURLString = "https://pu.tmcdn.in/uploads/academies/1439ef2266892ab0064932a49b71a2af8daa93fd/shared_images/6FE5AB16B8/1615457903/videogif2.gif?response-content-disposition=inline"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    imageView.sd_setImage(with: URL(string: imageURLString), completed: nil)
  }

  @IBAction func buttonClicked(_ sender: Any) {
    let image = LightboxImage(imageURL: URL(string: imageURLString)!)
    image.text = "Testing full screen image"
    let lightboxController = LightboxController(images: [image], startIndex: 0)
    lightboxController.pageDelegate = self
    lightboxController.dismissalDelegate = self
    lightboxController.dynamicBackground = true
    self.present(lightboxController, animated: true, completion: nil)
  }
  
}

extension ViewController: LightboxControllerPageDelegate, LightboxControllerDismissalDelegate {
  func lightboxController(_ controller: LightboxController, didMoveToPage page: Int) {
    print(page)
  }
  
  func lightboxControllerWillDismiss(_ controller: LightboxController) {
    controller.dismiss(animated: true, completion: nil)
  }
  
  
}
