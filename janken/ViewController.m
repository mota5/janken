//
//  ViewController.m
//  janken
//
//  Created by 剣持 淳也 on 2013/05/28.
//  Copyright (c) 2013年 剣持 淳也. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    NSInteger win = [data integerForKey:@"win"];    // 定数化すべき？
    NSInteger even = [data integerForKey:@"even"];
    NSInteger lose = [data integerForKey:@"lose"];
    NSInteger sum = win + even + lose;
    if(sum == 0){
        self.tsudukiBtn.hidden = YES;
    }else{
        self.tsudukiBtn.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    
    if([[segue identifier] isEqualToString:@"hajime"]){
        [data setInteger:0 forKey:@"win"];
        [data setInteger:0 forKey:@"even"];
        [data setInteger:0 forKey:@"lose"];
    }else if([[segue identifier] isEqualToString:@"tsuduki"]){
        // 特になし
    }
    
}

- (IBAction)returnView:(UIStoryboardSegue *)segue {
    
}

@end
