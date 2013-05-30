//
//  ResultViewController.m
//  janken
//
//  Created by 剣持 淳也 on 2013/05/28.
//  Copyright (c) 2013年 剣持 淳也. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController
@synthesize result;
@synthesize cpuHand;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    switch (result) {
        case -1:
            self.resultLabel.text = @"負けました";
            break;
        case 0:
            self.resultLabel.text = @"引き分けです";
            break;
        case 1:
            self.resultLabel.text = @"勝ちました";
            break;
            
        default:
            break;
    }
    
    
    // TODO: このメソッドは共通化したい
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    NSInteger win = [data integerForKey:@"win"];
    NSInteger even = [data integerForKey:@"even"];
    NSInteger lose = [data integerForKey:@"lose"];
    self.recordLabel.text = [NSString stringWithFormat:@"%d勝%d負%d引き分け", win, lose, even];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
