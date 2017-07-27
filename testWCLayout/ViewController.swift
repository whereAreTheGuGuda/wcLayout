//
//  ViewController.swift
//  testWCLayout
//
//  Created by bia一下 on 2017/7/28.
//  Copyright © 2017年 bia一下. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //用frame实现一个左上右边距为100 字体15的自适应lable
        
        let testLable : (UILabel) = UILabel.init();
        testLable.text = "      北冥2有鱼，其名为鲲（kūn）3。鲲之大，不知其几4千里也5；化而为鸟，其名为鹏6。鹏之背，不知其几千里也；怒7而飞，其翼若垂天8之云。是鸟也，海运9则将徙10于南冥。南冥者，天池11也。《齐谐》12者，志怪13者也。《谐》之言曰：“鹏之徙于南冥也，水击14三千里，抟（tuán）15扶摇16而上者九万里，去以六月息17者也。”野马18也，尘埃19也，生物之以息相吹也20。天之苍苍21，其22正色23邪？其远而无所至极邪24？其视下也25，亦若是则已矣。且夫26水之积也不厚，则其负27大舟也无力。覆28杯水于坳堂29之上，则芥30为之舟；置31杯焉32则胶33，水浅而舟大也。风之积也不厚，则其负大翼也无力34。故九万里，则风斯在下矣35，而后乃今36培风37；背负青天，而莫之夭38阏（è）39者，而后乃今将图南40。";
        testLable.textColor = UIColor.black;
        testLable.font = UIFont.systemFont(ofSize: nvFont4_7D(value: 30));    //15号
        testLable.backgroundColor = UIColor.red;
        testLable.numberOfLines = 0;
        self.view.addSubview(testLable);
        
        testLable.frame = CGRect(x: nvX4_7D(value: 100), y: nvH4_7D(value: 100), width:mSCreenWidth - (nvW4_7D(value: 100)) * 2, height: 0);
        testLable.sizeToFit();
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

