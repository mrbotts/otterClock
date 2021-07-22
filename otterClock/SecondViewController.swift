//
//  SecondViewController.swift
//  otterClock
//
//  Created by Bo Botts on 7/21/21.
//

import UIKit
import ImageIO

class SecondViewController: UIViewController {
    
    @IBOutlet weak var txtWorking: UILabel!
    @IBOutlet weak var txtTimeLeft: UILabel!
    @IBOutlet weak var gifView: UIImageView!
    
    
    
    
    
    var recivedString:Int = 0
    var timer:Timer?
    var breakTime = 5
    var timesToRepeat:Int = 1
    var reainderTime: Int = 0
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let gifURL : String = "https://64.media.tumblr.com/3ae5079b3e03cf9f1cbaedd8b98d347d/tumblr_metdt7jv7z1rhs8j5o1_500.gifv"
        let imageFromURL = UIImage.gifImageWithURL(gifURL)
        gifView.image = imageFromURL
        
        
        if recivedString > 25 {
            if recivedString % 25 == 0{
                timesToRepeat = recivedString / 25
                recivedString = 25
            } else{
                
            }
        }
        
        txtWorking.text = "Work Time"
        if recivedString >= 25{
            txtTimeLeft.text = "25 Minutes left"
        }else{
            txtTimeLeft.text = "\(recivedString) Minutes left"
        }
        setupTimer()
    }


    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
        
    func setupBreakTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerBreakFires), userInfo: nil, repeats: true)
    }


    @objc func onTimerFires() {
        if timesToRepeat > 0 {
            if recivedString == 25{
                txtTimeLeft.text = "25 Minutes left"
            }else{
                txtTimeLeft.text = "\(recivedString) Minutes left"
            }
            let gifURL : String = "https://64.media.tumblr.com/f4f90a402e369e25e22a1cc38b51e960/tumblr_mh6lzfrWTE1rhs8j5o1_500.gifv"
            let imageFromURL = UIImage.gifImageWithURL(gifURL)
            gifView.image = imageFromURL
            txtWorking.text = "WorkTime"
            recivedString -= 1
            txtTimeLeft.text = "\(recivedString) Minutes left"

            if recivedString <= 0 {
                timer?.invalidate()
                timer = nil
                timesToRepeat -= 1
                breakTime = 5
                setupBreakTimer()
            }
        }
    }
    

    @objc func onTimerBreakFires() {
        let gifURL : String = "https://64.media.tumblr.com/367a735dbe44750007d8b8a66cc5b523/tumblr_n56k4gjlnT1rhs8j5o1_400.gifv"
        let imageFromURL = UIImage.gifImageWithURL(gifURL)
        gifView.image = imageFromURL
        txtWorking.text = "Break Time"
        breakTime -= 1
        txtTimeLeft.text = "\(breakTime) Minutes left"

        if breakTime <= 0 {
            timer?.invalidate()
            timer = nil
            recivedString = 25
            setupTimer()
        }
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

