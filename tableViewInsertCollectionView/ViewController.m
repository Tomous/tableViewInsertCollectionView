//
//  ViewController.m
//  tableViewInsertCollectionView
//
//  Created by 大橙子 on 2019/3/27.
//  Copyright © 2019 Tomous. All rights reserved.
//

#import "ViewController.h"
#import "DCMyTableViewCell.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation ViewController
-(NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *data = @[
                      @{
                          @"title":@"11111111",
                          @"carType":@[
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      }
                                  ]
                          },
                      @{
                          @"title":@"2222222",
                          @"carType":@[
                                  @{
                                      @"carType":@"长安跨越-长安长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  ]
                          },
                      @{
                          @"title":@"333333",
                          @"carType":@[
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安长安长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      }
                                  ]
                          },
                      @{
                          @"title":@"44444444",
                          @"carType":@[
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越长安长安-长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  ]
                          },
                      @{
                          @"title":@"5555555",
                          @"carType":@[
                                  @{
                                      @"carType":@"长安跨越-长长安长安安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  ]
                          },
                      @{
                          @"title":@"66666",
                          @"carType":@[
                                  @{
                                      @"carType":@"长安跨越-长长安长安安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V5",
                                      @"carNum":@"2辆"
                                      },
                                  ]
                          },
                      @{
                          @"title":@"77777",
                          @"carType":@[
                                  @{
                                      @"carType":@"长安跨越-长长安长安安V5",
                                      @"carNum":@"2辆"
                                      }
                                  ]
                          },
                      @{
                          @"title":@"888888",
                          @"carType":@[
                                  @{
                                      @"carType":@"长安跨越-长安安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V2325",
                                      @"carNum":@"2辆"
                                      }
                                  ]
                          },
                      @{
                          @"title":@"9999999",
                          @"carType":@[
                                  @{
                                      @"carType":@"长安跨越-长长安安V5",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V345",
                                      @"carNum":@"2辆"
                                      },
                                  @{
                                      @"carType":@"长安跨越-长安V245",
                                      @"carNum":@"2辆"
                                      }
                                  ]
                          }
                      ];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataSource = [DCCarModel mj_objectArrayWithKeyValuesArray:data];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DCMyTableViewCell *cell = [DCMyTableViewCell cellWithTableView:tableView forRowAtIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DCCarModel *model = self.dataSource[indexPath.row];
    return 50+(model.carType.count/2+model.carType.count%2)*30;
}
@end
