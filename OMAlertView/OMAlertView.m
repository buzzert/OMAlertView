//
//  CustomAlert.m
//  CustomAlert
//
//  Created by James Magahern on 2/6/11.
//  Copyright 2011 omegaHern. All rights reserved.
//

#import "OMAlertView.h"

// Defaults
#define kGlossOpacity 1.0f
#define kBorderWidth 2.0f

#define kRoundedRectRadius 10
#define kShadowRadius 5

@implementation OMAlertView
@synthesize backgroundColor, borderColor, shadowColor, backgroundImage;
@synthesize titleFont, bodyFont, textColor, textShadowColor, alertName, 
glossOpacity, borderWidth, borderRadius, shadowRadius;

- (void)dealloc {
    [super dealloc];
    
    if (backgroundColor != nil)
        [backgroundColor release];
    if (borderColor != nil)
        [borderColor release];
    if (shadowColor != nil)
        [shadowColor release];
    
    if (titleFont != nil)
        [titleFont release];
    if (bodyFont != nil)
        [bodyFont release];
    
    if (backgroundImage != nil)
        [backgroundImage release];
    
    [alertName release];
}

- (id)initWithFrame:(CGRect)frame {
    if( (self = [super initWithFrame:frame]) ) {
        
        // These are the default UIAlertView colors as of iOS 4.0
        if(self.backgroundColor == nil)
			self.backgroundColor = [UIColor colorWithRed:0.1098 green:0.1686 blue:0.3254 alpha:1.0];
        
        if (self.borderColor == nil)
			self.borderColor = [UIColor colorWithHue:0.625 saturation:0.0 brightness:1.0 alpha:0.8];
        
        if (self.shadowColor == nil)
            self.shadowColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.9f];
        
        self.textColor = nil;
        self.textShadowColor = nil;
        self.backgroundImage = nil;
        
        self.alertName = @"My Alert";
        
        self.glossOpacity = kGlossOpacity;
        self.borderWidth = kBorderWidth;
        
        self.borderRadius = kRoundedRectRadius;
        self.shadowRadius = kShadowRadius;
    }
    
    return self;
}

- (void)layoutSubviews {
	for (UIView *sub in [self subviews]) {
		if([sub class] == [UIImageView class] && sub.tag == 0) {
			[sub removeFromSuperview];
			break;
		}
	}
    
    UILabel *title = [self titleLabel];
    UILabel *body  = [self bodyTextLabel];
    
    if (titleFont != nil)
        [title setFont:titleFont];
    
    if (bodyFont != nil)
        [body setFont:bodyFont];
    
    if (textColor != nil) {
        [title setTextColor:textColor];
        [body setTextColor:textColor];
    } else {
        self.textColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
    }
    
    if (textShadowColor != nil) {
        [title setShadowColor:textShadowColor];
        [body setShadowColor:textShadowColor];
    } else {
        self.textShadowColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
    }
}

- (void)setTextColor:(UIColor *)_textColor {
    textColor = _textColor;
    
    UILabel *title = [self titleLabel];
    UILabel *body  = [self bodyTextLabel];
    
    [title setTextColor:textColor];
    [body setTextColor:textColor];
}

- (void) setTextShadowColor:(UIColor *)_textShadowColor {
    textShadowColor = _textShadowColor;
    
    UILabel *title = [self titleLabel];
    UILabel *body  = [self bodyTextLabel];
    
    [title setShadowColor:textShadowColor];
    [body setShadowColor:textShadowColor];
}

- (void)setTitleFont:(UIFont *)_titleFont {
    titleFont = _titleFont;
    
    UILabel *title = [self titleLabel];
    [title setFont:titleFont];
}

- (void)setBodyFont:(UIFont *)_bodyFont {
    bodyFont = _bodyFont;
    
    UILabel *body  = [self bodyTextLabel];
    [body setFont:bodyFont];
}

