//
//  PVC.m
//  XiaoYuanMap
//
//  Created by 周立贺 on 17/8/17.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "PVC.h"
#import "MainVC.h"
@interface PVC ()

@end

@implementation PVC

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    MainVC * mVC = [[MainVC alloc] init];
    
    [self presentViewController:mVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
