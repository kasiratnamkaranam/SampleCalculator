//
//  ViewController.h
//  SampleCalculator
//
//  Created by Karanam Kasiratnam on 12/07/13.
//  Copyright (c) 2013 Karanam Kasiratnam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *enterValue1;
@property (weak, nonatomic) IBOutlet UITextField *enterValue2;
@property (weak, nonatomic) IBOutlet UILabel *resultDisplay;
//@property (nonatomic, retain) NSMutableArray *resultArray;
- (IBAction)addition:(id)sender;
- (IBAction)subtraction:(id)sender;
- (IBAction)multiplication:(id)sender;
- (IBAction)division:(id)sender;
- (IBAction)faceBook:(id)sender;

@end
