//
//  ViewController.swift
//  Sensors
//
//  Created by 陈冰 on 2017/10/11.
//  Copyright © 2017年 GLAC. All rights reserved.
//

import UIKit
// 加速度传感器
import CoreMotion

class ViewController: UIViewController {

    var cmm:CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cmm = CMMotionManager();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cmm.accelerometerUpdateInterval = 1.0
        if cmm.isAccelerometerAvailable {
            cmm.startAccelerometerUpdates(to:OperationQueue(), withHandler: {(data:CMAccelerometerData!, err:Error!) in
                print(data)
            })
        } else {
            print("加速度传感器不可用")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if cmm.isAccelerometerActive {
            cmm.stopAccelerometerUpdates()
        }
    }
}

