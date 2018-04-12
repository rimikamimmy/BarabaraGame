//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by Rimika Inoguchi on 2018/04/13.
//  Copyright © 2018年 Rimika Inoguchi. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    @IBOutlet var imgView3: UIImageView!
    
    @IBOutlet var resultLabel: UILabel!
    
    var timer: Timer!
    var score: Int = 1000
    let defaults: UserDefaults = UserDefaults.standard
    
    let width: CGFloat = UIScreen.main.bounds.size.width
    
    var positionX: [CGFloat] = [0.0, 0.0, 0.0]
    
    var dx: [CGFloat] = [1.0, 0.5, -1.0]
    
    func start(){
        resultLabel.isHidden = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2, width/2, width/2]
        self.start()
        
        func up(){
            for i in 0..<3{
                if positionX[i] > width || positionX[i] < 0{
                    dx[i] = dx[i] * (-1)
                }
                positionX[i] += dx[i]
            }
            imgView1.center.x = positionX[0]
            imgView2.center.x = positionX[1]
            
            @IBAction func stop(){
                if timer.isValid == true {
                    timer.invalidate()
                }
            }
            
        }
        
        
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
