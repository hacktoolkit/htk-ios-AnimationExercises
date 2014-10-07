//
//  CanvasViewController.swift
//  AnimationExercises
//
//  Created by Jonathan Tsai on 10/6/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!

    var trayYClosed = 540
    var trayYOpen = 300
    var panStartY: CGFloat!
    var startHeight = 230.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        var point = panGestureRecognizer.locationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        var translation = panGestureRecognizer.translationInView(self.view)
        var currentCenterY = panGestureRecognizer.view!.center.y
        let endPositionY = currentCenterY + translation.y
        
        panGestureRecognizer.view!.center = CGPoint(
            x: panGestureRecognizer.view!.center.x,
            y: endPositionY
        )
        panGestureRecognizer.setTranslation(CGPointZero, inView: self.view)
        var newY = point.y

        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            panStartY = CGFloat(newY)
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            println("Gesture ended at: \(point)")
            println("Velocity: \(velocity)")
            var newY: CGFloat
            if velocity.y > 0 {
                // going up
                newY = CGFloat(trayYClosed)
            } else {
                // going down
                newY = CGFloat(trayYOpen)
            }
            UIView.animateWithDuration(0.2, animations: {
                () -> Void in
                self.trayView.frame = CGRect(x: 0, y: newY, width: self.trayView.frame.size.width, height: self.trayView.frame.size.height)
            })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
