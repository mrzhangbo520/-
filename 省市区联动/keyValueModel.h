//
//  keyValueModel.h
//  省市区联动
//
//  Created by jx on 2018/10/11.
//  Copyright © 2018年 jx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface keyValueModel : NSObject
@property (nonatomic,strong)NSString *value;
@property (nonatomic,strong)NSString *key;
@property (nonatomic, assign) BOOL selected;
@end
