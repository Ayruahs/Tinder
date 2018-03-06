//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Shaurya Sinha on 05/03/18.
//  Copyright © 2018 Shaurya. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBAction func onDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var profileImageView: UIImageView!
    
    var image: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = self.image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
