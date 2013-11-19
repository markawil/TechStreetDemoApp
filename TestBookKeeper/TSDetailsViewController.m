//
//  TSDetailsViewController.m
//  TestBookKeeper
//
//  Created by markw on 11/19/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import "TSDetailsViewController.h"

@interface TSDetailsViewController ()

@end

@implementation TSDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:self.urlPath];
    [self.detailsWebView loadRequest:[NSURLRequest requestWithURL:url]];
}

@end
