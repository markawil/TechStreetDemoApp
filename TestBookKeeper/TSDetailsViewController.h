//
//  TSDetailsViewController.h
//  TestBookKeeper
//
//  Created by markw on 11/19/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSDetailsViewController : UIViewController

@property (nonatomic, strong) NSString *urlPath;
@property (weak, nonatomic) IBOutlet UIWebView *detailsWebView;

@end
