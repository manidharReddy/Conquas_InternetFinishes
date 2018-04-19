//
//  CheckBox.h
//  Conquas
//
//  Created by Aparna Reddy Challa on 03/09/12.
//  Copyright (c) 2012 MobTwo Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
#import <QuartzCore/QuartzCore.h>
#import "GraphView.h"
#import "GraphView1.h"
#define degreesToRadian(x) (M_PI * (x) / 180.0)

@interface CheckBox : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    __weak IBOutlet UILabel *label1;
    int checkFloorL1_State_00,checkFloorL1_State_10,checkFloorL1_State_20,checkFloorL1_State_30;
    
    NSString *databasePath;
    
    sqlite3 *CONQUASDB;
    
    
        
        UIPickerView *singlePicker;
        NSArray *pickerData;
    

    
    //UIScrollView *scroller;
    
    
    //UIButton *checkBox;
    
    //UILabel *checkBoxLabel;
}
@property (weak, nonatomic) IBOutlet UIButton *nextButtun;
@property (weak, nonatomic) IBOutlet UIButton *prevsButton;
@property (weak, nonatomic) IBOutlet UIButton *loadSavedBtn;
@property (weak, nonatomic) IBOutlet UIButton *showPicker;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UITextField *txtLocation4;
- (IBAction)searchButton1:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButtonO;
- (IBAction)nextButton:(id)sender;
- (IBAction)prevButton:(id)sender;
- (IBAction)closeDatadbView:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewDatadb2;
@property (weak, nonatomic) IBOutlet UIView *viewDatadb1;
@property (weak, nonatomic) IBOutlet UIScrollView *scrolDatadb2;
@property (weak, nonatomic) IBOutlet UIScrollView *scrolDatadb1;
@property (weak, nonatomic) IBOutlet UIView *mainView2;
@property (weak, nonatomic) IBOutlet UIView *mainView1;
@property (weak, nonatomic) IBOutlet UIView *mainView;
//- (IBAction)deleteButton:(id)sender;
- (IBAction)clearAll:(id)sender;
- (IBAction)gotoPage:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *pageView;
@property (weak, nonatomic) IBOutlet UIView *viewPages;
@property (weak, nonatomic) IBOutlet UIScrollView *scrolPages;
@property (weak, nonatomic) IBOutlet UIPickerView *secondPicker;
- (IBAction)newButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showPickerData;
@property (weak, nonatomic) IBOutlet UILabel *showScoreData;
@property (weak, nonatomic) IBOutlet UILabel *showPageNumber;
- (IBAction)showPicker:(id)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *singlePicker;

@property (strong, nonatomic) NSArray *pickerData;

@property (weak, nonatomic) IBOutlet UILabel *label35;
@property (weak, nonatomic) IBOutlet UILabel *label34;
@property (weak, nonatomic) IBOutlet UILabel *label33;
@property (weak, nonatomic) IBOutlet UILabel *label32;
@property (weak, nonatomic) IBOutlet UILabel *label31;
@property (weak, nonatomic) IBOutlet UILabel *label30;
@property (weak, nonatomic) IBOutlet UILabel *label29;
@property (weak, nonatomic) IBOutlet UILabel *label28;
@property (weak, nonatomic) IBOutlet UILabel *label27;
@property (weak, nonatomic) IBOutlet UILabel *label26;
@property (weak, nonatomic) IBOutlet UILabel *label25;
@property (weak, nonatomic) IBOutlet UILabel *label24;
@property (weak, nonatomic) IBOutlet UILabel *label23;
@property (weak, nonatomic) IBOutlet UILabel *label22;
@property (weak, nonatomic) IBOutlet UILabel *label21;
@property (weak, nonatomic) IBOutlet UILabel *label20;
@property (weak, nonatomic) IBOutlet UILabel *label19;
@property (weak, nonatomic) IBOutlet UILabel *label18;
@property (weak, nonatomic) IBOutlet UILabel *label17;
@property (weak, nonatomic) IBOutlet UILabel *label16;
@property (weak, nonatomic) IBOutlet UILabel *label15;
@property (weak, nonatomic) IBOutlet UILabel *label14;
@property (weak, nonatomic) IBOutlet UILabel *label13;
@property (weak, nonatomic) IBOutlet UILabel *label12;
@property (weak, nonatomic) IBOutlet UILabel *label11;
@property (weak, nonatomic) IBOutlet UILabel *label10;
@property (weak, nonatomic) IBOutlet UILabel *label9;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
@property (weak, nonatomic) IBOutlet UIScrollView *scroller1;
- (void)retrieveSavedInformationNew:(id)sender;
- (IBAction)saveInternalFinishesDataNew:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtUnit1;
@property (weak, nonatomic) IBOutlet UITextField *txtStorey1;
@property (weak, nonatomic) IBOutlet UITextField *txtBlock1;
@property (weak, nonatomic) IBOutlet UITextField *txtLocation1;
@property (weak, nonatomic) IBOutlet UITextField *txtLocation2;
@property (weak, nonatomic) IBOutlet UITextField *txtLocation3;
@property (weak, nonatomic) IBOutlet UITextField *txtProjectID;
@property (weak, nonatomic) IBOutlet UITextField *txtProjectName;
-(BOOL)isNumeric:(NSString *)strValue;
//-(void)checkBoxSelect:(id)sender;

- (IBAction)backgroundTouched:(id)sender;

@end
