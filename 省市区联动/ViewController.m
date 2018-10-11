//
//  ViewController.m
//  省市区联动
//
//  Created by jx on 2018/10/10.
//  Copyright © 2018年 jx. All rights reserved.
//

#import "ViewController.h"
#import "CasmenuView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CasmenuView *casmenuView = [[CasmenuView alloc]initWithFrame:self.view.bounds];
    [casmenuView setSelectedBlock:^(keyValueModel *lSelectedModel, keyValueModel *mSelectedModel, keyValueModel *rSelectedModel, BOOL hidden) {
        NSLog(@"%@-%@-%@",lSelectedModel.value,mSelectedModel.value,rSelectedModel.value);
        if (!hidden) {
            NSLog(@"走了一会");
        }
    }];
    [self.view addSubview:casmenuView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
