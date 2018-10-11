//
//  CasmenuView.m
//  省市区联动
//
//  Created by jx on 2018/10/10.
//  Copyright © 2018年 jx. All rights reserved.
//
#define kScreen_Heighth  ([UIScreen mainScreen].bounds.size.height)
#define kScreen_Wideth   ([UIScreen mainScreen].bounds.size.width)
#define tableviewWideth1 kScreen_Wideth/2.0
#define tableviewWideth2 kScreen_Wideth/3.0


#import "CasmenuView.h"
#import "CasmenuTableViewCell.h"

@interface CasmenuView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView                * lTableView;
@property (nonatomic,strong)UITableView                * mTableView;
@property (nonatomic,strong)UITableView                * rTableView;

@property (nonatomic,strong)NSMutableArray             * lDataArray;
@property (nonatomic,strong)NSMutableArray             * mDataArray;
@property (nonatomic,strong)NSMutableArray             * rDataArray;

@property (nonatomic,strong)NSMutableArray             * sDataArray;
@property (nonatomic,strong)NSMutableArray             * sADataArray;


@property (nonatomic,strong) keyValueModel             * lSelectModel;
@property (nonatomic,strong) keyValueModel             * mSelectModel;
@property (nonatomic,strong) keyValueModel             * rSelectModel;

@end
@implementation CasmenuView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
        [self.lTableView reloadData];
        [self.mTableView reloadData];
        [self.rTableView reloadData];
        [self initDataSource];
        self.lSelectModel = [[keyValueModel alloc]init];
        self.mSelectModel = [[keyValueModel alloc]init];
        self.rSelectModel = [[keyValueModel alloc]init];

    }
    return self;
}
-(void)addSubviews{
    [self addSubview:self.rTableView];
    [self addSubview:self.mTableView];
    [self addSubview:self.lTableView];
}
-(UITableView *)lTableView{
    if (!_lTableView) {
        _lTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2) style:UITableViewStylePlain];
        _lTableView.backgroundColor = [UIColor lightTextColor];
        [_lTableView registerClass:[CasmenuTableViewCell class] forCellReuseIdentifier:@"SELECTLABLECELL"];
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
-(UITableView *)mTableView{
    if (!_mTableView) {
        _mTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2) style:UITableViewStylePlain];
        _mTableView.backgroundColor = [UIColor lightTextColor];
        [_mTableView registerClass:[CasmenuTableViewCell class] forCellReuseIdentifier:@"SELECTLABLECELL"];
        _mTableView.delegate = self;
        _mTableView.dataSource = self;
        _mTableView.estimatedRowHeight = 50;
        _mTableView.rowHeight = UITableViewAutomaticDimension;
        if (@available(iOS 11.0, *)) {
            _mTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _mTableView.estimatedSectionFooterHeight = 0;
            _mTableView.estimatedSectionHeaderHeight = 0;
        }
    }
    return _mTableView;
}
-(UITableView *)rTableView{
    if (!_rTableView) {
        _rTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2) style:UITableViewStylePlain];
        _rTableView.backgroundColor = [UIColor lightTextColor];
        [_rTableView registerClass:[CasmenuTableViewCell class] forCellReuseIdentifier:@"SELECTLABLECELL"];
        _rTableView.delegate = self;
        _rTableView.dataSource = self;
        _rTableView.estimatedRowHeight = 50;
        _rTableView.rowHeight = UITableViewAutomaticDimension;
        if (@available(iOS 11.0, *)) {
            _rTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _rTableView.estimatedSectionFooterHeight = 0;
            _rTableView.estimatedSectionHeaderHeight = 0;
        }
    }
    return _rTableView;
}
- (void)initDataSource{
    self.lDataArray = [[NSMutableArray alloc]init];
    self.mDataArray = [[NSMutableArray alloc]init];
    self.rDataArray = [[NSMutableArray alloc]init];
    
    self.sDataArray = [[NSMutableArray alloc]init];
    self.sADataArray = [[NSMutableArray alloc]init];
    NSArray *area =  [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"区" ofType:@"json"]] options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary *dic in area) {
        keyValueModel *keyValue = [[keyValueModel alloc]init];
        [keyValue setValuesForKeysWithDictionary:dic];
        [self.rDataArray addObject:keyValue];
    }
    
//    self.areaTotalArr = [LeKeyValueModel mj_objectArrayWithKeyValuesArray:areaArr];
    //        [areaArr mj_JSONObject]
    
    NSArray *cityArr = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"市" ofType:@"json"]] options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary *dic in cityArr) {
        keyValueModel *keyValue = [[keyValueModel alloc]init];
        [keyValue setValuesForKeysWithDictionary:dic];
        [self.mDataArray addObject:keyValue];
    }
    
