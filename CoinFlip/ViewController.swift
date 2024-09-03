//
//  ViewController.swift
//  CoinFlip
//
//  Created by 王宜婕 on 2024/9/3.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    @IBOutlet weak var yesorno: UIImageView!
    @IBOutlet weak var coinView: UIImageView!
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var flipButton: UIButton!
    var coin = 0
    
    let coinimages  = ["money-icon","8212616"]
    
    let aniCoinView = UIImageView(frame: CGRect(x: -139, y: -19, width: 660, height: 423))
    //設定粒子
    let starEmitterCell = CAEmitterCell()
    let starEmitterLayer = CAEmitterLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flipButton.isHidden = false
        stopButton.isHidden = true
        
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func flipCoin(_ sender: Any) {
        flipButton.isHidden = true
        stopButton.isHidden = false
        coinView.isHidden = true
        yesorno.isHidden = true
        let coinImage = UIImage.animatedImageNamed("flipcoin-", duration: 0.2)
        aniCoinView.image = coinImage
        view.addSubview(aniCoinView)
        starspark()
        
        
    
    }
    

    
    @IBAction func stopCoin(_ sender: Any) {
        flipButton.isHidden = false
        stopButton.isHidden = true
        aniCoinView.removeFromSuperview()
        coinView.isHidden = false
        yesorno.isHidden = false
        coin = Int.random(in: 0..<2)
        yesorno.image = UIImage(named: coinimages[coin])
        starEmitterLayer.removeFromSuperlayer()

    }
    
    func starspark(){
        starEmitterCell.contents = UIImage(named: "star")?.cgImage
        //發射頻率
        starEmitterCell.birthRate = 20
        //存活時間
        starEmitterCell.lifetime = 2
        //速度
        starEmitterCell.velocity = 100
        //縮放大小
        starEmitterCell.scale = 0.3
        starEmitterCell.scaleRange = 0.6
        //加速度
        starEmitterCell.xAcceleration = 0
        starEmitterCell.yAcceleration = 0
        //角度
        starEmitterCell.emissionRange = CGFloat.pi
        
        //設定畫面
        
        starEmitterLayer.emitterCells = [starEmitterCell]
        starEmitterLayer.emitterPosition = CGPoint(x: 150, y: 130)
        starEmitterLayer.emitterSize = CGSize(width: 400, height: 0)
        starEmitterLayer.emitterShape = .cuboid
        view.layer.addSublayer(starEmitterLayer)
    }
    
}

#Preview {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
}
