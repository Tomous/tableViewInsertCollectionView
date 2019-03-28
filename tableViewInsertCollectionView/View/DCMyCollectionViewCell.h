//
//  DCMyCollectionViewCell.h
//  tableViewInsertCollectionView
//
//  Created by 大橙子 on 2019/3/27.
//  Copyright © 2019 Tomous. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
#import "DCCarDetailModel.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
NS_ASSUME_NONNULL_BEGIN

@interface DCMyCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) DCCarDetailModel *model;
@end

NS_ASSUME_NONNULL_END