- (void) drawRoundedRect:(CGRect) rrect inContext:(CGContextRef) context withRadius:(CGFloat) radius {
	CGContextBeginPath (context);
    
	CGFloat minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), 
    maxx = CGRectGetMaxX(rrect);
    
	CGFloat miny = CGRectGetMinY(rrect), midy = CGRectGetMidY(rrect), 
    maxy = CGRectGetMaxY(rrect);
    
	CGContextMoveToPoint(context, minx, midy);
	CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
	CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
	CGContextClosePath(context);
}

- (void)drawRect:(CGRect)rect
{	
	CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Clear rect
	CGContextClearRect(context, rect);
    
    // Set options
	CGContextSetAlpha(context, 0.95); 
	CGContextSetLineWidth(context, borderWidth);
	CGContextSetStrokeColorWithColor(context, [borderColor CGColor]);
	
	if (self.backgroundImage == nil) {
		CGContextSetFillColorWithColor(context, [self.backgroundColor CGColor]);
	} else {
		CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
	}

	
    CGContextSetAllowsAntialiasing(context, true); // Anti-Aliasing
    
    
	// Draw background
	CGFloat padding = 2;
	CGRect backRect = CGRectMake(rect.origin.x + 3 + padding, 
                                 rect.origin.y + padding, 
                                 rect.size.width - 6 - padding*2, 
                                 rect.size.height - 8 - padding*2);    
    
    // Draw background with the shadow. This is the tricky part
    CGContextSaveGState(context);
    
    CGContextBeginTransparencyLayer(context, NULL);
    
    [self drawRoundedRect:backRect inContext:context withRadius:self.borderRadius];
    CGContextSetShadowWithColor(context, CGSizeMake(0, 3), self.shadowRadius, [shadowColor CGColor]);
    CGContextDrawPath(context, kCGPathFillStroke);
	
	
	
    
    
    CGRect clearRect = CGRectMake(backRect.origin.x + 2, backRect.origin.y - 20,
                                  backRect.size.width - 4, backRect.size.height);
    
    CGContextClearRect(context, clearRect);
    CGContextSetShadowWithColor(context, CGSizeZero, 0.0, NULL);
    
	
    [self drawRoundedRect:backRect inContext:context withRadius:self.borderRadius];
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    
	// Clip Context
	CGRect clipRect = CGRectMake(backRect.origin.x + padding-1, 
                                 backRect.origin.y + padding-1.1, 
                                 backRect.size.width - (padding-1)*2, 
                                 backRect.size.height - ((padding-1)*2 + 0.5));
	
	if (self.backgroundImage != nil) {
		CGContextSaveGState(context);
		[self drawRoundedRect:clipRect inContext:context withRadius:self.borderRadius];
		CGContextEOClip(context);
		CGContextSetAlpha(context, 0.85f);
		CGContextDrawImage(context, backRect, [self.backgroundImage CGImage]);
		CGContextRestoreGState(context);
	}
    
	[self drawRoundedRect:clipRect inContext:context withRadius:self.borderRadius];
	CGContextClip(context);
	
    
	// Draw highlight
	CGGradientRef glossGradient;
	CGColorSpaceRef rgbColorspace;
	size_t num_locations = 2;
	CGFloat locations[2] = { 0.0, 1.0 };
	CGFloat components[8] = { 1.0, 1.0, 1.0, 0.40, 1.0, 1.0, 1.0, 0.1 };
	rgbColorspace = CGColorSpaceCreateDeviceRGB();
	glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, 
                                                        components, locations, num_locations);
    
	CGRect ovalRect = CGRectMake(-20 + 2.3, -10, 320, 40);
    
	CGPoint start = CGPointMake(rect.origin.x, rect.origin.y + 3);
	CGPoint end = CGPointMake(rect.origin.x, 40);
    
	CGContextSetAlpha(context, glossOpacity); 
	CGContextAddEllipseInRect(context, ovalRect);
	CGContextClip (context);
    
	CGContextDrawLinearGradient(context, glossGradient, start, end, 0);
    
	CGGradientRelease(glossGradient);
	CGColorSpaceRelease(rgbColorspace); 
}

@end