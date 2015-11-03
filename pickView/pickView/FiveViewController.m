//
//  FiveViewController.m
//  pickView
//
//  Created by qingyun on 15/11/2.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSArray *images;
@property (nonatomic)NSInteger hardLevel;

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDatas];
    _hardLevel = 2;
    [self btnclick:nil];

    
}
- (void)loadDatas
{
    _images = @[@"apple",@"bar",@"cherry",@"crown",@"lemon",@"seven"];
}

- (IBAction)segment:(UISegmentedControl *)sender
{
    _hardLevel = sender.selectedSegmentIndex + 2;
}


- (IBAction)btnclick:(UIButton *)sender
{
    _label.text = @"";
    NSInteger numOfRowContinue = 1;
    NSInteger conpareRow = 0;
    BOOL isWin = NO;
    for (int i = 0 ; i < 5; i ++) {
        NSInteger selectedRow = round(random()%_images.count);
        [_pickerView selectRow:selectedRow inComponent:i animated:YES];
        
        if (i == 0) {
            conpareRow = selectedRow;
            numOfRowContinue = 1;
        }else{
            if (conpareRow == selectedRow) {
                numOfRowContinue ++;
            }else{
                numOfRowContinue = 1;
            }
            conpareRow = selectedRow;
        }
        if (numOfRowContinue >= _hardLevel) {
            isWin = YES;
        }
    }
    if (isWin) {
        _label.text = @"成功";
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _images.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 70;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:_images[row]]];
}


@end
