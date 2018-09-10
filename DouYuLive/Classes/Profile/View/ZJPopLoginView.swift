
//
//  ZJPopView.swift
//  DouYuLive
//
//  Created by 邓志坚 on 2018/9/10.
//  Copyright © 2018年 邓志坚. All rights reserved.
//

import UIKit

class ZJPopLoginView: ZJBaseView {

    private lazy var bgView : UIView = UIView()
    private lazy var topImgV : UIImageView = UIImageView()
    private lazy var titleLab : UILabel = UILabel()
    private lazy var loginBtn : UIButton = UIButton()
    private lazy var registerBtn : UIButton = UIButton()
    private lazy var descLab : UILabel = UILabel()
    private lazy var otherLab : UILabel = UILabel()
    private lazy var wechatBtn : UIButton = UIButton()
    private lazy var qqBtn : UIButton = UIButton()
    private lazy var sinaBtn : UIButton = UIButton()
    private lazy var closeBtn : UIButton = UIButton()
    
    override func zj_initWithAllView() {
        
        backgroundColor = colorWithRGBA(33, 33, 33, 0.7)
        let tap = UITapGestureRecognizer(target: self, action: #selector(zj_HiddenLoginView))
        self.addGestureRecognizer(tap)
        self.isHidden = true
        setUpAllView()
    
    }
    
    @objc func zj_HiddenLoginView() {
        self.isHidden = true
    }
    
    func zj_showLoginView() {
        self.isHidden = false
    }
    
    @objc private func bgTapAction() {

    }

}

// 配置 UI 视图
extension ZJPopLoginView {
    
    private func setUpAllView() {
        
        self.bgView = UIView.zj_createView(bgClor: kWhite, supView: self, closure: { (make) in
            make.center.equalTo(self.snp.center)
            make.width.equalTo(kScreenW - Adapt(40))
            make.height.equalTo(kScreenH - Adapt(250))
        })
        
        let bgTap = UITapGestureRecognizer(target: self, action: #selector(bgTapAction))
        self.bgView.addGestureRecognizer(bgTap)
        
        self.titleLab = UILabel.zj_createLabel(text: "登录", textColor:  kBlack, font: BoldFontSize(30), supView: self.bgView, closure: { (make) in
            make.left.equalTo(Adapt(30))
            make.top.equalTo(Adapt(50))
            make.height.equalTo(Adapt(32))
        })
        
        self.topImgV = UIImageView.zj_createImageView(imageName: "dyunion_logo_6", supView: self.bgView, closure: { (make) in
            make.centerX.equalTo(self.bgView.snp.centerX)
            make.bottom.equalTo(self.titleLab.snp.bottom).offset(Adapt(10))
            make.width.equalTo(Adapt(200))
            make.height.equalTo(Adapt(130))
        })
        
        self.topImgV.contentMode = .scaleAspectFill
        
        self.loginBtn = UIButton.zj_createButton(title: "斗鱼账号登录", titleStatu: .normal, imageName: nil, imageStatu: nil, supView: self.bgView, closure: { (make) in
            make.top.equalTo(self.titleLab.snp.bottom).offset(Adapt(20))
            make.left.equalTo(Adapt(20))
            make.right.equalTo(Adapt(-20))
            make.height.equalTo(Adapt(50))
        })
        
        self.loginBtn.setTitleColor(kWhite, for: .normal)
        self.loginBtn.backgroundColor = kMainOrangeColor
        self.loginBtn.titleLabel?.font = FontSize(15)
        self.loginBtn.layer.cornerRadius = 3
        
        
        
        self.registerBtn = UIButton.zj_createButton(title: "快速注册", titleStatu: .normal, imageName: nil, imageStatu: nil, supView: self.bgView, closure: { (make) in
            make.top.equalTo(self.loginBtn.snp.bottom).offset(Adapt(20))
            make.left.equalTo(Adapt(20))
            make.right.equalTo(Adapt(-20))
            make.height.equalTo(Adapt(50))
        })
        
        self.registerBtn.setTitleColor(kMainOrangeColor, for: .normal)
        self.registerBtn.backgroundColor =  kWhite
        self.registerBtn.titleLabel?.font = FontSize(15)
        self.registerBtn.layer.cornerRadius = 3
        self.registerBtn.layer.borderColor = kMainOrangeColor.cgColor
        self.registerBtn.layer.borderWidth = 0.6
        
        self.descLab = UILabel.zj_createLabel(text: "使用即为同意使用《斗鱼注册协议及版权声明》", textColor: kGrayTextColor, font: FontSize(12), supView: self.bgView, closure: { (make) in
            make.top.equalTo(self.registerBtn.snp.bottom).offset(20)
            make.left.equalTo(self.registerBtn.snp.left)
        })
        
        
    }
    
}
