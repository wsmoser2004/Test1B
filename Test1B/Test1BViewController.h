//
//  Test1BViewController.h
//  Test1B
//
//  Created by Moser, Wesley on 2/27/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Test1BViewController : UIViewController

@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *buttons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
- (IBAction)cardTapped:(id)sender;

@end
