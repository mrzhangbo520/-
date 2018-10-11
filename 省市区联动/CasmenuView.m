//
//  CasmenuView.m
//  省市区联动
//
//  Created by jx on 2018/10/10.
//  Copyright © 2018年 jx. All rights reserved.
//
#define tableviewWideth1 kScreen_Wideth/2.0
#define tableviewWideth2 kScreen_Wideth/3.0
#import "CasmenuView.h"
@interface CasmenuView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView                 *lTableView;
@property (nonatomic,strong)UITableView                 *mTableView;
@property (nonatomic,strong)UITableView                 *rTableView;

@property (nonatomic,strong)NSMutableArray              *lDataArray;
@property (nonatomic,strong)NSMutableArray              *mDataArray;
@property (nonatomic,strong)NSMutableArray              *rDataArray;

@end
@implementation CasmenuView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
    }
    return self;
}
-(void)addSubviews{
    
}
-(UITableView *)lTableView{
    if (!_lTableView) {
        _lTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _lTableView.backgroundColor = [UIColor lightTextColor];
        _lTableView.delegate = self;
        _lTableView.dataSource = self;
        _lTableView.estimatedRowHeight = 50;
        _lTableView.rowHeight = UITableViewAutomaticDimension;
        if (@available(iOS 11.0, *)) {
            _lTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _lTableView.estimatedSectionFooterHeight = 0;
            _lTableView.estimatedSectionHeaderHeight = 0;
        }
    }
    return _lTableView;
}
@end
