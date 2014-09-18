//
//  IAViewController.m
//  Hello Time
//
//  Created by Ricardo Bahillo on 18/09/14.
//  Copyright (c) 2014 OdigeO. All rights reserved.
//

#import "IAViewController.h"

@interface IAViewController ()

@end

@implementation IAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self checkTime:self];
    NSLog(@"viewDidLoad: called");
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidAppear: called");
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"viewWillAppear: called");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) checkTime: (id) sender{
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"h:mm:ss a"];
    [self.timeLabel setText:[formater stringFromDate:[NSDate date]]];
    
    [self performSelector:@selector(checkTime:) withObject: self afterDelay:1.0];
}

- (IBAction)toggleMode:(id)sender {
    
    if ([self.modeButton.titleLabel.text isEqualToString: @"Night"]){
        self.view.backgroundColor = [UIColor blackColor];
        self.timeLabel.textColor = [UIColor whiteColor];
        [self.modeButton setTitle:@"Day" forState:UIControlStateNormal];
    }
    else{
        self.view.backgroundColor = [UIColor whiteColor];
        self.timeLabel.textColor = [UIColor blackColor];
        [self.modeButton setTitle:@"Night" forState:UIControlStateNormal];
    }
}

- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    CGRect timeFrame = self.timeLabel.frame;
    float viewHeight = self.view.frame.size.height;
    float viewWidth = self.view.frame.size.width;
    float fontSize = 30.0;
    BOOL hideButton = YES;
    
    if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
        fontSize=40.0;
        timeFrame.origin.y=(viewWidth/2) - timeFrame.size.height;
        timeFrame.size.width=viewWidth;
    }
    else{
        hideButton=NO;
        timeFrame.origin.y=(viewHeight/2) - timeFrame.size.height;
        timeFrame.size.width=viewWidth;
    }
    
    [self.modeButton setHidden:hideButton];
    [self.timeLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [self.timeLabel setFrame:timeFrame];
    
}

- (NSUInteger) supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape | UIInterfaceOrientationMaskPortrait;
}
@end
