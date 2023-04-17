//
//  IphoneCell.swift
//  Homework0603
//
//  Created by Бектур Кадыркулов on 17/4/23.
//

import Foundation

import SnapKit


class IphoneCell:UICollectionViewCell {
    
    static var reuseld = "iphone_cell"
    
    private lazy var titleLabel:UILabel = {
        let view = UILabel()
        return view
    }()
    private lazy var priceLabel:UILabel = {
        let view = UILabel()
        return view
    }()
    private lazy var descripitionLabel:UILabel = {
        let view = UILabel()
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func fill (phone:Phone){
        titleLabel.text = phone.title
        descripitionLabel.text = phone.descripition
        priceLabel.text = phone.price
    }
    
    func setupSubView(){
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(200)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        addSubview(descripitionLabel)
        descripitionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
