//
//  ResultViewController.m
//  janken
//
//  Created by 剣持 淳也 on 2013/05/28.
//  Copyright (c) 2013年 剣持 淳也. All rights reserved.
//

#import "ResultViewController.h"
#import "AppDelegate.h"

@interface ResultViewController ()

@end

@implementation ResultViewController
@synthesize result;
@synthesize yourHand;
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

    // 結果の表示
    switch (result) {
        case -1:
            self.resultLabel.text = @"負けました";
            self.resultLabel.textColor = [UIColor redColor];
            break;
        case 0:
            self.resultLabel.text = @"引き分けです";
            self.resultLabel.textColor = [UIColor greenColor];
            break;
        case 1:
            self.resultLabel.text = @"勝ちました";
            self.resultLabel.textColor = [UIColor blueColor];
            break;
            
        default:
            break;
    }
    
    // プレイヤーとCPUの手を表示
    self.yourHandImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"janken_%@", self.yourHand]];
    self.cpuHandImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"janken_%@", self.cpuHand]];
    
    // 成績の表示
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate setRecordLabel:self.recordLabel];

//    // TODO: このメソッドは共通化したい
//    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
//    NSInteger win = [data integerForKey:@"win"];
//    NSInteger even = [data integerForKey:@"even"];
//    NSInteger lose = [data integerForKey:@"lose"];
//    self.recordLabel.text = [NSString stringWithFormat:@"%d勝%d負%d引き分け", win, lose, even];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
