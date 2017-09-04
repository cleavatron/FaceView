//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Ahmad Fairiz on 04/09/2017.
//  Copyright © 2017 Recite Lab. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {

    

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    var destinationViewController = segue.destination
    if let navigationController = destinationViewController as? UINavigationController{
      destinationViewController = navigationController.visibleViewController ?? destinationViewController
    }
    if let faceViewController = destinationViewController as? FaceViewController{
      if let identifier = segue.identifier{
        if let expression = emotionalFaces[identifier]{
          faceViewController.expression = expression
          faceViewController.navigationItem.title = (sender as? UIButton)?.currentTitle
        }
        
      }
    }
  }
  
  private let emotionalFaces: Dictionary<String, FacialExpression> = [
    
    "sad" : FacialExpression(eyes: .closed, mouth: .frown),
    "happy" : FacialExpression(eyes: .open, mouth: .smile),
    "worried" : FacialExpression(eyes: .open, mouth: .smirk)
  ]
  

}
