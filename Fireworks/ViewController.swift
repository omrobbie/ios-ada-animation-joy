//
//  ViewController.swift
//  Fireworks
//
//  Created by omrobbie on 12/07/18.
//  Copyright © 2018 omrobbie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var viewCircle: UIView!
    @IBOutlet weak var btnPlay: UIButton!
    
    // MARK: Variables
    var timer:Timer!
    var bStart:Bool = false
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewCircle.layer.cornerRadius = self.viewCircle.frame.width / 2
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !bStart { startAnimation() }
        self.viewCircle.frame.origin.y -= 50
    }
    
    // MARK: Custom Functions
    func startAnimation() {
        if bStart { return }
        bStart = true
        
        UIView.animate(withDuration: 1) {
            self.viewCircle.alpha = 1
            self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true, block: { (timer) in
            UIView.animate(withDuration: 0.6) {
                self.viewCircle.frame.origin.y += 50
            }
            
            if self.viewCircle.frame.origin.y < 0  {
                self.timer.invalidate()
                self.timer = nil
                self.bStart = false
                self.viewCircle.alpha = 0
                self.viewCircle.frame.origin.y = self.view.center.y

                UIView.animate(withDuration: 1, animations: {
                    self.view.backgroundColor = #colorLiteral(red: 1, green: 0.9541692138, blue: 0.3776526451, alpha: 1)
                })
            } else if self.viewCircle.frame.origin.y >= UIScreen.main.bounds.maxY {
                self.timer.invalidate()
                self.timer = nil
                self.bStart = false
                self.viewCircle.alpha = 0
                self.viewCircle.frame.origin.y = self.view.center.y
                
                UIView.animate(withDuration: 1, animations: {
                    self.view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                })
            }
        })
    }
    
}

