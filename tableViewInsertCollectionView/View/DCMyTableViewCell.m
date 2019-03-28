//
//  DCMyTableViewCell.m
//  tableViewInsertCollectionView
//
//  Created by 大橙子 on 2019/3/27.
//  Copyright © 2019 Tomous. All rights reserved.
//

#import "DCMyTableViewCell.h"
#import "DCMyCollectionViewCell.h"
#import "DCCollectionViewFlowLayout.h"
static NSString *CellId = @"CellId";
@interface DCMyTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UICollectionView *collectionView;
@end
@implementation DCMyTableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellID = [NSString stringWithFormat:@"Cell--%ld",indexPath.row];
    DCMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[DCMyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpBaseUI];
    }
    return self;
}
-(void)setUpBaseUI {
    self.backgroundColor = [UIColor lightGrayColor];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, ScreenWidth, 30)];
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.titleLabel];
    
    /** 创建UICollectionViewFlowLayout的子类，固定cell之间的距离，解决如果cell是一个的话，会居中的bug */
    DCCollectionViewFlowLayout *layout = [[DCCollectionViewFlowLayout alloc]init];
    CGFloat itemWidth = ScreenWidth/2;
    // 设置每个item的大小
    layout.estimatedItemSize = CGSizeMake(itemWidth-10, 25);
    // 设置列间距
    layout.minimumInteritemSpacing = 1;
    // 设置行间距
    layout.minimumLineSpacing = 1;
    //每个分区的四边间距UIEdgeInsetsMake
    layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    /**
     初始化mainCollectionView
     设置collectionView的位置
     */
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.titleLabel.bottom+10, ScreenWidth, 50) collectionViewLayout:layout];
    self.collectionView.scrollEnabled = NO;
    [self.collectionView registerClass:[DCMyCollectionViewCell class] forCellWithReuseIdentifier:CellId];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = CGRectMake(0, self.titleLabel.bottom, ScreenWidth, (self.model.carType.count/2+self.model.carType.count%2)*30);
}
-(void)setModel:(DCCarModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.model.carType.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DCMyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellId forIndexPath:indexPath];
    cell.model = self.model.carType[indexPath.row];
    return cell;
}
@end
