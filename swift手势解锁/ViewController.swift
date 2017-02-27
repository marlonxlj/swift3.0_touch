//
//  ViewController.swift
//  swift手势解锁
//
//  Created by m on 2017/2/26.
//  Copyright © 2017年 XLJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //初始化xib,默认不会关联xib,需要手动设置
    let _drawVC = DrawViewController(nibName:"DrawViewController", bundle:nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //按钮事件
    @IBAction func btnClicked(_ sender: UIButton) {
        //发送通知,清空按钮
        NotificationCenter.default.post(name: Notification.Name(rawValue: "whClean"), object: nil)
        switch sender.tag {
        case 100://设置密码
            _drawVC.tag = 100
            break
        case 101://验证密码
            _drawVC.tag = 101
            break
        case 102://修改密码
            _drawVC.tag = 102
            break
        
        default:
            break
        }
        self.present(_drawVC, animated: true, completion: nil)
    }

    
}