//    self.cityTotalArr = [LeKeyValueModel mj_objectArrayWithKeyValuesArray:cityArr];
    
    NSArray *proArr = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"省" ofType:@"json"]] options:NSJSONReadingAllowFragments error:nil];
//    self.provinceArr  = [LeKeyValueModel mj_objectArrayWithKeyValuesArray:proArr];
//    self.pro_model_Selected = self.provinceArr[0];
    
    
    for (NSDictionary *dic in proArr) {
        keyValueModel *keyValue = [[keyValueModel alloc]init];
        [keyValue setValuesForKeysWithDictionary:dic];
        [self.lDataArray addObject:keyValue];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _lTableView) {
        return self.lDataArray.count;
    }else if (tableView == _mTableView){
        return self.sDataArray.count;
    }
        return self.sADataArray.count;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CasmenuTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SELECTLABLECELL" forIndexPath:indexPath];
    if(tableView == self.lTableView){
        cell.backgroundColor = [UIColor whiteColor];
//        cell.backgroundView = [[UIView alloc]initWithFrame:cell.contentView.bounds];
        keyValueModel *model = self.lDataArray[indexPath.row];
        cell.model = model;
    }else if (tableView == self.mTableView) {
        keyValueModel *model = self.sDataArray[indexPath.row];
        cell.model = model;
    }
        else if (tableView == self.rTableView){
        keyValueModel *model = self.sADataArray[indexPath.row];
        cell.model = model;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.lTableView) {
        [self twoGradeStates];
        [self.lDataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            keyValueModel *model = (keyValueModel*)obj;
            if (indexPath.row == idx) {
                model.selected = YES;
               self.sDataArray = [self UserKey:model.key CheckData:self.mDataArray];
                self.lSelectModel = model;
                [self.mTableView reloadData];
            }else{
                model.selected = NO;
            }
        }];
        [self.lTableView reloadData];
    }
    else if (tableView == self.mTableView){
        [self threeGradeStates];
        [self.sDataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            keyValueModel *model = (keyValueModel*)obj;
            if (indexPath.row == idx) {
                model.selected = YES;
                self.sADataArray = [self UserKey:model.key CheckData:self.rDataArray];
                self.mSelectModel = model;
                [self.rTableView reloadData];
            }else{
                model.selected = NO;
            }
        }];
        [self.mTableView reloadData];

    }else if (tableView == self.rTableView){
        
        [self.sADataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            keyValueModel *model = (keyValueModel*)obj;
            if (indexPath.row == idx) {
                model.selected = YES;
                self.rSelectModel = model;
            }else{
                model.selected = NO;
            }
        }];
        [self.rTableView reloadData];
        [self removeFromSuperview];
    }
        [self blockWithModel:_lSelectModel mModel:_mSelectModel rModel:_rSelectModel hiddenView:NO];
}
-(void)twoGradeStates{
    self.lTableView.frame = CGRectMake(0, 0,tableviewWideth1 , [UIScreen mainScreen].bounds.size.height/2);
    self.mTableView.frame = CGRectMake(tableviewWideth1, 0, tableviewWideth1, [UIScreen mainScreen].bounds.size.height/2);
}
-(void)threeGradeStates{
    self.lTableView.frame = CGRectMake(0, 0,tableviewWideth2 , [UIScreen mainScreen].bounds.size.height/2);
    self.mTableView.frame = CGRectMake(tableviewWideth2, 0, tableviewWideth2, [UIScreen mainScreen].bounds.size.height/2);
    self.rTableView.frame =CGRectMake(tableviewWideth2*2, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2);
}
//更换数据的算法
-(NSMutableArray*)UserKey:(NSString *)key CheckData:(NSMutableArray *)Data{
    NSMutableArray *array = [NSMutableArray array];
    [Data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        keyValueModel *model = (keyValueModel *)obj;
        if ([model.key hasPrefix:key]) {
            [array addObject:model];
        }
    }];
    return array;
}

//传值
- (void)blockWithModel:(keyValueModel*)lselectModel mModel:(keyValueModel*)mSelectModel rModel:(keyValueModel*)rSelectModel hiddenView:(BOOL)hidden
{
    if (self.selectedBlock) {
        self.selectedBlock(lselectModel,mSelectModel,rSelectModel,hidden);
    }
}

@end
