//
//  OMAlertViewViewController.h
//  OMAlertView
//
//  Created by James Magahern on 6/7/11.
//  Copyright 2011 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMAlertViewViewController : UIViewController {
    UIButton *showClearAlert;
}

- (IBAction)showRedAlert:(id)sender;
- (IBAction)showClearAlert:(id)sender;
- (IBAction)showAlertBackgroundImage:(id)sender;
- (IBAction)showAlertNoGloss:(id)sender;
- (IBAction)showSquareAlert:(id)sender;
- (IBAction)showAlertDifferentFonts:(id)sender;

@end
