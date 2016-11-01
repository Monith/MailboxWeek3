//
//  listView.swift
//  mailbox_week3
//
//  Created by Monith Ilavarasan on 10/30/16.
//  Copyright © 2016 Monith Ilavarasan. All rights reserved.
//

import UIKit

class listView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        
        navigationController!.popViewController(animated: false)
        
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
