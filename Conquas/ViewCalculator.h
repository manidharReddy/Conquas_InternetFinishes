//
//  ViewCalculator.h
//  Conquas
//
//  Created by Aparna Reddy Challa on 27/08/12.
//  Copyright (c) 2012 MobTwo Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface ViewCalculator : UIViewController
{
    BOOL isKeyboardShown;
    sqlite3 *CONQUASDB;
    NSString *databasePath;
    NSString *elementType;
    NSString *defectType;
    NSString *numTicks;
    NSString *numChecks;
     UIButton *numberPadDoneButton;
    UIImage *numberPadDoneImageNormal;
    UIImage *numberPadDoneImageHighlighted;
    
}



@property (retain) NSString *elementType;
@property (retain) NSString *defectType;
@property (retain) NSString *numTicks;
@property (retain) NSString *numChecks;
@property (weak, nonatomic) IBOutlet UIButton *btnReset;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
@property (weak, nonatomic) IBOutlet UIScrollView *svSavedInformation;
@property (weak, nonatomic) IBOutlet UITextField *txtWindowADChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtWindowADTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtWindowFunctionalityChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtWindowFunctionalityTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtWindowMDChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtWindowMDTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtWindowAEChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtWindowAETicks;
@property (weak, nonatomic) IBOutlet UITextField *txtWindowJGChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtWindowJGTicks;
@property (weak, nonatomic) IBOutlet UIView *viewWindow;
@property (weak, nonatomic) IBOutlet UITextField *txtWallJointingChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtWallJointingTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtWallHollownessChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtWallHollownessTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtWallCDChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtWallCDTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtWallAEChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtWallAETicks;
@property (weak, nonatomic) IBOutlet UITextField *txtWallFinishingChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtWallFinishingTicks;
@property (weak, nonatomic) IBOutlet UIView *viewWall;
@property (weak, nonatomic) IBOutlet UIView *viewME;
@property (weak, nonatomic) IBOutlet UITextField *txtMEADChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtMEADTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtMEFunctionalityChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtMEFunctionalityTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtMEMDChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtMEMDTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtMEAEChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtMEAETicks;
@property (weak, nonatomic) IBOutlet UITextField *txtMEJGChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtMEJGTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtFloorJointingChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtFloorJointingTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtFloorHollownessChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtFloorHollownessTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtFloorCDChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtFloorCDTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtFloorAEChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtFloorAETicks;
@property (weak, nonatomic) IBOutlet UITextField *txtFloorFinishingChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtFloorFinishingTicks;
@property (weak, nonatomic) IBOutlet UIView *viewFloor;
@property (weak, nonatomic) IBOutlet UITextField *txtDoorADChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtDoorADTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtDoorFunctionalityChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtDoorFunctionalityTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtDoorMDChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtDoorMDTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtDoorAEChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtDoorAETicks;
@property (weak, nonatomic) IBOutlet UITextField *txtDoorJGChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtDoorJGTicks;
@property (weak, nonatomic) IBOutlet UIView *viewDoor;
@property (weak, nonatomic) IBOutlet UIView *viewComponent;
@property (weak, nonatomic) IBOutlet UITextField *txtComponentADChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtComponentADTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtComponentFunctionalityChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtComponentFunctionalityTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtComponentMDChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtComponentMDTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtComponentAEChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtComponentAETicks;
@property (weak, nonatomic) IBOutlet UITextField *txtComponentJGChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtComponentJGTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtCeilingJointingChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtCeilingJointingTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtCeilingRoughnessChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtCeilingRoughnessTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtCeilingCDChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtCeilingCDTicks;
@property (weak, nonatomic) IBOutlet UITextField *txtCeilingAEChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtCeilingAETicks;
@property (weak, nonatomic) IBOutlet UITextField *txtCeilingFinishingChecks;
@property (weak, nonatomic) IBOutlet UITextField *txtCeilingFinishingTicks;
@property (weak, nonatomic) IBOutlet UIView *viewCelling;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UISlider *calculaterSlider;
@property (weak, nonatomic) IBOutlet UISlider *editionNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtLocationName;
@property (weak, nonatomic) IBOutlet UITextField *txtUnitNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtStoreyNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtBlkNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblEditionNumber;
@property (weak, nonatomic) IBOutlet UIView *viewSampleInformation;
@property (weak, nonatomic) IBOutlet UIScrollView *viewScrollCalculator;
@property (nonatomic, retain) UIImage *numberPadDoneImageNormal;
@property (nonatomic, retain) UIImage *numberPadDoneImageHighlighted;
@property (nonatomic, retain) UIButton *numberPadDoneButton;


- (IBAction)saveInternalFinishesData:(id)sender;
- (IBAction)calculaterSlider:(id)sender;
- (IBAction)editionSlider:(id)sender;
- (IBAction)calculateScore:(id)sender;
- (IBAction)btnDismissKeyboard:(id)sender;
- (IBAction)resetScore:(id)sender;

-(BOOL)isNumeric:(NSString *)strValue;
-(void)retrieveSavedInformation:(id)sender;
-(void)sampleEdit:(id)sender;
-(void)sampleDelete:(id)sender;
@end

@interface UIViewController (NumPadReturn)
@end
