//
//  TaisenViewController.m
//  janken
//
//  Created by 剣持 淳也 on 2013/05/28.
//  Copyright (c) 2013年 剣持 淳也. All rights reserved.
//

#import "TaisenViewController.h"
#import "ResultViewController.h"
#import "AppDelegate.h"

@interface TaisenViewController ()

@end

@implementation TaisenViewController

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
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate setRecordLabel:self.recordLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue identifier] == nil){
        return;
    }
    
    srand(time(nil));
    int val = rand() % 3;
    
    NSString *cpuHand = @"";
    
    switch (val) {
        case 0:
            cpuHand = @"gu";
            break;
        case 1:
            cpuHand = @"cho";
            break;
        case 2:
            cpuHand = @"pa";
            break;
        default:
            break;
    }
    
    int result = 0;
    
    if([[segue identifier] isEqualToString:@"gu"]){
        if([cpuHand isEqualToString:@"gu"]){
            result = 0;
        }else if([cpuHand isEqualToString:@"cho"]){
            result = 1;
        }else if([cpuHand isEqualToString:@"pa"]){
            result = -1;
        }
    } else if([[segue identifier] isEqualToString:@"cho"]){
        if([cpuHand isEqualToString:@"gu"]){
            result = -1;
        }else if([cpuHand isEqualToString:@"cho"]){
            result = 0;
        }else if([cpuHand isEqualToString:@"pa"]){
            result = 1;
        }
    } else if([[segue identifier] isEqualToString:@"pa"]){
        if([cpuHand isEqualToString:@"gu"]){
            result = 1;
        }else if([cpuHand isEqualToString:@"cho"]){
            result = -1;
        }else if([cpuHand isEqualToString:@"pa"]){
            result = 0;
        }
    }
    
    
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    
    switch (result) {
        case -1:
            [data setInteger:[data integerForKey:@"lose"] + 1 forKey:@"lose"];
            break;
        case 0:
            [data setInteger:[data integerForKey:@"even"] + 1 forKey:@"even"];
            break;
        case 1:
            [data setInteger:[data integerForKey:@"win"] + 1 forKey:@"win"];
            break;
        default:
            break;
    }
    ResultViewController *resultViewController = segue.destinationViewController;
    resultViewController.result = result;
    resultViewController.cpuHand = cpuHand;
}

- (IBAction)returnTaisenView:(UIStoryboardSegue *)segue {

    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate setRecordLabel:self.recordLabel];
    
}


//- (void)setRecordLabel:(UILabel *)label {
//    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
//    NSInteger win = [data integerForKey:@"win"];
//    NSInteger even = [data integerForKey:@"even"];
//    NSInteger lose = [data integerForKey:@"lose"];
//    label.text = [NSString stringWithFormat:@"%d勝%d負%d引き分け", win, lose, even];
//}

@end
