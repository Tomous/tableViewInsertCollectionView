//
//  DCMyCollectionViewCell.m
//  tableViewInsertCollectionView
//
//  Created by 大橙子 on 2019/3/27.
//  Copyright © 2019 Tomous. All rights reserved.
//

#import "DCMyCollectionViewCell.h"
@interface DCMyCollectionViewCell ()
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UILabel *detailLabel;
@end
@implementation DCMyCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return  self;
}
-(void)initView{
    self.bgView = [[UIView alloc]init];
    //    self.bgView.backgroundColor = RandomColor;
    self.bgView.layer.cornerRadius = 9;
    self.bgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.bgView.layer.borderWidth = 0.5;
    [self addSubview:self.bgView];
    
    self.detailLabel = [[UILabel alloc]init];
    //    self.detailLabel.backgroundColor = [UIColor whiteColor];
    self.detailLabel.font = [UIFont systemFontOfSize:12];
    self.detailLabel.textAlignment = NSTextAlignmentCenter;
//    self.detailLabel.textColor = DCColor(153,153,153);
    self.detailLabel.numberOfLines = 0;
    [self addSubview:self.detailLabel];
}
-(void)layoutSubviews {
    [super layoutSubviews];
    NSString *str = [NSString stringWithFormat:@"%@ %@辆",self.model.carType,self.model.carNum];
    CGSize maxSize = CGSizeMake((ScreenWidth-10)/2, 30);
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
    CGSize carSize = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    self.bgView.frame = CGRectMake(0, 0, carSize.width+10, carSize.height+4);
    self.detailLabel.frame = CGRectMake(5, 1, carSize.width, carSize.height+2);
}
-(void)setModel:(DCCarDetailModel *)model {
    _model = model;
    self.detailLabel.text = [NSString stringWithFormat:@"%@ %@辆",model.carType,model.carNum];
}
-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    // 获得每个cell的属性集
    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    // 计算cell里面textfield的宽度
    //    NSString *str = [NSString stringWithFormat:@"%@-%@ %@辆",self.model.brandName,self.model.vehicleModelName,self.model.carCount];
    CGRect frame = [self.detailLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 30) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.detailLabel.font,NSFontAttributeName, nil] context:nil];
    
    // 这里在本身宽度的基础上 又增加了10
    frame.size.width += 10;
    frame.size.height = 30;
    
    // 重新赋值给属性集
    attributes.frame = frame;
    
    return attributes;
}
@end
