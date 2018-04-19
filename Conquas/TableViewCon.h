//
//  TableViewCon.h
//  Conquas
//
//  Created by Aparna Reddy Challa on 05/09/12.
//  Copyright (c) 2012 MobTwo Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCon : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *listData;
@end
