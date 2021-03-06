
//
//  ZJCategroyListCell.swift
//  DouYuLive
//
//  Created by 邓志坚 on 2018/8/5.
//  Copyright © 2018年 邓志坚. All rights reserved.
//

import UIKit



class ZJCategroyListCell: ZJBaseTableCell {
    
    var cateTwoList : [ZJRecomCateList]? {
        didSet {
            collectionView.reloadData()
        }
    }
    // 分页控制器
    lazy var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = colorWithRGBA(236, 236, 236, 1.0)
        pageControl.currentPageIndicatorTintColor = colorWithRGBA(212, 212, 212, 1.0)
        return pageControl
    }()
    
    private lazy var layout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        // 横向滚动
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = kWhite
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ZJCategoryScrollItem.self, forCellWithReuseIdentifier:ZJCategoryScrollItem.identifier())
        // 分页控制
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        return collectionView
    }()
    
    override func zj_initWithView() {
        setUpAllView()
        layout.itemSize = CGSize(width: kScreenW, height: CateItemHeight * 2.0)
        pageControl.numberOfPages = 8
    }
    
}


extension ZJCategroyListCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if cateTwoList == nil{ return 0 }
        
        let pageNum = (cateTwoList!.count - 1) / 8 + 1
        pageControl.numberOfPages = pageNum
        
        if pageNum <= 1 {
            pageControl.isHidden = true
        }else{
            pageControl.isHidden = false
        }
        return pageNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: ZJCategoryScrollItem.identifier(), for: indexPath) as! ZJCategoryScrollItem
        
        let startIndex = indexPath.item * 8
        var endIndex = (indexPath.item + 1) * 8 - 1
        if endIndex > cateTwoList!.count - 1 {
            endIndex = cateTwoList!.count - 1
        }
        if (self.cateTwoList?.count)! > 0  {
            cell.dataArr = Array(cateTwoList![startIndex...endIndex])
        }
        
        return cell
    }
    
}


extension ZJCategroyListCell : UICollectionViewDelegate {
    // pageControl 的滚动事件
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width + 0.5)
    }
}

// 配置 UI
extension ZJCategroyListCell {
    
    private func setUpAllView (){
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(CateItemHeight * 2)
        }
        
        
        addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView.snp.bottom)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(150)
            make.height.equalTo(37)
        }
        
        
    }
}
