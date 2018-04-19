//
//  TableViewContViewController.m
//  Conquas
//
//  Created by Aparna Reddy Challa on 05/09/12.
//  Copyright (c) 2012 MobTwo Pte Ltd. All rights reserved.
//

#import "TableViewContViewController.h"

@interface TableViewContViewController ()

@end

@implementation TableViewContViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
