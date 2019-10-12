//
//  ViewController.m
//  我的widget
//
//  Created by 张冲 on 2018/3/29.
//  Copyright © 2018年 张冲. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *groupID = @"group.zhangcc.--widget.--widget";
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:groupID];
    [shared setObject:@"亚曼" forKey:@"number"];
    [shared synchronize];  
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
