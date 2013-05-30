//
//  ResultViewController.h
//  janken
//
//  Created by 剣持 淳也 on 2013/05/28.
//  Copyright (c) 2013年 剣持 淳也. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController{
    int result;
    NSString *cpuHand;
}
@property (nonatomic, assign) int result;
@property (nonatomic, copy) NSString *cpuHand;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *recordLabel;

@end
