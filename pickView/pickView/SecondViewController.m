//
//  SecondViewController.m
//  pickView
//
//  Created by qingyun on 15/11/2.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) NSArray *datas;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDatas];
    _label.text = _datas.firstObject;
}

- (void)loadDatas
{
    _datas = @[@"Luke", @"Leia", @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando"];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _datas.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row != 0) {
        return _datas[row];
    }
    return nil;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0) {
        NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:_datas[row] attributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSUnderlineStyleAttributeName:@1}];
        return attStr;
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _label.text = _datas[row];
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











