//
//  CardsViewController.swift
//  Tinder
//
//  Created by Shaurya Sinha on 05/03/18.
//  Copyright © 2018 Shaurya. All rights reserved.
//

import UIKit
import Foundation

class CardsViewController: UIViewController {

    @IBOutlet weak var tinderImageView: UIImageView!
    var cardInitialCenter: CGPoint!
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        let location = sender.location(in: view)
        
        if sender.state == .began {
            cardInitialCenter = tinderImageView.center
        } else if sender.state == .changed {
            tinderImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)
            
            if(location.y < cardInitialCenter.y){
                if(velocity.x > 0){
                    tinderImageView.transform = tinderImageView.transform.rotated(by: CGFloat( Double.pi / 180) )
                }else if(velocity.x < 0){
                    tinderImageView.transform = tinderImageView.transform.rotated(by: CGFloat(-1 * Double.pi / 180) )
                }
            }else{
                if(velocity.x > 0){
                    tinderImageView.transform = tinderImageView.transform.rotated(by: CGFloat(-1 * Double.pi / 180) )
                }else if(velocity.x < 0){
                    tinderImageView.transform = tinderImageView.transform.rotated(by: CGFloat( Double.pi / 180) )
                }
            }
        } else if sender.state == .ended {
            if(abs(translation.x) <= 50){
                tinderImageView.center = cardInitialCenter
                tinderImageView.transform = .identity
            }else{
                if(velocity.x > 0){
                    UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options:[] ,
                                   animations: { () -> Void in
                                    self.tinderImageView.center = CGPoint(x: self.tinderImageView.center.x + 1000, y: self.tinderImageView.center.y)
                    }, completion: nil)
                    self.performSegue(withIdentifier: "segue", sender: nil)
                }else if(velocity.x < 0){
                    print("velocity < 0")
                    UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: -1, options:[] ,
                                   animations: { () -> Void in
                                    self.tinderImageView.center = CGPoint(x: self.tinderImageView.center.x - 1000, y: self.tinderImageView.center.y)
                    }, completion: nil)
                    tinderImageView.transform = .identity
                }
                
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tinderImageView.image = UIImage(named: "ryan")
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let dest = segue.destination as! ProfileViewController
        self.tinderImageView.center = cardInitialCenter
        tinderImageView.transform = .identity
        dest.image = tinderImageView.image
    }
 

}
