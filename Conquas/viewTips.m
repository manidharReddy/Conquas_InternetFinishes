//
//  viewTips.m
//  Conquas
//
//  Created by Aparna Reddy Challa on 30/08/12.
//  Copyright (c) 2012 MobTwo Pte Ltd. All rights reserved.
//

#import "viewTips.h"

@interface viewTips ()

@end

@implementation viewTips


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
    [super viewDidAppear:YES];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidAppear:(BOOL)animated {
    srand([[NSDate date] timeIntervalSince1970]);
    NSInteger randomNumber = arc4random() % 16;
    if (randomNumber == 0) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips1"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 1) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips2"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 2) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips3"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 3) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips4"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 4) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips5"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 5) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips6"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 6) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips7"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 7) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips8"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 8) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips9"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 9) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips10"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 10) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips11"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 11) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips12"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 12) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips13"]];
        ivImage.frame = CGRectMake(10, 100, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 13) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips14"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else if (randomNumber == 14) {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips15"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
    } else {
        UIImageView *ivImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips16"]];
        ivImage.frame = CGRectMake(10, 300, 745, 450);
        [self.view addSubview:ivImage];
        
        
    }
    [super viewDidAppear:animated];
}


@end
