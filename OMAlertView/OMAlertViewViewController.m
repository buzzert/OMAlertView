//
//  OMAlertViewViewController.m
//  OMAlertView
//
//  Created by James Magahern on 6/7/11.
//  Copyright 2011 Apple Inc. All rights reserved.
//

#import "OMAlertViewViewController.h"
#import "OMAlertView.h"

@implementation OMAlertViewViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Interface Builder Actions

- (IBAction)showRedAlert:(id)sender {
    OMAlertView *alert = [[OMAlertView alloc] initWithTitle:@"Red Alert"
                                                    message:@"This is a warning! Everybody out of the chunnel!"
                                                   delegate:nil
                                          cancelButtonTitle:@"AHH!"
                                          otherButtonTitles:nil]; 
    [alert setBackgroundColor:[UIColor redColor]];
    
    [alert show];
    [alert release];
}

- (IBAction)showClearAlert:(id)sender {
    OMAlertView *alert = [[OMAlertView alloc] initWithTitle:@"Clear Alert"
                                                    message:@"Ice, anyone?"
                                                   delegate:nil
                                          cancelButtonTitle:@"Sure"
                                          otherButtonTitles:nil];
    
    [alert setBackgroundColor:[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.64f]];
    [alert setTextColor:[UIColor blackColor]];
    
    [alert show];
    [alert release];
}

- (IBAction)showAlertBackgroundImage:(id)sender {
    OMAlertView *alert = [[OMAlertView alloc] initWithTitle:@"Groovy Alert"
                                                    message:@"It's like a blast from the seventies!"
                                                   delegate:nil
                                          cancelButtonTitle:@"Far Out"
                                          otherButtonTitles:nil];
    
    [alert setBackgroundImage:[UIImage imageNamed:@"coolBackground.png"]];
    
    [alert show];
}

- (IBAction)showAlertNoGloss:(id)sender {
    OMAlertView *alert = [[OMAlertView alloc] initWithTitle:@"No Gloss"
                                                    message:@"I feel like I'm in a comic book!"
                                                   delegate:nil
                                          cancelButtonTitle:@"Whoah"
                                          otherButtonTitles:nil];
    
    [alert setGlossOpacity:0.0f];
    
    [alert show];
}

- (IBAction)showSquareAlert:(id)sender {
    OMAlertView *alert = [[OMAlertView alloc] initWithTitle:@"Squared"
                                                    message:@"Don't be a square!"
                                                   delegate:nil
                                          cancelButtonTitle:@"Yes sir"
                                          otherButtonTitles:nil];
    
    [alert setBorderRadius:0.0f];
    
    [alert show];
}

- (IBAction)showAlertDifferentFonts:(id)sender {
    OMAlertView *alert = [[OMAlertView alloc] initWithTitle:@"Weird Fonts"
                                                    message:@"Don't use Comic Sans please!"
                                                   delegate:nil
                                          cancelButtonTitle:@"Okay"
                                          otherButtonTitles:nil];
    
    [alert setTitleFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:16.0f]];
    [alert setBodyFont:[UIFont fontWithName:@"MarkerFelt-Thin" size:14.0f]];
    
    [alert show];
}



- (void)dealloc {
    [showClearAlert release];
    [super dealloc];
}
- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
