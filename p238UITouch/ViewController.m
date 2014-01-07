//
//  ViewController.m
//  p238UITouch
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL holdingImage;
}
@property (weak, nonatomic) IBOutlet UIImageView *appleImage;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    if(CGRectContainsPoint(self.appleImage.frame, point))
    {
        holdingImage = YES;
        self.appleImage.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"move count:%lu",(unsigned long)[[event allTouches] count]);
    
    if(holdingImage)
    {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        self.appleImage.center = point;
    }
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(holdingImage)
    {
        self.appleImage.transform = CGAffineTransformIdentity;
        holdingImage = NO;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
