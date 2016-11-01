//
//  MailboxViewController.swift
//  mailbox_week3
//
//  Created by Monith Ilavarasan on 10/30/16.
//  Copyright © 2016 Monith Ilavarasan. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var mailScroll: UIScrollView!
    
    @IBOutlet weak var messageImage: UIImageView!
    
    @IBOutlet weak var greyView: UIView!
    
    @IBOutlet weak var listView: UIView!
    
    @IBOutlet weak var rescheduleView: UIView!
    
    @IBOutlet weak var laterIconImage: UIImageView!
    
    @IBOutlet weak var listIconImage: UIImageView!
    
    @IBOutlet weak var greenCheck: UIView!
    
    @IBOutlet weak var redCross: UIView!
    
    @IBOutlet weak var checkMark: UIImageView!
    
    @IBOutlet weak var crossMark: UIImageView!
    
    @IBOutlet weak var feedView: UIImageView!
    
    var originalMessageCenter: CGPoint!
    var originalLaterIconCenter: CGPoint!
    var originalCheckMarkCenter: CGPoint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailScroll.contentSize = CGSize(width:320,height:1432)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    @IBAction func didPanMessage(_ sender: UIPanGestureRecognizer) {
        
        
        //let location = sender.location(in:view)
        
        //let velocity = sender.velocity(in: view)
        
        let translation = sender.translation(in: view)
        
        print(messageImage.center)
        
        // Moving message cell left and right
        if sender.state == .began {
            //just began
            originalMessageCenter = messageImage.center
            originalLaterIconCenter = laterIconImage.center
            originalCheckMarkCenter = checkMark.center
            
        } else if sender.state == .changed {
            
            //changing state
            messageImage.center = CGPoint(x: originalMessageCenter.x + translation.x, y: originalMessageCenter.y)
            
                //Move image cell
                messageImage.center = CGPoint(x: originalMessageCenter.x + translation.x, y: originalMessageCenter.y)
                
                if messageImage.center.x >= -100 && messageImage.center.x < 100{
                    greyView.alpha = 0
                    rescheduleView.alpha = 1
                    laterIconImage.center = CGPoint(x: originalLaterIconCenter.x + (translation.x + 70), y: originalLaterIconCenter.y)
                    
                } else if messageImage.center.x < -100 {
                    self.greyView.alpha = 0
                    self.rescheduleView.alpha = 0
                    
                }//hide gray, show reschedule/list yellow/green screen
            
            if messageImage.center.x >= 220 && messageImage.center.x < 420{
                
                greyView.alpha = 0
                greenCheck.alpha = 1
                self.rescheduleView.alpha = 0
                self.listView.alpha = 0
                checkMark.center = CGPoint(x: originalCheckMarkCenter.x + (translation.x - 100), y: originalCheckMarkCenter.y)
                
                
            } else if messageImage.center.x > 420 {
                self.greyView.alpha = 0
                self.greenCheck.alpha = 0
                self.rescheduleView.alpha = 0
                self.listView.alpha = 0
                
                
            }//hide gray, show check/delete green/red screen
            
            
            
        } else if sender.state == .ended {
            //ended
            
            //messageImage.center.x = originalMessageCenter.x
            
            if messageImage.center.x >= -100 && messageImage.center.x < 100{
                
                performSegue(withIdentifier: "scheduleSegue", sender: self)
                UIView.animate(withDuration: 0.5, delay: 0, options:[] ,
                               animations: { () -> Void in
                                self.feedView.center.y = self.feedView.center.y - 86
                    }, completion: nil)
                
            } else if messageImage.center.x < -100 {
                
                performSegue(withIdentifier: "listSegue", sender: self)
                UIView.animate(withDuration: 0.5, delay: 0, options:[] ,
                               animations: { () -> Void in
                                self.feedView.center.y = self.feedView.center.y - 86
                    }, completion: nil)

                
              }//hide gray, show reschedule/list yellow/green screen
            
            
            if messageImage.center.x >= 220 && messageImage.center.x < 420{
                
                UIView.animate(withDuration: 0.5, delay: 0, options:[] ,
                               animations: { () -> Void in
                                self.feedView.center.y = self.feedView.center.y - 86
                    }, completion: nil)
                
            } else if messageImage.center.x > 420 {
                
                UIView.animate(withDuration: 0.5, delay: 0, options:[] ,
                               animations: { () -> Void in
                                self.feedView.center.y = self.feedView.center.y - 86
                    }, completion: nil)
                
              }//delete message
            
            //Return images to original positions
            messageImage.center.x = originalMessageCenter.x
            laterIconImage.center.x = originalLaterIconCenter.x
            checkMark.center.x = originalCheckMarkCenter.x
            
            //Return all views to original positions
            greyView.alpha = 1
            rescheduleView.alpha = 1
            listView.alpha = 1
            greenCheck.alpha = 1
            
            
            
        }//check state of tap gesture beggining,middle, and end
        

        
    }//Entire Tap Gesture Function
    
    
    @IBAction func resetFeedView(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0, options:[] ,
                       animations: { () -> Void in
                        self.feedView.center.y = self.feedView.center.y + 86
            }, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
