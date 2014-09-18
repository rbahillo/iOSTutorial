//
//  IAViewController.h
//  Hello Time
//
//  Created by Ricardo Bahillo on 18/09/14.
//  Copyright (c) 2014 OdigeO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *modeButton;
- (IBAction)toggleMode:(id)sender;

@end
