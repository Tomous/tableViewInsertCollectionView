//
//  DCMyTableViewCell.h
//  tableViewInsertCollectionView
//
//  Created by 大橙子 on 2019/3/27.
//  Copyright © 2019 Tomous. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCCarModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface DCMyTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView forRowAtIndexPath:(NSIndexPath *)indexPath;
@property (nonatomic,strong) DCCarModel *model;
@end

NS_ASSUME_NONNULL_END
