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
@synthesize enterValue1,enterValue2,resultDisplay;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //resultArray = [[NSMutableArray alloc]init];
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
    
    //Print the result in console
    
    NSLog(@"Addition output = %d",c);
    
    //Displays the result in display label
    
    self.resultDisplay.text = [NSString stringWithFormat:@"Result = %d",c];
}

- (IBAction)subtraction:(id)sender {
    
    // intialize and enter the input variables a and b
    
    int a = [self.enterValue1.text intValue];
    int b = [self.enterValue2.text intValue];
    
    // Perform subtraction and store the subtraction result in variable c
    
    int c = a-b;
    
    // Print the result in console
    
    NSLog(@"Subtraction output = %d",c);
    
    // Displays the result in label
    
    self.resultDisplay.text = [NSString stringWithFormat:@"Result = %d",c];
}

- (IBAction)multiplication:(id)sender {
    
    // intialize and enter the input variables a and b
    
    int a = [self.enterValue1.text intValue];
    int b = [self.enterValue2.text intValue];
    
    // Perform multiplication and store the result in variable c
    
    int c = a*b;
    
    // Print the result in console
    
    NSLog(@"Multiplication output = %d",c);
    
    // Display The result in label
    
    self.resultDisplay.text = [NSString stringWithFormat:@"Result = %d",c];
    
    
}

- (IBAction)division:(id)sender {
    
    // intialize and enter the a and b values
    
    float a = [self.enterValue1.text intValue];
    float b = [self.enterValue2.text intValue];
    
    // Perform division operation and store the result in c
    
    float c = a/b;
    
    //Print the result in console
    
    NSLog(@"Division Output = %f",c);
    
    // Display the division Output in label
    
    self.resultDisplay.text =[NSString stringWithFormat:@"Result = %f",c];
}

- (IBAction)faceBook:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        SLComposeViewControllerCompletionHandler myFacebook = ^(SLComposeViewControllerResult result){
            
            if (result == SLComposeViewControllerResultCancelled) {
                NSLog(@"Cancelled");
            }else{
                NSLog(@"Done");
            }
            
            [controller dismissViewControllerAnimated:YES completion:nil];
        };
        
        controller.completionHandler = myFacebook;
        
        // Adding the text to the faceBook Post value from iOS
        
        [controller setInitialText:@"Result"];
        [controller setInitialText:self.resultDisplay.text];
        
        [self presentViewController:controller animated:YES completion:nil];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //Resign the keypad in view
    
    [self.view endEditing:YES];
}
@end
