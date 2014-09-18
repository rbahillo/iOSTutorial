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
        self.timeLabel.backgroundColor = [UIColor whiteColor];
        [self.modeButton setTitle:@"Day" forState:UIControlStateNormal];
    }
    else{
        self.view.backgroundColor = [UIColor whiteColor];
        self.timeLabel.backgroundColor = [UIColor blackColor];
        [self.modeButton setTitle:@"Night" forState:UIControlStateNormal];
    }
}
@end
