//
//  DCCarModel.h
//  tableViewInsertCollectionView
//
//  Created by 大橙子 on 2019/3/27.
//  Copyright © 2019 Tomous. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCCarDetailModel.h"
#import "MJExtension.h"
NS_ASSUME_NONNULL_BEGIN

@interface DCCarModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) NSArray <DCCarDetailModel *> *carType;
@end

NS_ASSUME_NONNULL_END
