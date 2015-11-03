//
//  ViewController.m
//  pickView
//
//  Created by qingyun on 15/11/2.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *section;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    
}
- (IBAction)select:(UIButton *)sender
{
    NSString *selectionStr = [NSString stringWithFormat:@"%@",[_datePicker.date descriptionWithLocale:_datePicker.locale]];
    //_section.text = selectionStr;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提醒" message:selectionStr preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

























