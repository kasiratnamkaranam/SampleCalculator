//
//  ViewController.m
//  SampleCalculator
//
//  Created by Karanam Kasiratnam on 12/07/13.
//  Copyright (c) 2013 Karanam Kasiratnam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize enterValue1,enterValue2,resultDisplay,operatorLbl;
@synthesize player,audioButon;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [player prepareToPlay];
    [player setDelegate:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addition:(id)sender {
    
    // intialize and enter the input variables a and b
    
    int a = [self.enterValue1.text intValue];
    int b = [self.enterValue2.text intValue];
    
    // Perform addition and store the result in variable c
    
    int c = a+b;
    
    self.operatorLbl.text = @"+";
    
    //Print the result in console
    
    NSLog(@"Addition output = %d",c);
    
    //Displays the result in display label
    
    self.resultDisplay.text = [NSString stringWithFormat:@"Addition of a + b = %d",c];
    
    // Audio for addition button
    
    NSError *error;
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"addition_video" ofType:@"m4a"];
    NSURL *file = [[NSURL alloc]initFileURLWithPath:path];
    
    AVAudioPlayer *play = [[AVAudioPlayer alloc]initWithContentsOfURL:file error: &error];
    self.player = play;
    self.audioButon.enabled = NO;
    [self.player play];
    
   
    
    
    
    
}

- (IBAction)substraction:(id)sender {
    
    // intialize and enter the input variables a and b
    
    int a = [self.enterValue1.text intValue];
    int b = [self.enterValue2.text intValue];
    
    // Perform substraction and store the substraction result in variable c
    
    int c = a-b;
    
    self.operatorLbl.text = @"-";
    
    // Print the result in console
    
    NSLog(@"Substraction output = %d",c);
    
    // Displays the result in label
    
    self.resultDisplay.text = [NSString stringWithFormat:@"Substraction of a - b = %d",c];
    
    
    // Audio for substraction button
    
    NSError *error;
    NSString *path = [[NSBundle mainBundle]pathForResource:@"substraction_video" ofType:@"m4a"];
    NSURL *file = [[NSURL alloc]initFileURLWithPath:path];
    AVAudioPlayer *play = [[AVAudioPlayer alloc]initWithContentsOfURL:file error:&error];
    
    self.player =play;
    
    self.audioButon.enabled = NO;
    [self.player  play];
    
    
    
}

- (IBAction)multiplication:(id)sender {
    
    // intialize and enter the input variables a and b
    
    int a = [self.enterValue1.text intValue];
    int b = [self.enterValue2.text intValue];
    
    // Perform multiplication and store the result in variable c
    
    int c = a*b;
    
    self.operatorLbl.text = @"*";
    
    // Print the result in console
    
    NSLog(@"Multiplication output = %d",c);
    
    // Display The result in label
    
    self.resultDisplay.text = [NSString stringWithFormat:@"Multiplication of a * b = %d",c];
    
    // Audio for multiplication button
    
    NSError *error;
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"multiplication_video" ofType:@"m4a"];
    NSURL *file = [[NSURL alloc]initFileURLWithPath:path];
    
    AVAudioPlayer *play = [[AVAudioPlayer alloc]initWithContentsOfURL:file error:&error];
    
    self.player = play;
    self.audioButon.enabled = NO;
    
    [self.player play];
    
    
}

- (IBAction)division:(id)sender {
    
    // intialize and enter the a and b values
    
    float a = [self.enterValue1.text intValue];
    float b = [self.enterValue2.text intValue];
    
    // Perform division operation and store the result in c
    
    float c = a/b;
    
    self.operatorLbl.text =@"/";
    
    //Print the result in console
    
    NSLog(@"Division Output = %f",c);
    
    // Display the division Output in label
    
    self.resultDisplay.text =[NSString stringWithFormat:@"Division of a / b = %f",c];
    
    // Audio in division button
    
    NSError *error;
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"division_video" ofType:@"m4a"];
    NSURL *file = [[NSURL alloc]initFileURLWithPath:path];
    
    AVAudioPlayer *play = [[AVAudioPlayer alloc]initWithContentsOfURL:file error:&error];
    
    self.player = play;
    self.audioButon.enabled = NO;
    [self.player play];
}

    // For posting to FaceBook integration 

- (IBAction)postToFaceBook:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        SLComposeViewControllerCompletionHandler myFacebook = ^(SLComposeViewControllerResult result){
            
            if (result == SLComposeViewControllerResultCancelled) {
                
                // Facebook compose Cancelled
                
                NSLog(@"Cancelled");
                
            }else{
                
                // Facebook compose is Done
                
                NSLog(@"Done");
            }
            
            [controller dismissViewControllerAnimated:YES completion:nil];
        };
        
        controller.completionHandler = myFacebook;
        
        // Adding the text to the faceBook Post value from iOS
        
        [controller setInitialText:@"Result"];
        [controller setInitialText:self.resultDisplay.text];
        
        [self presentViewController:controller animated:YES completion:nil];
        
        // Audio for facebook Button
        
        NSError *error;
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"facebook_video" ofType:@"m4a"];
        NSURL *file = [[NSURL alloc]initFileURLWithPath:path];
        
        AVAudioPlayer *play = [[AVAudioPlayer alloc]initWithContentsOfURL:file error:&error];
        
        self.player = play;
        self.audioButon.enabled = NO;
        
        [self.player play];
        
        
    }
    
}

       // For posting to Twitter integration

- (IBAction)postToTwitter:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *twitterPost = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        SLComposeViewControllerCompletionHandler myTwitter = ^(SLComposeViewControllerResult result){
            
            if (result == SLComposeViewControllerResultCancelled){
                
                // Twitter Compose is Cancelled
                
                NSLog(@"Twitter compose is Cancelled ");
            }else{
                 
                // Twitter compose is Done
                
                NSLog(@"Twitter compose is Done");
            }
            
            [twitterPost dismissViewControllerAnimated:YES completion:nil];
            
        };
        
        twitterPost.completionHandler = myTwitter;
        
        // Adding the text to the twitter post value from iOS
        
        [twitterPost setInitialText:@"Result"];
        [twitterPost setInitialText:self.resultDisplay.text];
        
        [self presentViewController:twitterPost animated:YES completion:nil];
        
        // Audio for Twitter button
        
        NSError *error;
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"twitter_video" ofType:@"m4a"];
        NSURL *file = [[NSURL alloc]initFileURLWithPath:path];
        
        AVAudioPlayer *play = [[AVAudioPlayer alloc]initWithContentsOfURL:file error:&error];
        
        self.player = play;
        self.audioButon.enabled = NO;
        
        [self.player play];
        
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //Resign the keypad in view
    
    [self.view endEditing:YES];
    
    
}
@end
