//
//  CasmenuView.h
//  省市区联动
//
//  Created by jx on 2018/10/10.
//  Copyright © 2018年 jx. All rights reserved.
//
#import "keyValueModel.h"
#import <UIKit/UIKit.h>

@interface CasmenuView : UIView

@property (nonatomic, copy) void(^selectedBlock)(keyValueModel * lSelectedModel,keyValueModel * mSelectedModel,keyValueModel * rSelectedModel,BOOL hidden);

@end
