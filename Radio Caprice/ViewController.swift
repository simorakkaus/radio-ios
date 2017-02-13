//
//  ViewController.swift
//  Radio Caprice
//
//  Created by Simo on 10.02.17.
//  Copyright © 2017 Simo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redDot: UIImageView!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var volumeIcon: UIImageView!
    @IBOutlet weak var favIcon: UIImageView!
    @IBOutlet weak var playIcon: UIImageView!
    @IBOutlet weak var forwardIcon: UIImageView!
    @IBOutlet weak var bacwardIcon: UIImageView!
    @IBOutlet weak var volumeNumber: UILabel!
    @IBAction func volumeChange(_ sender: Any) {
        
        volumeNumber.text = "\(Int(volumeSlider.value))"
        
        let volume = volumeSlider.value
        
        switch volume {
            
        case 0:
            volumeIcon.image = UIImage(named: "Mute")
            volumeIcon.image = volumeIcon.image?.maskWithColor(color: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0))
        case 1..<33:
            volumeIcon.image = UIImage(named: "Speaker-2")
            volumeIcon.image = volumeIcon.image?.maskWithColor(color: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0))
        case 33..<66:
            volumeIcon.image = UIImage(named: "Speaker-3")
            volumeIcon.image = volumeIcon.image?.maskWithColor(color: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0))
        case 66...100:
            volumeIcon.image = UIImage(named: "Speaker-4")
            volumeIcon.image = volumeIcon.image?.maskWithColor(color: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0))
        default:
            volumeIcon.image = UIImage(named: "Mute")
            volumeIcon.image = volumeIcon.image?.maskWithColor(color: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pulseAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pulseAnimation()
        
        volumeIcon.image = volumeIcon.image?.maskWithColor(color: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0))
        favIcon.image = favIcon.image?.maskWithColor(color: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0))
        playIcon.image = playIcon.image?.maskWithColor(color: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0))
        forwardIcon.image = forwardIcon.image?.maskWithColor(color: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0))
        bacwardIcon.image = bacwardIcon.image?.maskWithColor(color: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func pulseAnimation() {
        UIView.animate(withDuration: 1.4, delay: 0.0, options: [.autoreverse, .curveEaseInOut, .repeat], animations: {
            self.redDot.alpha = 0.0
        }, completion: nil)
    }
    
}

extension UIImage {
    
    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
}

