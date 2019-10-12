//
//  TodayViewController.m
//  测试widget
//
//  Created by 张冲 on 2018/3/29.
//  Copyright © 2018年 张冲. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UILabel *hahaLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonclick;
- (IBAction)buttonClick:(id)sender;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *groupID = @"group.zhangcc.--widget.--widget";
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:groupID];
    NSString *string = [NSString stringWithFormat:@"%@",[shared objectForKey:@"number"]];

    self.hahaLabel.text = string;
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (IBAction)buttonClick:(id)sender {
    NSString *customURL = @"zhangkaifang://?ertyuiodfghjk";
    [self.extensionContext openURL:[NSURL URLWithString:customURL] completionHandler:^(BOOL success) {
        NSLog(@"open url result:%d",success);
    }];
}
@end
