//
//  ViewController.swift
//  Number Guessing
//
//  Created by Ali Erdem Kökcik on 2.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtNumbertoGuess: UITextField!
    @IBOutlet weak var imgSave: UIImageView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtGuessNumber: UITextField!
    @IBOutlet weak var imgGuessState: UIImageView!
    @IBOutlet weak var btnTry: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var imgStar1: UIImageView!
    @IBOutlet weak var imgStar2: UIImageView!
    @IBOutlet weak var imgStar3: UIImageView!
    @IBOutlet weak var imgStar4: UIImageView!
    @IBOutlet weak var imgStar5: UIImageView!
    var stars : [UIImageView] = [UIImageView]()
    let maxTrial : Int = 5
    var trialCount : Int = 0
    var targetNumber : Int = -1
    var gameSuccessful : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stars = [imgStar1, imgStar2, imgStar3, imgStar4, imgStar5]
        imgSave.isHidden = true
        imgGuessState.isHidden = true
        btnTry.isEnabled = false
        txtNumbertoGuess.isSecureTextEntry = true
        lblResult.text = ""
        
        
        
    }


    @IBAction func btnSaveClicked(_ sender: UIButton) {
        imgSave.isHidden = false
        if let t = Int(txtNumbertoGuess.text!){
            targetNumber = t
            btnTry.isEnabled = true
            txtNumbertoGuess.isEnabled = false
            btnSave.isEnabled = false
            imgSave.image = UIImage(named: "onay")
        } else {
            imgSave.image = UIImage(named: "hata")
        }
        
        
        
    }
    @IBAction func btnTryClicked(_ sender: UIButton) {
        if gameSuccessful == true || trialCount > maxTrial {
            return
        }
        imgGuessState.isHidden = false
        if let enteredNumber = Int(txtGuessNumber.text!) {
            //entered value is right
            trialCount += 1
            stars[trialCount - 1].image = UIImage(named: "icons8-christmas-star-32")
            imgGuessState.isHidden = false
            if enteredNumber > targetNumber{
                imgGuessState.image = UIImage(named: "icons8-below-40")
                txtGuessNumber.backgroundColor = UIColor.systemRed
            } else if enteredNumber < targetNumber {
                imgGuessState.image = UIImage(named: "icons8-upward-arrow-48")
                txtGuessNumber.backgroundColor = UIColor.systemRed
            } else {
                //correct guess, two numbers are equal. so game has ended
                imgGuessState.image = UIImage(named: "icons8-ok-hand-48")
                btnSave.isEnabled = true
                lblResult.text = "Correct guess!"
                txtGuessNumber.backgroundColor = UIColor.systemGreen
                txtNumbertoGuess.isSecureTextEntry = false
                gameSuccessful = true
                let alertController = UIAlertController(title: "Successful", message: "You've guessed number correctly", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
                return
            }
        } else {
            //entered value is not right
            imgGuessState.image = UIImage(named: "hata")
        }
        
        if trialCount == maxTrial {
            //if we're here, game ended unsuccessful
            btnTry.isEnabled = false
            imgGuessState.image = UIImage(named: "hata")
            lblResult.text = "Game over. \(targetNumber) was entered."
            txtNumbertoGuess.isSecureTextEntry = false
            return
        }
        
        
        
        
    }
    
    
    
    
    
}

