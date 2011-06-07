//
//  CustomAlert.h
//  CustomAlert
//
//  Created by James Magahern on 2/6/11.
//  Copyright 2011 omegaHern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIAlertView (Private_Stuff)
- (UILabel*)titleLabel;
- (UILabel*)bodyTextLabel;
@end

@interface OMAlertView : UIAlertView {
    UIColor *backgroundColor;
    UIColor *borderColor;
    UIColor *shadowColor;
    
    UIFont *titleFont;
    UIFont *bodyFont;
    
    UIColor *textColor;
    UIColor *textShadowColor;
    
    CGFloat glossOpacity;
    CGFloat borderWidth;
    
    CGFloat borderRadius;
    CGFloat shadowRadius;
	
	UIImage *backgroundImage;
    
    NSString *alertName;
}

@property (nonatomic, retain) UIColor *backgroundColor;
@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic, retain) UIColor *shadowColor;

@property (nonatomic, retain) UIFont *titleFont;
@property (nonatomic, retain) UIFont *bodyFont;

@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, retain) UIColor *textShadowColor;

@property (readwrite) CGFloat glossOpacity;
@property (readwrite) CGFloat borderWidth;

@property (readwrite) CGFloat borderRadius;
@property (readwrite) CGFloat shadowRadius;

@property (nonatomic, retain) UIImage *backgroundImage;

@property (nonatomic, retain) NSString *alertName;

@end
