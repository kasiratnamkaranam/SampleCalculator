//
//  ViewController.h
//  SampleCalculator
//
//  Created by Karanam Kasiratnam on 12/07/13.
//  Copyright (c) 2013 Karanam Kasiratnam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Twitter/Twitter.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController<AVAudioPlayerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *enterValue1;
@property (weak, nonatomic) IBOutlet UITextField *enterValue2;
@property (weak, nonatomic) IBOutlet UILabel *resultDisplay;
@property (weak, nonatomic) IBOutlet UILabel *operatorLbl;
@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, retain) UIButton *audioButon;



- (IBAction)addition:(id)sender;
- (IBAction)substraction:(id)sender;
- (IBAction)multiplication:(id)sender;
- (IBAction)division:(id)sender;
- (IBAction)postToFaceBook:(id)sender;
- (IBAction)postToTwitter:(id)sender;

@end
