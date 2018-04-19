//
//  ViewCalculator.m
//  Conquas
//
//  Created by Aparna Reddy Challa on 27/08/12.
//  Copyright (c) 2012 MobTwo Pte Ltd. All rights reserved.
//

#import "ViewCalculator.h"

@interface ViewCalculator ()

@end

@implementation ViewCalculator

@synthesize btnReset;
@synthesize btnSave;
@synthesize svSavedInformation;
@synthesize txtWindowADChecks;
@synthesize txtWindowADTicks;
@synthesize txtWindowFunctionalityChecks;
@synthesize txtWindowFunctionalityTicks;
@synthesize txtWindowMDChecks;
@synthesize txtWindowMDTicks;
@synthesize txtWindowAEChecks;
@synthesize txtWindowAETicks;
@synthesize txtWindowJGChecks;
@synthesize txtWindowJGTicks;
@synthesize viewWindow;
@synthesize txtWallJointingChecks;
@synthesize txtWallJointingTicks;
@synthesize txtWallHollownessChecks;
@synthesize txtWallHollownessTicks;
@synthesize txtWallCDChecks;
@synthesize txtWallCDTicks;
@synthesize txtWallAEChecks;
@synthesize txtWallAETicks;
@synthesize txtWallFinishingChecks;
@synthesize txtWallFinishingTicks;
@synthesize viewWall;
@synthesize viewME;
@synthesize txtMEADChecks;
@synthesize txtMEADTicks;
@synthesize txtMEFunctionalityChecks;
@synthesize txtMEFunctionalityTicks;
@synthesize txtMEMDChecks;
@synthesize txtMEMDTicks;
@synthesize txtMEAEChecks;
@synthesize txtMEAETicks;
@synthesize txtMEJGChecks;
@synthesize txtMEJGTicks;
@synthesize txtFloorJointingChecks;
@synthesize txtFloorJointingTicks;
@synthesize txtFloorHollownessChecks;
@synthesize txtFloorHollownessTicks;
@synthesize txtFloorCDChecks;
@synthesize txtFloorCDTicks;
@synthesize txtFloorAEChecks;
@synthesize txtFloorAETicks;
@synthesize txtFloorFinishingChecks;
@synthesize txtFloorFinishingTicks;
@synthesize viewFloor;
@synthesize txtDoorADChecks;
@synthesize txtDoorADTicks;
@synthesize txtDoorFunctionalityChecks;
@synthesize txtDoorFunctionalityTicks;
@synthesize txtDoorMDChecks;
@synthesize txtDoorMDTicks;
@synthesize txtDoorAEChecks;
@synthesize txtDoorAETicks;
@synthesize txtDoorJGChecks;
@synthesize txtDoorJGTicks;
@synthesize viewDoor;
@synthesize viewComponent;
@synthesize txtComponentADChecks;
@synthesize txtComponentADTicks;
@synthesize txtComponentFunctionalityChecks;
@synthesize txtComponentFunctionalityTicks;
@synthesize txtComponentMDChecks;
@synthesize txtComponentMDTicks;
@synthesize txtComponentAEChecks;
@synthesize txtComponentAETicks;
@synthesize txtComponentJGChecks;
@synthesize txtComponentJGTicks;
@synthesize txtCeilingJointingChecks;
@synthesize txtCeilingJointingTicks;
@synthesize txtCeilingRoughnessChecks;
@synthesize txtCeilingRoughnessTicks;
@synthesize txtCeilingCDChecks;
@synthesize txtCeilingCDTicks;
@synthesize txtCeilingAEChecks;
@synthesize txtCeilingAETicks;
@synthesize txtCeilingFinishingChecks;
@synthesize txtCeilingFinishingTicks;
@synthesize viewCelling;
@synthesize lblScore;
@synthesize calculaterSlider;
@synthesize editionNumber;
@synthesize txtLocationName;
@synthesize txtUnitNumber;
@synthesize txtStoreyNumber;
@synthesize txtBlkNumber;
@synthesize lblEditionNumber;
@synthesize viewSampleInformation;
@synthesize viewScrollCalculator;
@synthesize numberPadDoneImageNormal;
@synthesize numberPadDoneImageHighlighted;
@synthesize numberPadDoneButton;
@synthesize elementType;
@synthesize defectType;
@synthesize numTicks;
@synthesize numChecks;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{if ([super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] == nil)
    return nil;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.0) {
        self.numberPadDoneImageNormal = [UIImage imageNamed:@"btnDoneDown.png"];
        self.numberPadDoneImageHighlighted = [UIImage imageNamed:@"btnDoneDown.png"];
    } else {        
        self.numberPadDoneImageNormal = [UIImage imageNamed:@"btnDoneUp.png"];
        self.numberPadDoneImageHighlighted = [UIImage imageNamed:@"btnDoneUp.png"];
    }        
    return self;
}

- (void)viewDidLoad
{    [super viewDidLoad];
    
    [viewScrollCalculator setScrollEnabled:YES];
    [viewScrollCalculator setContentSize:CGSizeMake(320, 900)];
    
    //comment - Prepare The Database & Tables Start.
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"CONQUASDB.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &CONQUASDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *strSQL = "CREATE TABLE IF NOT EXISTS InternalFinishesDetails(ID INTEGER PRIMARY KEY AUTOINCREMENT, blkNumber TEXT, storeyNumber TEXT, unitNumber TEXT, editionNumber TEXT, locationName TEXT, elementType TEXT, defectType TEXT, numTicks INTEGER, numChecks INTEGER)";
            
            if (sqlite3_exec(CONQUASDB, strSQL, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Create Table" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
                [alert show];
            }
            
            strSQL = "CREATE TABLE IF NOT EXISTS InternalFinishesSummaryDetails(ID INTEGER PRIMARY KEY AUTOINCREMENT, blkNumber TEXT, storeyNumber TEXT, unitNumber TEXT, editionNumber TEXT, locationName TEXT, score FLOAT)";
            
            if (sqlite3_exec(CONQUASDB, strSQL, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Create Table" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
                [alert show];
            }
            
            sqlite3_close(CONQUASDB);
            
        } else {
            //comment - fail to open/create database.
        }
    }
    //comment - Prepare The Database & Tables End.
    
}

- (void)viewDidUnload
{
    [self setViewScrollCalculator:nil];
    [self setViewSampleInformation:nil];
    [self setLblEditionNumber:nil];
    [self setTxtBlkNumber:nil];
    [self setTxtStoreyNumber:nil];
    [self setTxtUnitNumber:nil];
   
    [self setTxtLocationName:nil];
    [self setEditionNumber:nil];
    [self setCalculaterSlider:nil];
    [self setLblScore:nil];
    [self setViewCelling:nil];
    [self setViewCelling:nil];
    [self setTxtCeilingFinishingTicks:nil];
    [self setTxtCeilingFinishingChecks:nil];
    [self setTxtCeilingAETicks:nil];
    [self setTxtCeilingAEChecks:nil];
    [self setTxtCeilingCDTicks:nil];
    [self setTxtCeilingCDChecks:nil];
    [self setTxtCeilingRoughnessTicks:nil];
    [self setTxtCeilingRoughnessChecks:nil];
    [self setTxtCeilingJointingTicks:nil];
    [self setTxtCeilingJointingChecks:nil];
    [self setTxtComponentJGTicks:nil];
    [self setTxtComponentJGChecks:nil];
    [self setTxtComponentAETicks:nil];
    [self setTxtComponentAEChecks:nil];
    [self setTxtComponentMDTicks:nil];
    [self setTxtComponentMDChecks:nil];
    [self setTxtComponentFunctionalityTicks:nil];
    [self setTxtComponentADTicks:nil];
    [self setTxtComponentADTicks:nil];
    [self setTxtComponentADChecks:nil];
    [self setViewComponent:nil];
    [self setViewDoor:nil];
    [self setTxtDoorJGTicks:nil];
    [self setTxtDoorJGChecks:nil];
    [self setTxtDoorAETicks:nil];
    [self setTxtDoorAEChecks:nil];
    [self setTxtDoorMDTicks:nil];
    [self setTxtDoorMDChecks:nil];
    [self setTxtDoorFunctionalityTicks:nil];
    [self setTxtDoorFunctionalityChecks:nil];
    [self setTxtDoorADTicks:nil];
    [self setTxtDoorADChecks:nil];
    [self setViewFloor:nil];
    [self setTxtFloorFinishingTicks:nil];
    [self setTxtFloorFinishingChecks:nil];
    [self setTxtFloorAETicks:nil];
    [self setTxtFloorAEChecks:nil];
    [self setTxtFloorCDTicks:nil];
    [self setTxtFloorCDChecks:nil];
    [self setTxtFloorHollownessTicks:nil];
    [self setTxtFloorHollownessChecks:nil];
    [self setTxtFloorJointingTicks:nil];
    [self setTxtFloorJointingChecks:nil];
    [self setTxtMEJGTicks:nil];
    [self setTxtMEJGChecks:nil];
    [self setTxtMEAETicks:nil];
    [self setTxtMEAEChecks:nil];
    [self setTxtMEMDTicks:nil];
    [self setTxtMEMDChecks:nil];
    [self setTxtMEFunctionalityTicks:nil];
    [self setTxtMEFunctionalityChecks:nil];
    [self setTxtMEADTicks:nil];
    [self setTxtMEADChecks:nil];
    [self setViewME:nil];
    [self setViewWall:nil];
    [self setTxtWallFinishingTicks:nil];
    [self setTxtWallFinishingChecks:nil];
    [self setTxtWallAETicks:nil];
    [self setTxtWallAEChecks:nil];
    [self setTxtWallCDTicks:nil];
    [self setTxtWallCDChecks:nil];
    [self setTxtWallHollownessTicks:nil];
    [self setTxtWallHollownessChecks:nil];
    [self setTxtWallJointingTicks:nil];
    [self setTxtWallJointingChecks:nil];
    [self setViewWindow:nil];
    [self setTxtWindowJGTicks:nil];
    [self setTxtWindowJGChecks:nil];
    [self setTxtWindowAETicks:nil];
    [self setTxtWindowAEChecks:nil];
    [self setTxtWindowMDTicks:nil];
    [self setTxtWindowMDChecks:nil];
    [self setTxtWindowFunctionalityTicks:nil];
    [self setTxtWindowFunctionalityChecks:nil];
    [self setTxtWindowADTicks:nil];
    [self setTxtWindowADChecks:nil];
    [self setSvSavedInformation:nil];
    [self setBtnSave:nil];
    [self setBtnReset:nil];
    
    [self setTxtComponentFunctionalityChecks:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated {
    [self retrieveSavedInformation:nil];
}

-(void)retrieveSavedInformation:(id)sender{
    
    NSString *tempID;
    NSString *tempBlkNumber;
    NSString *tempStoreyNumber;
    NSString *tempUnitNumber;
    NSString *tempEditionNumber;
    NSString *tempLocationName;
    NSString *tempScore;
    int countRow = 0;
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Access Database" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    } else {
        const char *charDBPath = [databasePath UTF8String];
        if (sqlite3_open_v2(charDBPath, &CONQUASDB, SQLITE_OPEN_READWRITE, NULL) == SQLITE_OK) {
            //comment - Retrieve Individual Samples Information.
            sqlite3_stmt *statement;
            NSString *selectSQL = @"SELECT ID, blkNumber, storeyNumber, unitNumber, editionNumber, locationName, score FROM InternalFinishesSummaryDetails WHERE NOT locationName=\"-Whole Unit-\" ORDER BY editionNumber, blkNumber, storeyNumber, unitNumber, locationName";
            const char *query_stmt = [selectSQL UTF8String];
            
            if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                while (sqlite3_step(statement) == SQLITE_ROW)
                {
                    tempID = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                    tempBlkNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                    tempStoreyNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                    tempUnitNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                    tempEditionNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                    tempLocationName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                    tempScore = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                    float floatScore = round( [tempScore floatValue] * 100.0 ) / 100.0;
                    
                    UILabel *lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(100, 8 + (37 * countRow) + (8 * countRow), 300, 21)];
                    lblTemp.text = [NSString stringWithFormat: @"Blk %@ Storey %@ Unit %@ %@ (%1.2f)", tempBlkNumber, tempStoreyNumber, tempUnitNumber, tempLocationName, floatScore];
                    lblTemp.adjustsFontSizeToFitWidth = YES;
                    [svSavedInformation addSubview:lblTemp];
                    
                    UIButton *btnTempEdit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                    [btnTempEdit addTarget:self action:@selector(sampleEdit:) forControlEvents:UIControlEventTouchUpInside];
                    [btnTempEdit setTitle:@"Edit" forState:UIControlStateNormal];
                    btnTempEdit.tag = [tempID intValue];
                    btnTempEdit.frame = CGRectMake(380, (37 * countRow) + (8* countRow), 50, 37);
                    [svSavedInformation addSubview:btnTempEdit];
                    
                    UIButton *btnTempDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                    [btnTempDelete addTarget:self action:@selector(sampleDelete:) forControlEvents:UIControlEventTouchUpInside];
                    [btnTempDelete setTitle:@"Delete" forState:UIControlStateNormal];
                    btnTempDelete.tag = [tempID intValue];
                    btnTempDelete.frame = CGRectMake(450, (37 * countRow) + (8 * countRow), 50, 37);
                    [svSavedInformation addSubview:btnTempDelete];
                    
                    countRow = countRow + 1;
                }
            }
            //NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
            sqlite3_finalize(statement);
            
            //comment - Retrieve Entire Unit Information.
            selectSQL = @"SELECT ID, blkNumber, storeyNumber, unitNumber, editionNumber, locationName, score FROM InternalFinishesSummaryDetails WHERE locationName=\"-Whole Unit-\" ORDER BY editionNumber, blkNumber, storeyNumber, unitNumber, locationName";
            query_stmt = [selectSQL UTF8String];
            
            if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                while (sqlite3_step(statement) == SQLITE_ROW)
                {
                    tempID = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                    tempBlkNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                    tempStoreyNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                    tempUnitNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                    tempEditionNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                    tempLocationName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                    tempScore = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                    float floatScore = round( [tempScore floatValue] * 100.0 ) / 100.0;
                    
                    UILabel *lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(100, 8 + (37 * countRow) + (8 * countRow), 300, 21)];
                    lblTemp.text = [NSString stringWithFormat: @"Blk %@ Storey %@ Unit %@ (%1.2f)", tempBlkNumber, tempStoreyNumber, tempUnitNumber, floatScore];
                    lblTemp.adjustsFontSizeToFitWidth = YES;
                    [svSavedInformation addSubview:lblTemp];
                    
                    countRow = countRow + 1;
                }
            }
            //NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
            sqlite3_finalize(statement);
        }
    }

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnDismissKeyboard:(id)sender {
    
    [self.view endEditing:YES];
}
- (IBAction)editionSlider:(id)sender {
    
    int intEditionNumber = (int)editionNumber.value;
    if (intEditionNumber == 6) {
        lblEditionNumber.text = @"6th Edition";
    } else if (intEditionNumber == 7) {
        lblEditionNumber.text = @"7th Edition";
    } else if (intEditionNumber == 8) {
        lblEditionNumber.text = @"8th Edition";
    }
}

- (IBAction)calculateScore:(id)sender {
    
    int intEditionNumber = (int)editionNumber.value;
    float ceilingAEWeightage = 0; float ceilingCDWeightage = 0; float ceilingFinishingWeightage = 0; float ceilingJointingWeightage = 0; float ceilingRoughnessWeightage = 0;
    float componentADWeightage = 0; float componentAEWeightage = 0; float componentFunctionalityWeightage = 0; float componentJPWeightage = 0; float componentMDWeightage = 0;
    float doorADWeightage = 0; float doorAEWeightage = 0; float doorFunctionalityWeightage = 0; float doorJPWeightage = 0; float doorMDWeightage = 0;
    float floorAEWeightage = 0; float floorCDWeightage = 0; float floorFinishingWeightage = 0; float floorHollownessWeightage = 0; float floorJointingWeightage = 0;
    float MEADWeightage = 0; float MEAEWeightage = 0; float MEFunctionalityWeightage = 0; float MEJPWeightage = 0; float MEMDWeightage = 0;
    float wallAEWeightage = 0; float wallCDWeightage = 0; float wallFinishingWeightage = 0; float wallHollownessWeightage = 0; float wallJointingWeightage = 0;
    float windowADWeightage = 0; float windowAEWeightage = 0; float windowFunctionalityWeightage = 0; float windowJGWeightage = 0; float windowMDWeightage = 0;
    float ceilingAEScore = 0; float ceilingCDScore = 0; float ceilingFinishingScore = 0; float ceilingJointingScore = 0; float ceilingRoughnessScore = 0;
    float componentADScore = 0; float componentAEScore = 0; float componentFunctionalityScore = 0; float componentJPScore = 0; float componentMDScore = 0;
    float doorADScore = 0; float doorAEScore = 0; float doorFunctionalityScore = 0; float doorJPScore = 0; float doorMDScore = 0;
    float floorAEScore = 0; float floorCDScore = 0; float floorFinishingScore = 0; float floorHollownessScore = 0; float floorJointingScore = 0;
    float MEADScore = 0; float MEAEScore = 0; float MEFunctionalityScore = 0; float MEJPScore = 0; float MEMDScore = 0;
    float wallAEScore = 0; float wallCDScore = 0; float wallFinishingScore = 0; float wallHollownessScore = 0; float wallJointingScore = 0;
    float windowADScore = 0; float windowAEScore = 0; float windowFunctionalityScore = 0; float windowJGScore = 0; float windowMDScore = 0;
    if (intEditionNumber == 6) {
        float ceilingWeightage = 0;
        float componentWeightage = 0;
        float doorWeightage = 0;
        float floorWeightage = 0;
        float MEWeightage = 0;
        float wallWeightage = 0;
        float windowWeightage = 0;
        float ceilingScore = 0;
        float componentScore = 0;
        float doorScore = 0;
        float floorScore = 0;
        float MEScore = 0;
        float wallScore = 0;
        float windowScore = 0;
        float ceilingTotalTicks = 0; float ceilingTotalChecks = 0;
        float componentTotalTicks = 0; float componentTotalChecks = 0;
        float doorTotalTicks = 0; float doorTotalChecks = 0;
        float floorTotalTicks = 0; float floorTotalChecks = 0;
        float METotalTicks = 0; float METotalChecks = 0;
        float wallTotalTicks = 0; float wallTotalChecks = 0;
        float windowTotalTicks = 0; float windowTotalChecks = 0;
        
        ceilingTotalTicks = [txtCeilingAETicks.text floatValue] + [txtCeilingCDTicks.text floatValue] + [txtCeilingFinishingTicks.text floatValue] + [txtCeilingJointingTicks.text floatValue] + [txtCeilingRoughnessTicks.text floatValue];
        ceilingTotalChecks = [txtCeilingAEChecks.text floatValue] + [txtCeilingCDChecks.text floatValue] + [txtCeilingFinishingChecks.text floatValue] + [txtCeilingJointingChecks.text floatValue] + [txtCeilingRoughnessChecks.text floatValue];
        componentTotalTicks = [txtComponentADTicks.text floatValue] + [txtComponentAETicks.text floatValue] + [txtComponentFunctionalityTicks.text floatValue] + [txtComponentJGTicks.text floatValue] + [txtComponentMDTicks.text floatValue];
        componentTotalChecks = [txtComponentADChecks.text floatValue] + [txtComponentAEChecks.text floatValue] + [txtComponentFunctionalityChecks.text floatValue] + [txtComponentJGChecks.text floatValue] + [txtComponentMDChecks.text floatValue];
        doorTotalTicks = [txtDoorADTicks.text floatValue] + [txtDoorAETicks.text floatValue] + [txtDoorFunctionalityTicks.text floatValue] + [txtDoorJGTicks.text floatValue] + [txtDoorMDTicks.text floatValue];
        doorTotalChecks = [txtDoorADChecks.text floatValue] + [txtDoorAEChecks.text floatValue] + [txtDoorFunctionalityChecks.text floatValue] + [txtDoorJGChecks.text floatValue] + [txtDoorMDChecks.text floatValue];
        floorTotalTicks = [txtFloorAETicks.text floatValue] + [txtFloorCDTicks.text floatValue] + [txtFloorFinishingTicks.text floatValue] + [txtFloorHollownessTicks.text floatValue] + [txtFloorJointingTicks.text floatValue];
        floorTotalChecks = [txtFloorAEChecks.text floatValue] + [txtFloorCDChecks.text floatValue] + [txtFloorFinishingChecks.text floatValue] + [txtFloorHollownessChecks.text floatValue] + [txtFloorJointingChecks.text floatValue];
        METotalTicks = [txtMEADTicks.text floatValue] + [txtMEAETicks.text floatValue] + [txtMEFunctionalityTicks.text floatValue] + [txtMEJGTicks.text floatValue] + [txtMEMDTicks.text floatValue];
        METotalChecks = [txtMEADChecks.text floatValue] + [txtMEAEChecks.text floatValue] + [txtMEFunctionalityChecks.text floatValue] + [txtMEJGChecks.text floatValue] + [txtMEMDChecks.text floatValue];
        wallTotalTicks = [txtWallAETicks.text floatValue] + [txtWallCDTicks.text floatValue] + [txtWallFinishingTicks.text floatValue] + [txtWallHollownessTicks.text floatValue] + [txtWallJointingTicks.text floatValue];
        wallTotalChecks = [txtWallAEChecks.text floatValue] + [txtWallCDChecks.text floatValue] + [txtWallFinishingChecks.text floatValue] + [txtWallHollownessChecks.text floatValue] + [txtWallJointingChecks.text floatValue];
        windowTotalTicks = [txtWindowADTicks.text floatValue] + [txtWindowAETicks.text floatValue] + [txtWindowFunctionalityTicks.text floatValue] + [txtWindowJGTicks.text floatValue] + [txtWindowMDTicks.text floatValue];
        windowTotalChecks = [txtWindowADChecks.text floatValue] + [txtWindowAEChecks.text floatValue] + [txtWindowFunctionalityChecks.text floatValue] + [txtWindowJGChecks.text floatValue] + [txtWindowMDChecks.text floatValue];
        if (ceilingTotalChecks != 0) {
            ceilingWeightage = 6;
            ceilingScore = (ceilingTotalTicks/ceilingTotalChecks) * ceilingWeightage;
            ceilingScore = round( ceilingScore * 100.0 ) / 100.0;
        }
        if (componentTotalChecks != 0) {
            componentWeightage = 22;
            componentScore = (componentTotalTicks/componentTotalChecks) * componentWeightage;
            componentScore = round( componentScore * 100.0 ) / 100.0;
        }
        if (doorTotalChecks != 0) {
            doorWeightage = 20;
            doorScore = (doorTotalTicks/doorTotalChecks) * doorWeightage;
            doorScore = round( doorScore * 100.0 ) / 100.0;
        }
        if (floorTotalChecks != 0) {
            floorWeightage = 22;
            floorScore = (floorTotalTicks/floorTotalChecks) * floorWeightage;
            floorScore = round( floorScore * 100.0 ) / 100.0;
        }
        if (METotalChecks != 0) {
            MEWeightage = 10;
            MEScore = (METotalTicks/METotalChecks) * MEWeightage;
            MEScore = round( MEScore * 100.0 ) / 100.0;
        }
        if (wallTotalChecks != 0) {
            wallWeightage = 10;
            wallScore = (wallTotalTicks/wallTotalChecks) * wallWeightage;
            wallScore = round( wallScore * 100.0 ) / 100.0;
        }
        if (windowTotalChecks != 0) {
            windowWeightage = 10;
            windowScore = (windowTotalTicks/windowTotalChecks) * windowWeightage;
            windowScore = round( windowScore * 100.0 ) / 100.0;
        }

        float sampleScore = 0;
        if ((ceilingWeightage+componentWeightage+doorWeightage+floorWeightage+MEWeightage+wallWeightage+windowWeightage) != 0) {
            sampleScore = ((ceilingScore+componentScore+doorScore+floorScore+MEScore+wallScore+windowScore) / (ceilingWeightage+componentWeightage+doorWeightage+floorWeightage+MEWeightage+wallWeightage+windowWeightage)) * 100;
            sampleScore = round( sampleScore * 100.0 ) / 100.0;
            NSLog(@"sample scorw 6:%1.2f",sampleScore);
        }
        lblScore.text = [NSString stringWithFormat:@"%1.2f", sampleScore];
    } else if (intEditionNumber == 7) {
        if (!([txtCeilingAEChecks.text isEqualToString:@""] || [txtCeilingAEChecks.text isEqualToString:@"0"] || [txtCeilingAETicks.text isEqualToString:@""])) {
            ceilingAEWeightage = 0.9;
            ceilingAEScore = ([txtCeilingAETicks.text floatValue] / [txtCeilingAEChecks.text floatValue]) * ceilingAEWeightage;
            NSLog(@"ceilingAEScore=%f",ceilingAEScore);
            NSLog(@"ceilingAEWeightage=%f",ceilingAEWeightage);

        }
        if (!([txtCeilingCDChecks.text isEqualToString:@""] || [txtCeilingCDChecks.text isEqualToString:@"0"] || [txtCeilingCDTicks.text isEqualToString:@""])) {
            ceilingCDWeightage = 1.8;
            ceilingCDScore = ([txtCeilingCDTicks.text floatValue] / [txtCeilingCDChecks.text floatValue]) * ceilingCDWeightage;
            NSLog(@"ceilingCDWeightage=%f",ceilingCDWeightage);
            NSLog(@"ceilingCDScore=%f",ceilingCDScore);
        }
        if (!([txtCeilingFinishingChecks.text isEqualToString:@""] || [txtCeilingFinishingChecks.text isEqualToString:@"0"] || [txtCeilingFinishingTicks.text isEqualToString:@""])) {
            ceilingFinishingWeightage = 0.9;
            ceilingFinishingScore = ([txtCeilingFinishingTicks.text floatValue] / [txtCeilingFinishingChecks.text floatValue]) * ceilingFinishingWeightage;
            NSLog(@"ceilingFinishingWeightage=%f",ceilingFinishingWeightage);
            NSLog(@"ceilingFinishingScore=%f",ceilingFinishingScore);
        }
        if (!([txtCeilingJointingChecks.text isEqualToString:@""] || [txtCeilingJointingChecks.text isEqualToString:@"0"] || [txtCeilingJointingTicks.text isEqualToString:@""])) {
            ceilingJointingWeightage = 0.9;
            ceilingJointingScore = ([txtCeilingJointingTicks.text floatValue] / [txtCeilingJointingChecks.text floatValue]) * ceilingJointingWeightage;
        }
        if (!([txtCeilingRoughnessChecks.text isEqualToString:@""] || [txtCeilingRoughnessChecks.text isEqualToString:@"0"] || [txtCeilingRoughnessTicks.text isEqualToString:@""])) {
            ceilingRoughnessWeightage = 1.5;
            ceilingRoughnessScore = ([txtCeilingRoughnessTicks.text floatValue] / [txtCeilingRoughnessChecks.text floatValue]) * ceilingRoughnessWeightage;
        }
        if (!([txtComponentADChecks.text isEqualToString:@""] || [txtComponentADChecks.text isEqualToString:@"0"] || [txtComponentADTicks.text isEqualToString:@""])) {
            componentADWeightage = 4.4;
            componentADScore = ([txtComponentADTicks.text floatValue] / [txtComponentADChecks.text floatValue]) * componentADWeightage;
        }
        if (!([txtComponentAEChecks.text isEqualToString:@""] || [txtComponentAEChecks.text isEqualToString:@"0"] || [txtComponentAETicks.text isEqualToString:@""])) {
            componentAEWeightage = 2.2;
            componentAEScore = ([txtComponentAETicks.text floatValue] / [txtComponentAEChecks.text floatValue]) * componentAEWeightage;
        }
        if (!([txtComponentFunctionalityChecks.text isEqualToString:@""] || [txtComponentFunctionalityChecks.text isEqualToString:@"0"] || [txtComponentFunctionalityTicks.text isEqualToString:@""])) {
            componentFunctionalityWeightage = 6.6;
            componentFunctionalityScore = ([txtComponentFunctionalityTicks.text floatValue] / [txtComponentFunctionalityChecks.text floatValue]) * componentFunctionalityWeightage;
        }
        if (!([txtComponentJGChecks.text isEqualToString:@""] || [txtComponentJGChecks.text isEqualToString:@"0"] || [txtComponentJGTicks.text isEqualToString:@""])) {
            componentJPWeightage = 2.2;
            componentJPScore = ([txtComponentJGTicks.text floatValue] / [txtComponentJGChecks.text floatValue]) * componentJPWeightage;
        }
        if (!([txtComponentMDChecks.text isEqualToString:@""] || [txtComponentMDChecks.text isEqualToString:@"0"] || [txtComponentMDTicks.text isEqualToString:@""])) {
            componentMDWeightage = 6.6;
            componentMDScore = ([txtComponentMDTicks.text floatValue] / [txtComponentMDChecks.text floatValue]) * componentMDWeightage;
        }
        if (!([txtDoorADChecks.text isEqualToString:@""] || [txtDoorADChecks.text isEqualToString:@"0"] || [txtDoorADTicks.text isEqualToString:@""])) {
            doorADWeightage = 4;
            doorADScore = ([txtDoorADTicks.text floatValue] / [txtDoorADChecks.text floatValue]) * doorADWeightage;
        }
        if (!([txtDoorAEChecks.text isEqualToString:@""] || [txtDoorAEChecks.text isEqualToString:@"0"] || [txtDoorAETicks.text isEqualToString:@""])) {
            doorAEWeightage = 2;
            doorAEScore = ([txtDoorAETicks.text floatValue] / [txtDoorAEChecks.text floatValue]) * doorAEWeightage;
        }
        if (!([txtDoorFunctionalityChecks.text isEqualToString:@""] || [txtDoorFunctionalityChecks.text isEqualToString:@"0"] || [txtDoorFunctionalityTicks.text isEqualToString:@""])) {
            doorFunctionalityWeightage = 6;
            doorFunctionalityScore = ([txtDoorFunctionalityTicks.text floatValue] / [txtDoorFunctionalityChecks.text floatValue]) * doorFunctionalityWeightage;
        }
        if (!([txtDoorJGChecks.text isEqualToString:@""] || [txtDoorJGChecks.text isEqualToString:@"0"] || [txtDoorJGTicks.text isEqualToString:@""])) {
            doorJPWeightage = 2;
            doorJPScore = ([txtDoorJGTicks.text floatValue] / [txtDoorJGChecks.text floatValue]) * doorJPWeightage;
        }
        if (!([txtDoorMDChecks.text isEqualToString:@""] || [txtDoorMDChecks.text isEqualToString:@"0"] || [txtDoorMDTicks.text isEqualToString:@""])) {
            doorMDWeightage = 6;
            doorMDScore = ([txtDoorMDTicks.text floatValue] / [txtDoorMDChecks.text floatValue]) * doorMDWeightage;
        }
        if (!([txtFloorAEChecks.text isEqualToString:@""] || [txtFloorAEChecks.text isEqualToString:@"0"] || [txtFloorAETicks.text isEqualToString:@""])) {
            floorAEWeightage = 3.3;
            floorAEScore = ([txtFloorAETicks.text floatValue] / [txtFloorAEChecks.text floatValue]) * floorAEWeightage;
        }
        if (!([txtFloorCDChecks.text isEqualToString:@""] || [txtFloorCDChecks.text isEqualToString:@"0"] || [txtFloorCDTicks.text isEqualToString:@""])) {
            floorCDWeightage = 6.6;
            floorCDScore = ([txtFloorCDTicks.text floatValue] / [txtFloorCDChecks.text floatValue]) * floorCDWeightage;
        }
        if (!([txtFloorFinishingChecks.text isEqualToString:@""] || [txtFloorFinishingChecks.text isEqualToString:@"0"] || [txtFloorFinishingTicks.text isEqualToString:@""])) {
            floorFinishingWeightage = 6.6;
            floorFinishingScore = ([txtFloorFinishingTicks.text floatValue] / [txtFloorFinishingChecks.text floatValue]) * floorFinishingWeightage;
        }
        if (!([txtFloorHollownessChecks.text isEqualToString:@""] || [txtFloorHollownessChecks.text isEqualToString:@"0"] || [txtFloorHollownessTicks.text isEqualToString:@""])) {
            floorHollownessWeightage = 2.2;
            floorHollownessScore = ([txtFloorHollownessTicks.text floatValue] / [txtFloorHollownessChecks.text floatValue]) * floorHollownessWeightage;
        }
        if (!([txtFloorJointingChecks.text isEqualToString:@""] || [txtFloorJointingChecks.text isEqualToString:@"0"] || [txtFloorJointingTicks.text isEqualToString:@""])) {
            floorJointingWeightage = 3.3;
            floorJointingScore = ([txtFloorJointingTicks.text floatValue] / [txtFloorJointingChecks.text floatValue]) * floorJointingWeightage;
        }
        if (!([txtMEADChecks.text isEqualToString:@""] || [txtMEADChecks.text isEqualToString:@"0"] || [txtMEADTicks.text isEqualToString:@""])) {
            MEADWeightage = 1;
            MEADScore = ([txtMEADTicks.text floatValue] / [txtMEADChecks.text floatValue]) * MEADWeightage;
        }
        if (!([txtMEAEChecks.text isEqualToString:@""] || [txtMEAEChecks.text isEqualToString:@"0"] || [txtMEAETicks.text isEqualToString:@""])) {
            MEAEWeightage = 2;
            MEAEScore = ([txtMEAETicks.text floatValue] / [txtMEAEChecks.text floatValue]) * MEAEWeightage;
        }
        if (!([txtMEFunctionalityChecks.text isEqualToString:@""] || [txtMEFunctionalityChecks.text isEqualToString:@"0"] || [txtMEFunctionalityTicks.text isEqualToString:@""])) {
            MEFunctionalityWeightage = 3;
            MEFunctionalityScore = ([txtMEFunctionalityTicks.text floatValue] / [txtMEFunctionalityChecks.text floatValue]) * MEFunctionalityWeightage;
        }
        if (!([txtMEJGChecks.text isEqualToString:@""] || [txtMEJGChecks.text isEqualToString:@"0"] || [txtMEJGTicks.text isEqualToString:@""])) {
            MEJPWeightage = 1;
            MEJPScore = ([txtMEJGTicks.text floatValue] / [txtMEJGChecks.text floatValue]) * MEJPWeightage;
        }
        if (!([txtMEMDChecks.text isEqualToString:@""] || [txtMEMDChecks.text isEqualToString:@"0"] || [txtMEMDTicks.text isEqualToString:@""])) {
            MEMDWeightage = 3;
            MEMDScore = ([txtMEMDTicks.text floatValue] / [txtMEMDChecks.text floatValue]) * MEMDWeightage;
        }
        if (!([txtWallAEChecks.text isEqualToString:@""] || [txtWallAEChecks.text isEqualToString:@"0"] || [txtWallAETicks.text isEqualToString:@""])) {
            wallAEWeightage = 1.5;
            wallAEScore = ([txtWallAETicks.text floatValue] / [txtWallAEChecks.text floatValue]) * wallAEWeightage;
                    }
        if (!([txtWallCDChecks.text isEqualToString:@""] || [txtWallCDChecks.text isEqualToString:@"0"] || [txtWallCDTicks.text isEqualToString:@""])) {
            wallCDWeightage = 3;
            wallCDScore = ([txtWallCDTicks.text floatValue] / [txtWallCDChecks.text floatValue]) * wallCDWeightage;
        }
        if (!([txtWallFinishingChecks.text isEqualToString:@""] || [txtWallFinishingChecks.text isEqualToString:@"0"] || [txtWallFinishingTicks.text isEqualToString:@""])) {
            wallFinishingWeightage = 2.5;
            wallFinishingScore = ([txtWallFinishingTicks.text floatValue] / [txtWallFinishingChecks.text floatValue]) * wallFinishingWeightage;
        }
        if (!([txtWallHollownessChecks.text isEqualToString:@""] || [txtWallHollownessChecks.text isEqualToString:@"0"] || [txtWallHollownessTicks.text isEqualToString:@""])) {
            wallHollownessWeightage = 1.5;
            wallHollownessScore = ([txtWallHollownessTicks.text floatValue] / [txtWallHollownessChecks.text floatValue]) * wallHollownessWeightage;
        }
        if (!([txtWallJointingChecks.text isEqualToString:@""] || [txtWallJointingChecks.text isEqualToString:@"0"] || [txtWallJointingTicks.text isEqualToString:@""])) {
            wallJointingWeightage = 1.5;
            wallJointingScore = ([txtWallJointingTicks.text floatValue] / [txtWallJointingChecks.text floatValue]) * wallJointingWeightage;
        }
        if (!([txtWindowADChecks.text isEqualToString:@""] || [txtWindowADChecks.text isEqualToString:@"0"] || [txtWindowADTicks.text isEqualToString:@""])) {
            windowADWeightage = 3;
            windowADScore = ([txtWindowADTicks.text floatValue] / [txtWindowADChecks.text floatValue]) * windowADWeightage;
        }
        if (!([txtWindowAEChecks.text isEqualToString:@""] || [txtWindowAEChecks.text isEqualToString:@"0"] || [txtWindowAETicks.text isEqualToString:@""])) {
            windowAEWeightage = 1;
            windowAEScore = ([txtWindowAETicks.text floatValue] / [txtWindowAEChecks.text floatValue]) * windowAEWeightage;
        }
        if (!([txtWindowFunctionalityChecks.text isEqualToString:@""] || [txtWindowFunctionalityChecks.text isEqualToString:@"0"] || [txtWindowFunctionalityTicks.text isEqualToString:@""])) {
            windowFunctionalityWeightage = 3;
            windowFunctionalityScore = ([txtWindowFunctionalityTicks.text floatValue] / [txtWindowFunctionalityChecks.text floatValue]) * windowFunctionalityWeightage;
        }
        if (!([txtWindowJGChecks.text isEqualToString:@""] || [txtWindowJGChecks.text isEqualToString:@"0"] || [txtWindowJGTicks.text isEqualToString:@""])) {
            windowJGWeightage = 1;
            windowJGScore = ([txtWindowJGTicks.text floatValue] / [txtWindowJGChecks.text floatValue]) * windowJGWeightage;
        }
        if (!([txtWindowMDChecks.text isEqualToString:@""] || [txtWindowMDChecks.text isEqualToString:@"0"] || [txtWindowMDTicks.text isEqualToString:@""])) {
            windowMDWeightage = 2;
            windowMDScore = ([txtWindowMDTicks.text floatValue] / [txtWindowMDChecks.text floatValue]) * windowMDWeightage;
        }
        float ceilingWeightage = 0;
        float componentWeightage = 0;
        float doorWeightage = 0;
        float floorWeightage = 0;
        float MEWeightage = 0;
        float wallWeightage = 0;
        float windowWeightage = 0;
        float ceilingScore = 0;
        float componentScore = 0;
        float doorScore = 0;
        float floorScore = 0;
        float MEScore = 0;
        float wallScore = 0;
        float windowScore = 0;
        if ((ceilingAEWeightage+ceilingCDWeightage+ceilingFinishingWeightage+ceilingJointingWeightage+ceilingRoughnessWeightage) != 0) {
            ceilingWeightage = 6;
            ceilingScore = ((ceilingAEScore+ceilingCDScore+ceilingFinishingScore+ceilingJointingScore+ceilingRoughnessScore) / (ceilingAEWeightage+ceilingCDWeightage+ceilingFinishingWeightage+ceilingJointingWeightage+ceilingRoughnessWeightage)) * ceilingWeightage;
            ceilingScore = round( ceilingScore * 100.0 ) / 100.0;
        }
        if ((componentADWeightage+componentAEWeightage+componentFunctionalityWeightage+componentJPWeightage+componentMDWeightage) != 0) {
            componentWeightage = 22;
            componentScore = ((componentADScore+componentAEScore+componentFunctionalityScore+componentJPScore+componentMDScore) / (componentADWeightage+componentAEWeightage+componentFunctionalityWeightage+componentJPWeightage+componentMDWeightage)) * componentWeightage;
            componentScore = round( componentScore * 100.0 ) / 100.0;
        }
        if ((doorADWeightage+doorAEWeightage+doorFunctionalityWeightage+doorJPWeightage+doorMDWeightage) != 0) {
            doorWeightage = 20;
            doorScore = ((doorADScore+doorAEScore+doorFunctionalityScore+doorJPScore+doorMDScore) / (doorADWeightage+doorAEWeightage+doorFunctionalityWeightage+doorJPWeightage+doorMDWeightage)) * doorWeightage;
            doorScore = round( doorScore * 100.0 ) / 100.0;
        }
        if ((floorAEWeightage+floorCDWeightage+floorFinishingWeightage+floorHollownessWeightage+floorJointingWeightage) != 0) {
            floorWeightage = 22;
            floorScore = ((floorAEScore+floorCDScore+floorFinishingScore+floorHollownessScore+floorJointingScore) / (floorAEWeightage+floorCDWeightage+floorFinishingWeightage+floorHollownessWeightage+floorJointingWeightage)) * floorWeightage;
            floorScore = round( floorScore * 100.0 ) / 100.0;
        }
        if ((MEADWeightage+MEAEWeightage+MEFunctionalityWeightage+MEJPWeightage+MEMDWeightage) != 0) {
            MEWeightage = 10;
            MEScore = ((MEADScore+MEAEScore+MEFunctionalityScore+MEJPScore+MEMDScore) / (MEADWeightage+MEAEWeightage+MEFunctionalityWeightage+MEJPWeightage+MEMDWeightage)) * MEWeightage;
            MEScore = round( MEScore * 100.0 ) / 100.0;
        }
        if ((wallAEWeightage+wallCDWeightage+wallFinishingWeightage+wallHollownessWeightage+wallJointingWeightage) != 0) {
            wallWeightage = 10;
            wallScore = ((wallAEScore+wallCDScore+wallFinishingScore+wallHollownessScore+wallJointingScore) / (wallAEWeightage+wallCDWeightage+wallFinishingWeightage+wallHollownessWeightage+wallJointingWeightage)) * wallWeightage;
            wallScore = round( wallScore * 100.0 ) / 100.0;
        }
        if ((windowADWeightage+windowAEWeightage+windowFunctionalityWeightage+windowJGWeightage+windowMDWeightage) != 0) {
            windowWeightage = 10;
            windowScore = ((windowADScore+windowAEScore+windowFunctionalityScore+windowJGScore+windowMDScore) / (windowADWeightage+windowAEWeightage+windowFunctionalityWeightage+windowJGWeightage+windowMDWeightage)) * windowWeightage;
            windowScore = round( windowScore * 100.0 ) / 100.0;
        }
        
        float sampleScore = 0;
        if ((ceilingWeightage+componentWeightage+doorWeightage+floorWeightage+MEWeightage+wallWeightage+windowWeightage) != 0) {
            sampleScore = ((ceilingScore+componentScore+doorScore+floorScore+MEScore+wallScore+windowScore) / (ceilingWeightage+componentWeightage+doorWeightage+floorWeightage+MEWeightage+wallWeightage+windowWeightage)) * 100;
            sampleScore = round( sampleScore * 100.0 ) / 100.0;
        }
        
        NSLog(@"ceiling score=%f",ceilingScore);
        NSLog(@"component score=%f",componentScore);
        NSLog(@"door score=%f",doorScore);
        NSLog(@"floor score=%f",floorScore);
        NSLog(@"ME score=%f",MEScore);
        NSLog(@"wall score=%f",wallScore);
        NSLog(@"windows score=%f",windowScore);
        NSLog(@"total score=%f",(ceilingScore+componentScore+doorScore+floorScore+MEScore+wallScore+windowScore));
        NSLog(@"total weightage=%f",(ceilingWeightage+componentWeightage+doorWeightage+floorWeightage+MEWeightage+wallWeightage+windowWeightage));
        
        lblScore.text = [NSString stringWithFormat:@"%1.2f", sampleScore];
    } else if (intEditionNumber == 8) {
        if (!([txtCeilingAEChecks.text isEqualToString:@""] || [txtCeilingAEChecks.text isEqualToString:@"0"] || [txtCeilingAETicks.text isEqualToString:@""])) {
            ceilingAEWeightage = 0.9;
            ceilingAEScore = ([txtCeilingAETicks.text floatValue] / [txtCeilingAEChecks.text floatValue]) * ceilingAEWeightage;
        }
        if (!([txtCeilingCDChecks.text isEqualToString:@""] || [txtCeilingCDChecks.text isEqualToString:@"0"] || [txtCeilingCDTicks.text isEqualToString:@""])) {
            ceilingCDWeightage = 1.8;
            ceilingCDScore = ([txtCeilingCDTicks.text floatValue] / [txtCeilingCDChecks.text floatValue]) * ceilingCDWeightage;
        }
        if (!([txtCeilingFinishingChecks.text isEqualToString:@""] || [txtCeilingFinishingChecks.text isEqualToString:@"0"] || [txtCeilingFinishingTicks.text isEqualToString:@""])) {
            ceilingFinishingWeightage = 0.9;
            ceilingFinishingScore = ([txtCeilingFinishingTicks.text floatValue] / [txtCeilingFinishingChecks.text floatValue]) * ceilingFinishingWeightage;
        }
        if (!([txtCeilingJointingChecks.text isEqualToString:@""] || [txtCeilingJointingChecks.text isEqualToString:@"0"] || [txtCeilingJointingTicks.text isEqualToString:@""])) {
            ceilingJointingWeightage = 0.9;
            ceilingJointingScore = ([txtCeilingJointingTicks.text floatValue] / [txtCeilingJointingChecks.text floatValue]) * ceilingJointingWeightage;
        }
        if (!([txtCeilingRoughnessChecks.text isEqualToString:@""] || [txtCeilingRoughnessChecks.text isEqualToString:@"0"] || [txtCeilingRoughnessTicks.text isEqualToString:@""])) {
            ceilingRoughnessWeightage = 1.5;
            ceilingRoughnessScore = ([txtCeilingRoughnessTicks.text floatValue] / [txtCeilingRoughnessChecks.text floatValue]) * ceilingRoughnessWeightage;
        }
        if (!([txtComponentADChecks.text isEqualToString:@""] || [txtComponentADChecks.text isEqualToString:@"0"] || [txtComponentADTicks.text isEqualToString:@""])) {
            componentADWeightage = 1.2;
            componentADScore = ([txtComponentADTicks.text floatValue] / [txtComponentADChecks.text floatValue]) * componentADWeightage;
        }
        if (!([txtComponentAEChecks.text isEqualToString:@""] || [txtComponentAEChecks.text isEqualToString:@"0"] || [txtComponentAETicks.text isEqualToString:@""])) {
            componentAEWeightage = 0.6;
            componentAEScore = ([txtComponentAETicks.text floatValue] / [txtComponentAEChecks.text floatValue]) * componentAEWeightage;
        }
        if (!([txtComponentFunctionalityChecks.text isEqualToString:@""] || [txtComponentFunctionalityChecks.text isEqualToString:@"0"] || [txtComponentFunctionalityTicks.text isEqualToString:@""])) {
            componentFunctionalityWeightage = 1.8;
            componentFunctionalityScore = ([txtComponentFunctionalityTicks.text floatValue] / [txtComponentFunctionalityChecks.text floatValue]) * componentFunctionalityWeightage;
        }
        if (!([txtComponentJGChecks.text isEqualToString:@""] || [txtComponentJGChecks.text isEqualToString:@"0"] || [txtComponentJGTicks.text isEqualToString:@""])) {
            componentJPWeightage = 0.6;
            componentJPScore = ([txtComponentJGTicks.text floatValue] / [txtComponentJGChecks.text floatValue]) * componentJPWeightage;
        }
        if (!([txtComponentMDChecks.text isEqualToString:@""] || [txtComponentMDChecks.text isEqualToString:@"0"] || [txtComponentMDTicks.text isEqualToString:@""])) {
            componentMDWeightage = 1.8;
            componentMDScore = ([txtComponentMDTicks.text floatValue] / [txtComponentMDChecks.text floatValue]) * componentMDWeightage;
        }
        if (!([txtDoorADChecks.text isEqualToString:@""] || [txtDoorADChecks.text isEqualToString:@"0"] || [txtDoorADTicks.text isEqualToString:@""])) {
            doorADWeightage = 1.2;
            doorADScore = ([txtDoorADTicks.text floatValue] / [txtDoorADChecks.text floatValue]) * doorADWeightage;
        }
        if (!([txtDoorAEChecks.text isEqualToString:@""] || [txtDoorAEChecks.text isEqualToString:@"0"] || [txtDoorAETicks.text isEqualToString:@""])) {
            doorAEWeightage = 0.6;
            doorAEScore = ([txtDoorAETicks.text floatValue] / [txtDoorAEChecks.text floatValue]) * doorAEWeightage;
        }
        if (!([txtDoorFunctionalityChecks.text isEqualToString:@""] || [txtDoorFunctionalityChecks.text isEqualToString:@"0"] || [txtDoorFunctionalityTicks.text isEqualToString:@""])) {
            doorFunctionalityWeightage = 1.8;
            doorFunctionalityScore = ([txtDoorFunctionalityTicks.text floatValue] / [txtDoorFunctionalityChecks.text floatValue]) * doorFunctionalityWeightage;
        }
        if (!([txtDoorJGChecks.text isEqualToString:@""] || [txtDoorJGChecks.text isEqualToString:@"0"] || [txtDoorJGTicks.text isEqualToString:@""])) {
            doorJPWeightage = 0.6;
            doorJPScore = ([txtDoorJGTicks.text floatValue] / [txtDoorJGChecks.text floatValue]) * doorJPWeightage;
        }
        if (!([txtDoorMDChecks.text isEqualToString:@""] || [txtDoorMDChecks.text isEqualToString:@"0"] || [txtDoorMDTicks.text isEqualToString:@""])) {
            doorMDWeightage = 1.8;
            doorMDScore = ([txtDoorMDTicks.text floatValue] / [txtDoorMDChecks.text floatValue]) * doorMDWeightage;
        }
        if (!([txtFloorAEChecks.text isEqualToString:@""] || [txtFloorAEChecks.text isEqualToString:@"0"] || [txtFloorAETicks.text isEqualToString:@""])) {
            floorAEWeightage = 2.8;
            floorAEScore = ([txtFloorAETicks.text floatValue] / [txtFloorAEChecks.text floatValue]) * floorAEWeightage;
        }
        if (!([txtFloorCDChecks.text isEqualToString:@""] || [txtFloorCDChecks.text isEqualToString:@"0"] || [txtFloorCDTicks.text isEqualToString:@""])) {
            floorCDWeightage = 4.8;
            floorCDScore = ([txtFloorCDTicks.text floatValue] / [txtFloorCDChecks.text floatValue]) * floorCDWeightage;
        }
        if (!([txtFloorFinishingChecks.text isEqualToString:@""] || [txtFloorFinishingChecks.text isEqualToString:@"0"] || [txtFloorFinishingTicks.text isEqualToString:@""])) {
            floorFinishingWeightage = 4.8;
            floorFinishingScore = ([txtFloorFinishingTicks.text floatValue] / [txtFloorFinishingChecks.text floatValue]) * floorFinishingWeightage;
        }
        if (!([txtFloorHollownessChecks.text isEqualToString:@""] || [txtFloorHollownessChecks.text isEqualToString:@"0"] || [txtFloorHollownessTicks.text isEqualToString:@""])) {
            floorHollownessWeightage = 1.6;
            floorHollownessScore = ([txtFloorHollownessTicks.text floatValue] / [txtFloorHollownessChecks.text floatValue]) * floorHollownessWeightage;
        }
        if (!([txtFloorJointingChecks.text isEqualToString:@""] || [txtFloorJointingChecks.text isEqualToString:@"0"] || [txtFloorJointingTicks.text isEqualToString:@""])) {
            floorJointingWeightage = 2;
            floorJointingScore = ([txtFloorJointingTicks.text floatValue] / [txtFloorJointingChecks.text floatValue]) * floorJointingWeightage;
        }
        if (!([txtMEADChecks.text isEqualToString:@""] || [txtMEADChecks.text isEqualToString:@"0"] || [txtMEADTicks.text isEqualToString:@""])) {
            MEADWeightage = 1.5;
            MEADScore = ([txtMEADTicks.text floatValue] / [txtMEADChecks.text floatValue]) * MEADWeightage;
        }
        if (!([txtMEAEChecks.text isEqualToString:@""] || [txtMEAEChecks.text isEqualToString:@"0"] || [txtMEAETicks.text isEqualToString:@""])) {
            MEAEWeightage = 3;
            MEAEScore = ([txtMEAETicks.text floatValue] / [txtMEAEChecks.text floatValue]) * MEAEWeightage;
        }
        if (!([txtMEFunctionalityChecks.text isEqualToString:@""] || [txtMEFunctionalityChecks.text isEqualToString:@"0"] || [txtMEFunctionalityTicks.text isEqualToString:@""])) {
            MEFunctionalityWeightage = 4.5;
            MEFunctionalityScore = ([txtMEFunctionalityTicks.text floatValue] / [txtMEFunctionalityChecks.text floatValue]) * MEFunctionalityWeightage;
        }
        if (!([txtMEJGChecks.text isEqualToString:@""] || [txtMEJGChecks.text isEqualToString:@"0"] || [txtMEJGTicks.text isEqualToString:@""])) {
            MEJPWeightage = 1.5;
            MEJPScore = ([txtMEJGTicks.text floatValue] / [txtMEJGChecks.text floatValue]) * MEJPWeightage;
        }
        if (!([txtMEMDChecks.text isEqualToString:@""] || [txtMEMDChecks.text isEqualToString:@"0"] || [txtMEMDTicks.text isEqualToString:@""])) {
            MEMDWeightage = 4.5;
            MEMDScore = ([txtMEMDTicks.text floatValue] / [txtMEMDChecks.text floatValue]) * MEMDWeightage;
        }
        if (!([txtWallAEChecks.text isEqualToString:@""] || [txtWallAEChecks.text isEqualToString:@"0"] || [txtWallAETicks.text isEqualToString:@""])) {
            wallAEWeightage = 2.8;
            wallAEScore = ([txtWallAETicks.text floatValue] / [txtWallAEChecks.text floatValue]) * wallAEWeightage;
        }
        if (!([txtWallCDChecks.text isEqualToString:@""] || [txtWallCDChecks.text isEqualToString:@"0"] || [txtWallCDTicks.text isEqualToString:@""])) {
            wallCDWeightage = 4.8;
            wallCDScore = ([txtWallCDTicks.text floatValue] / [txtWallCDChecks.text floatValue]) * wallCDWeightage;
        }
        if (!([txtWallFinishingChecks.text isEqualToString:@""] || [txtWallFinishingChecks.text isEqualToString:@"0"] || [txtWallFinishingTicks.text isEqualToString:@""])) {
            wallFinishingWeightage = 2.8;
            wallFinishingScore = ([txtWallFinishingTicks.text floatValue] / [txtWallFinishingChecks.text floatValue]) * wallFinishingWeightage;
        }
        if (!([txtWallHollownessChecks.text isEqualToString:@""] || [txtWallHollownessChecks.text isEqualToString:@"0"] || [txtWallHollownessTicks.text isEqualToString:@""])) {
            wallHollownessWeightage = 2.8;
            wallHollownessScore = ([txtWallHollownessTicks.text floatValue] / [txtWallHollownessChecks.text floatValue]) * wallHollownessWeightage;
        }
        if (!([txtWallJointingChecks.text isEqualToString:@""] || [txtWallJointingChecks.text isEqualToString:@"0"] || [txtWallJointingTicks.text isEqualToString:@""])) {
            wallJointingWeightage = 2.8;
            wallJointingScore = ([txtWallJointingTicks.text floatValue] / [txtWallJointingChecks.text floatValue]) * wallJointingWeightage;
        }
        if (!([txtWindowADChecks.text isEqualToString:@""] || [txtWindowADChecks.text isEqualToString:@"0"] || [txtWindowADTicks.text isEqualToString:@""])) {
            windowADWeightage = 1.8;
            windowADScore = ([txtWindowADTicks.text floatValue] / [txtWindowADChecks.text floatValue]) * windowADWeightage;
        }
        if (!([txtWindowAEChecks.text isEqualToString:@""] || [txtWindowAEChecks.text isEqualToString:@"0"] || [txtWindowAETicks.text isEqualToString:@""])) {
            windowAEWeightage = 0.6;
            windowAEScore = ([txtWindowAETicks.text floatValue] / [txtWindowAEChecks.text floatValue]) * windowAEWeightage;
        }
        if (!([txtWindowFunctionalityChecks.text isEqualToString:@""] || [txtWindowFunctionalityChecks.text isEqualToString:@"0"] || [txtWindowFunctionalityTicks.text isEqualToString:@""])) {
            windowFunctionalityWeightage = 1.8;
            windowFunctionalityScore = ([txtWindowFunctionalityTicks.text floatValue] / [txtWindowFunctionalityChecks.text floatValue]) * windowFunctionalityWeightage;
        }
        if (!([txtWindowJGChecks.text isEqualToString:@""] || [txtWindowJGChecks.text isEqualToString:@"0"] || [txtWindowJGTicks.text isEqualToString:@""])) {
            windowJGWeightage = 0.6;
            windowJGScore = ([txtWindowJGTicks.text floatValue] / [txtWindowJGChecks.text floatValue]) * windowJGWeightage;
        }
        if (!([txtWindowMDChecks.text isEqualToString:@""] || [txtWindowMDChecks.text isEqualToString:@"0"] || [txtWindowMDTicks.text isEqualToString:@""])) {
            windowMDWeightage = 1.2;
            windowMDScore = ([txtWindowMDTicks.text floatValue] / [txtWindowMDChecks.text floatValue]) * windowMDWeightage;
        }
        float ceilingWeightage = 0;
        float componentWeightage = 0;
        float doorWeightage = 0;
        float floorWeightage = 0;
        float MEWeightage = 0;
        float wallWeightage = 0;
        float windowWeightage = 0;
        float ceilingScore = 0;
        float componentScore = 0;
        float doorScore = 0;
        float floorScore = 0;
        float MEScore = 0;
        float wallScore = 0;
        float windowScore = 0;
        if ((ceilingAEWeightage+ceilingCDWeightage+ceilingFinishingWeightage+ceilingJointingWeightage+ceilingRoughnessWeightage) != 0) {
            ceilingWeightage = 6;
            ceilingScore = ((ceilingAEScore+ceilingCDScore+ceilingFinishingScore+ceilingJointingScore+ceilingRoughnessScore) / (ceilingAEWeightage+ceilingCDWeightage+ceilingFinishingWeightage+ceilingJointingWeightage+ceilingRoughnessWeightage)) * ceilingWeightage;
            ceilingScore = round( ceilingScore * 100.0 ) / 100.0;
        }
        if ((componentADWeightage+componentAEWeightage+componentFunctionalityWeightage+componentJPWeightage+componentMDWeightage) != 0) {
            componentWeightage = 6;
            componentScore = ((componentADScore+componentAEScore+componentFunctionalityScore+componentJPScore+componentMDScore) / (componentADWeightage+componentAEWeightage+componentFunctionalityWeightage+componentJPWeightage+componentMDWeightage)) * componentWeightage;
            componentScore = round( componentScore * 100.0 ) / 100.0;
        }
        if ((doorADWeightage+doorAEWeightage+doorFunctionalityWeightage+doorJPWeightage+doorMDWeightage) != 0) {
            doorWeightage = 6;
            doorScore = ((doorADScore+doorAEScore+doorFunctionalityScore+doorJPScore+doorMDScore) / (doorADWeightage+doorAEWeightage+doorFunctionalityWeightage+doorJPWeightage+doorMDWeightage)) * doorWeightage;
            doorScore = round( doorScore * 100.0 ) / 100.0;
        }
        if ((floorAEWeightage+floorCDWeightage+floorFinishingWeightage+floorHollownessWeightage+floorJointingWeightage) != 0) {
            floorWeightage = 16;
            floorScore = ((floorAEScore+floorCDScore+floorFinishingScore+floorHollownessScore+floorJointingScore) / (floorAEWeightage+floorCDWeightage+floorFinishingWeightage+floorHollownessWeightage+floorJointingWeightage)) * floorWeightage;
            floorScore = round( floorScore * 100.0 ) / 100.0;
        }
        if ((MEADWeightage+MEAEWeightage+MEFunctionalityWeightage+MEJPWeightage+MEMDWeightage) != 0) {
            MEWeightage = 15;
            MEScore = ((MEADScore+MEAEScore+MEFunctionalityScore+MEJPScore+MEMDScore) / (MEADWeightage+MEAEWeightage+MEFunctionalityWeightage+MEJPWeightage+MEMDWeightage)) * MEWeightage;
            MEScore = round( MEScore * 100.0 ) / 100.0;
        }
        if ((wallAEWeightage+wallCDWeightage+wallFinishingWeightage+wallHollownessWeightage+wallJointingWeightage) != 0) {
            wallWeightage = 16;
            wallScore = ((wallAEScore+wallCDScore+wallFinishingScore+wallHollownessScore+wallJointingScore) / (wallAEWeightage+wallCDWeightage+wallFinishingWeightage+wallHollownessWeightage+wallJointingWeightage)) * wallWeightage;
            wallScore = round( wallScore * 100.0 ) / 100.0;
        }
        if ((windowADWeightage+windowAEWeightage+windowFunctionalityWeightage+windowJGWeightage+windowMDWeightage) != 0) {
            windowWeightage = 6;
            windowScore = ((windowADScore+windowAEScore+windowFunctionalityScore+windowJGScore+windowMDScore) / (windowADWeightage+windowAEWeightage+windowFunctionalityWeightage+windowJGWeightage+windowMDWeightage)) * windowWeightage;
            windowScore = round( windowScore * 100.0 ) / 100.0;
        }
        
               
        
        
        float sampleScore = 0;
        if ((ceilingWeightage+componentWeightage+doorWeightage+floorWeightage+MEWeightage+wallWeightage+windowWeightage) != 0) {
            sampleScore = ((ceilingScore+componentScore+doorScore+floorScore+MEScore+wallScore+windowScore) / (ceilingWeightage+componentWeightage+doorWeightage+floorWeightage+MEWeightage+wallWeightage+windowWeightage)) * 100;
            sampleScore = round( sampleScore * 100.0 ) / 100.0;
        }
        
        lblScore.text = [NSString stringWithFormat:@"%1.2f", sampleScore];
    }

}
- (IBAction)calculaterSlider:(id)sender {
    
    int selectedValue = (int)calculaterSlider.value;
    if (selectedValue == 0) {
        svSavedInformation.hidden = NO;
        viewSampleInformation.hidden = YES;
        viewCelling.hidden = YES;
        viewComponent.hidden = YES;
        viewDoor.hidden = YES;
        viewFloor.hidden = YES;
        viewME.hidden = YES;
        viewWall.hidden = YES;
        viewWindow.hidden = YES;
    } else if (selectedValue == 1) {
        svSavedInformation.hidden = YES;
        viewSampleInformation.hidden = NO;
        viewCelling.hidden = YES;
        viewComponent.hidden = YES;
        viewDoor.hidden = YES;
        viewFloor.hidden = YES;
        viewME.hidden = YES;
        viewWall.hidden = YES;
        viewWindow.hidden = YES;
    } else if (selectedValue == 2) {
        svSavedInformation.hidden = YES;
        viewSampleInformation.hidden = YES;
        viewCelling.hidden = NO;
        viewComponent.hidden = YES;
        viewDoor.hidden = YES;
        viewFloor.hidden = YES;
        viewME.hidden = YES;
        viewWall.hidden = YES;
        viewWindow.hidden = YES;
    } else if (selectedValue == 3) {
        svSavedInformation.hidden = YES;
        viewSampleInformation.hidden = YES;
        viewCelling.hidden = YES;
        viewComponent.hidden = NO;
        viewDoor.hidden = YES;
        viewFloor.hidden = YES;
        viewME.hidden = YES;
        viewWall.hidden = YES;
        viewWindow.hidden = YES;
    } else if (selectedValue == 4) {
        svSavedInformation.hidden = YES;
        viewSampleInformation.hidden = YES;
        viewCelling.hidden = YES;
        viewComponent.hidden = YES;
        viewDoor.hidden = NO;
        viewFloor.hidden = YES;
        viewME.hidden = YES;
        viewWall.hidden = YES;
        viewWindow.hidden = YES;
    } else if (selectedValue == 5) {
        svSavedInformation.hidden = YES;
        viewSampleInformation.hidden = YES;
        viewCelling.hidden = YES;
        viewComponent.hidden = YES;
        viewDoor.hidden = YES;
        viewFloor.hidden = NO;
        viewME.hidden = YES;
        viewWall.hidden = YES;
        viewWindow.hidden = YES;
    } else if (selectedValue == 6) {
        svSavedInformation.hidden = YES;
        viewSampleInformation.hidden = YES;
        viewCelling.hidden = YES;
        viewComponent.hidden = YES;
        viewDoor.hidden = YES;
        viewFloor.hidden = YES;
        viewME.hidden = NO;
        viewWall.hidden = YES;
        viewWindow.hidden = YES;
    } else if (selectedValue == 7) {
        svSavedInformation.hidden = YES;
        viewSampleInformation.hidden = YES;
        viewCelling.hidden = YES;
        viewComponent.hidden = YES;
        viewDoor.hidden = YES;
        viewFloor.hidden = YES;
        viewME.hidden = YES;
        viewWall.hidden = NO;
        viewWindow.hidden = YES;
    } else if (selectedValue == 8) {
        svSavedInformation.hidden = YES;
        viewSampleInformation.hidden = YES;
        viewCelling.hidden = YES;
        viewComponent.hidden = YES;
        viewDoor.hidden = YES;
        viewFloor.hidden = YES;
        viewME.hidden = YES;
        viewWall.hidden = YES;
        viewWindow.hidden = NO;
    }

}
- (IBAction)resetScore:(id)sender {
    
    txtBlkNumber.text = @"";
    txtStoreyNumber.text = @"";
    txtUnitNumber.text = @"";
    txtLocationName.text = @"";
    txtCeilingFinishingTicks.text = @"";
    txtCeilingFinishingChecks.text = @"";
    txtCeilingAETicks.text = @"";
    txtCeilingAEChecks.text = @"";
    txtCeilingCDTicks.text = @"";
    txtCeilingCDChecks.text = @"";
    txtCeilingRoughnessTicks.text = @"";
    txtCeilingRoughnessChecks.text = @"";
    txtCeilingJointingTicks.text = @"";
    txtCeilingJointingChecks.text = @"";
    txtComponentJGTicks.text = @"";
    txtComponentJGChecks.text = @"";
    txtComponentAETicks.text = @"";
    txtComponentAEChecks.text = @"";
    txtComponentMDTicks.text = @"";
    txtComponentMDChecks.text = @"";
    txtComponentFunctionalityTicks.text = @"";
    txtComponentFunctionalityChecks.text = @"";
    txtComponentADTicks.text = @"";
    txtComponentADChecks.text = @"";
    txtDoorJGTicks.text = @"";
    txtDoorJGChecks.text = @"";
    txtDoorAETicks.text = @"";
    txtDoorAEChecks.text = @"";
    txtDoorMDTicks.text = @"";
    txtDoorMDChecks.text = @"";
    txtDoorFunctionalityTicks.text = @"";
    txtDoorFunctionalityChecks.text = @"";
    txtDoorADTicks.text = @"";
    txtDoorADChecks.text = @"";
    txtFloorFinishingTicks.text = @"";
    txtFloorFinishingChecks.text = @"";
    txtFloorAETicks.text = @"";
    txtFloorAEChecks.text = @"";
    txtFloorCDTicks.text = @"";
    txtFloorCDChecks.text = @"";
    txtFloorHollownessTicks.text = @"";
    txtFloorHollownessChecks.text = @"";
    txtFloorJointingTicks.text = @"";
    txtFloorJointingChecks.text = @"";
    txtMEJGTicks.text = @"";
    txtMEJGChecks.text = @"";
    txtMEAETicks.text = @"";
    txtMEAEChecks.text = @"";
    txtMEMDTicks.text = @"";
    txtMEMDChecks.text = @"";
    txtMEFunctionalityTicks.text = @"";
    txtMEFunctionalityChecks.text = @"";
    txtMEADTicks.text = @"";
    txtMEADChecks.text = @"";
    txtWallFinishingTicks.text = @"";
    txtWallFinishingChecks.text = @"";
    txtWallAETicks.text = @"";
    txtWallAEChecks.text = @"";
    txtWallCDTicks.text = @"";
    txtWallCDChecks.text = @"";
    txtWallHollownessTicks.text = @"";
    txtWallHollownessChecks.text = @"";
    txtWallJointingTicks.text = @"";
    txtWallJointingChecks.text = @"";
    txtWindowJGTicks.text = @"";
    txtWindowJGChecks.text = @"";
    txtWindowAETicks.text = @"";
    txtWindowAEChecks.text = @"";
    txtWindowMDTicks.text = @"";
    txtWindowMDChecks.text = @"";
    txtWindowFunctionalityTicks.text = @"";
    txtWindowFunctionalityChecks.text = @"";
    txtWindowADTicks.text = @"";
    txtWindowADChecks.text = @"";
    lblScore.text = @"0";
}

- (IBAction)saveInternalFinishesData:(id)sender {
    
    NSString *message;
    if ([txtBlkNumber.text isEqualToString:@""]) {
        message = @"Blk Required!";
    } else if ([txtStoreyNumber.text isEqualToString:@""]) {
        message = @"Storey Required!";
    } else if (![self isNumeric:txtStoreyNumber.text]) {
        message = @"Storey Must Be A Number!";
    } else {
        int intEditionNumber = (int)editionNumber.value;
        NSString *strEditionNumber = [NSString stringWithFormat:@"%i", intEditionNumber];
        NSString *strBlkNumber = txtBlkNumber.text;
        NSString *strStoreyNumber = txtStoreyNumber.text;
        NSString *strUnitNumber = txtUnitNumber.text;
        NSString *strLocationName = txtLocationName.text;
        NSString *strElementType;
        NSString *strDefectType;
        int intNumTicks = 0;
        int intNumChecks = 0;
        sqlite3_stmt *statement;
        NSString *insertSQL;
        const char *insert_stmt;
        const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &CONQUASDB) == SQLITE_OK)
        {
            insertSQL = [NSString stringWithFormat: @"DELETE FROM InternalFinishesDetails where blkNumber='%@' and storeyNumber='%@' and unitNumber='%@' and editionNumber='%@' and locationName='%@'", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            insertSQL = [NSString stringWithFormat: @"DELETE FROM InternalFinishesSummaryDetails where blkNumber='%@' and storeyNumber='%@' and unitNumber='%@' and editionNumber='%@' and (locationName='%@' OR locationName='-Whole Unit-')", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strElementType = @"Ceiling";
            strDefectType = @"Finishing";
            if ([txtCeilingFinishingTicks.text isEqualToString:@""] || ![self isNumeric:txtCeilingFinishingTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtCeilingFinishingTicks.text intValue];
            }
            if ([txtCeilingFinishingChecks.text isEqualToString:@""] || ![self isNumeric:txtCeilingFinishingChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtCeilingFinishingChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"AE";
            if ([txtCeilingAETicks.text isEqualToString:@""] || ![self isNumeric:txtCeilingAETicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtCeilingAETicks.text intValue];
            }
            if ([txtCeilingAEChecks.text isEqualToString:@""] || ![self isNumeric:txtCeilingAEChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtCeilingAEChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"CD";
            if ([txtCeilingCDTicks.text isEqualToString:@""] || ![self isNumeric:txtCeilingCDTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtCeilingCDTicks.text intValue];
            }
            if ([txtCeilingCDChecks.text isEqualToString:@""] || ![self isNumeric:txtCeilingCDChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtCeilingCDChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"Roughness";
            if ([txtCeilingRoughnessTicks.text isEqualToString:@""] || ![self isNumeric:txtCeilingRoughnessTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtCeilingRoughnessTicks.text intValue];
            }
            if ([txtCeilingRoughnessChecks.text isEqualToString:@""] || ![self isNumeric:txtCeilingRoughnessChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtCeilingRoughnessChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"Jointing";
            if ([txtCeilingJointingTicks.text isEqualToString:@""] || ![self isNumeric:txtCeilingJointingTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtCeilingJointingTicks.text intValue];
            }
            if ([txtCeilingJointingChecks.text isEqualToString:@""] || ![self isNumeric:txtCeilingJointingChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtCeilingJointingChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strElementType = @"Component";
            strDefectType = @"JP";
            if ([txtComponentJGTicks.text isEqualToString:@""] || ![self isNumeric:txtComponentJGTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtComponentJGTicks.text intValue];
            }
            if ([txtComponentJGChecks.text isEqualToString:@""] || ![self isNumeric:txtComponentJGChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtComponentJGChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"AE";
            if ([txtComponentAETicks.text isEqualToString:@""] || ![self isNumeric:txtComponentAETicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtComponentAETicks.text intValue];
            }
            if ([txtComponentAEChecks.text isEqualToString:@""] || ![self isNumeric:txtComponentAEChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtComponentAEChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"MD";
            if ([txtComponentMDTicks.text isEqualToString:@""] || ![self isNumeric:txtComponentMDTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtComponentMDTicks.text intValue];
            }
            if ([txtComponentMDChecks.text isEqualToString:@""] || ![self isNumeric:txtComponentMDChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtComponentMDChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"Functionality";
            if ([txtComponentFunctionalityTicks.text isEqualToString:@""] || ![self isNumeric:txtComponentFunctionalityTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtComponentFunctionalityTicks.text intValue];
            }
            if ([txtComponentFunctionalityChecks.text isEqualToString:@""] || ![self isNumeric:txtComponentFunctionalityChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtComponentFunctionalityChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"AD";
            if ([txtComponentADTicks.text isEqualToString:@""] || ![self isNumeric:txtComponentADTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtComponentADTicks.text intValue];
            }
            if ([txtComponentADChecks.text isEqualToString:@""] || ![self isNumeric:txtComponentADChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtComponentADChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strElementType = @"Door";
            strDefectType = @"JP";
            if ([txtDoorJGTicks.text isEqualToString:@""] || ![self isNumeric:txtDoorJGTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtDoorJGTicks.text intValue];
            }
            if ([txtDoorJGChecks.text isEqualToString:@""] || ![self isNumeric:txtDoorJGChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtDoorJGChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"AE";
            if ([txtDoorAETicks.text isEqualToString:@""] || ![self isNumeric:txtDoorAETicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtDoorAETicks.text intValue];
            }
            if ([txtDoorAEChecks.text isEqualToString:@""] || ![self isNumeric:txtDoorAEChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtDoorAEChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"MD";
            if ([txtDoorMDTicks.text isEqualToString:@""] || ![self isNumeric:txtDoorMDTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtDoorMDTicks.text intValue];
            }
            if ([txtDoorMDChecks.text isEqualToString:@""] || ![self isNumeric:txtDoorMDChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtDoorMDChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"Functionality";
            if ([txtDoorFunctionalityTicks.text isEqualToString:@""] || ![self isNumeric:txtDoorFunctionalityTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtDoorFunctionalityTicks.text intValue];
            }
            if ([txtDoorFunctionalityChecks.text isEqualToString:@""] || ![self isNumeric:txtDoorFunctionalityChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtDoorFunctionalityChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"AD";
            if ([txtDoorADTicks.text isEqualToString:@""] || ![self isNumeric:txtDoorADTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtDoorADTicks.text intValue];
            }
            if ([txtDoorADChecks.text isEqualToString:@""] || ![self isNumeric:txtDoorADChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtDoorADChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strElementType = @"Floor";
            strDefectType = @"Finishing";
            if ([txtFloorFinishingTicks.text isEqualToString:@""] || ![self isNumeric:txtFloorFinishingTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtFloorFinishingTicks.text intValue];
            }
            if ([txtFloorFinishingChecks.text isEqualToString:@""] || ![self isNumeric:txtFloorFinishingChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtFloorFinishingChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"AE";
            if ([txtFloorAETicks.text isEqualToString:@""] || ![self isNumeric:txtFloorAETicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtFloorAETicks.text intValue];
            }
            if ([txtFloorAEChecks.text isEqualToString:@""] || ![self isNumeric:txtFloorAEChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtFloorAEChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"CD";
            if ([txtFloorCDTicks.text isEqualToString:@""] || ![self isNumeric:txtFloorCDTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtFloorCDTicks.text intValue];
            }
            if ([txtFloorCDChecks.text isEqualToString:@""] || ![self isNumeric:txtFloorCDChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtFloorCDChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"Hollowness";
            if ([txtFloorHollownessTicks.text isEqualToString:@""] || ![self isNumeric:txtFloorHollownessTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtFloorHollownessTicks.text intValue];
            }
            if ([txtFloorHollownessChecks.text isEqualToString:@""] || ![self isNumeric:txtFloorHollownessChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtFloorHollownessChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"Jointing";
            if ([txtFloorJointingTicks.text isEqualToString:@""] || ![self isNumeric:txtFloorJointingTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtFloorJointingTicks.text intValue];
            }
            if ([txtFloorJointingChecks.text isEqualToString:@""] || ![self isNumeric:txtFloorJointingChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtFloorJointingChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strElementType = @"ME";
            strDefectType = @"JP";
            if ([txtMEJGTicks.text isEqualToString:@""] || ![self isNumeric:txtMEJGTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtMEJGTicks.text intValue];
            }
            if ([txtMEJGChecks.text isEqualToString:@""] || ![self isNumeric:txtMEJGChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtMEJGChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"AE";
            if ([txtMEAETicks.text isEqualToString:@""] || ![self isNumeric:txtMEAETicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtMEAETicks.text intValue];
            }
            if ([txtMEAEChecks.text isEqualToString:@""] || ![self isNumeric:txtMEAEChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtMEAEChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"MD";
            if ([txtMEMDTicks.text isEqualToString:@""] || ![self isNumeric:txtMEMDTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtMEMDTicks.text intValue];
            }
            if ([txtMEMDChecks.text isEqualToString:@""] || ![self isNumeric:txtMEMDChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtMEMDChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"Functionality";
            if ([txtMEFunctionalityTicks.text isEqualToString:@""] || ![self isNumeric:txtMEFunctionalityTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtMEFunctionalityTicks.text intValue];
            }
            if ([txtMEFunctionalityChecks.text isEqualToString:@""] || ![self isNumeric:txtMEFunctionalityChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtMEFunctionalityChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"AD";
            if ([txtMEADTicks.text isEqualToString:@""] || ![self isNumeric:txtMEADTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtMEADTicks.text intValue];
            }
            if ([txtMEADChecks.text isEqualToString:@""] || ![self isNumeric:txtMEADChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtMEADChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strElementType = @"Wall";
            strDefectType = @"Finishing";
            if ([txtWallFinishingTicks.text isEqualToString:@""] || ![self isNumeric:txtWallFinishingTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtWallFinishingTicks.text intValue];
            }
            if ([txtWallFinishingChecks.text isEqualToString:@""] || ![self isNumeric:txtWallFinishingChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtWallFinishingChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"AE";
            if ([txtWallAETicks.text isEqualToString:@""] || ![self isNumeric:txtWallAETicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtWallAETicks.text intValue];
            }
            if ([txtWallAEChecks.text isEqualToString:@""] || ![self isNumeric:txtWallAEChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtWallAEChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"CD";
            if ([txtWallCDTicks.text isEqualToString:@""] || ![self isNumeric:txtWallCDTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtWallCDTicks.text intValue];
            }
            if ([txtWallCDChecks.text isEqualToString:@""] || ![self isNumeric:txtWallCDChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtWallCDChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"Hollowness";
            if ([txtWallHollownessTicks.text isEqualToString:@""] || ![self isNumeric:txtWallHollownessTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtWallHollownessTicks.text intValue];
            }
            if ([txtWallHollownessChecks.text isEqualToString:@""] || ![self isNumeric:txtWallHollownessChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtWallHollownessChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"Jointing";
            if ([txtWallJointingTicks.text isEqualToString:@""] || ![self isNumeric:txtWallJointingTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtWallJointingTicks.text intValue];
            }
            if ([txtWallJointingChecks.text isEqualToString:@""] || ![self isNumeric:txtWallJointingChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtWallJointingChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strElementType = @"Window";
            strDefectType = @"JG";
            if ([txtWindowJGTicks.text isEqualToString:@""] || ![self isNumeric:txtWindowJGTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtWindowJGTicks.text intValue];
            }
            if ([txtWindowJGChecks.text isEqualToString:@""] || ![self isNumeric:txtWindowJGChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtWindowJGChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"AE";
            if ([txtWindowAETicks.text isEqualToString:@""] || ![self isNumeric:txtWindowAETicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtWindowAETicks.text intValue];
            }
            if ([txtWindowAEChecks.text isEqualToString:@""] || ![self isNumeric:txtWindowAEChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtWindowAEChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"MD";
            if ([txtWindowMDTicks.text isEqualToString:@""] || ![self isNumeric:txtWindowMDTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtWindowMDTicks.text intValue];
            }
            if ([txtWindowMDChecks.text isEqualToString:@""] || ![self isNumeric:txtWindowMDChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtWindowMDChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"Functionality";
            if ([txtWindowFunctionalityTicks.text isEqualToString:@""] || ![self isNumeric:txtWindowFunctionalityTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtWindowFunctionalityTicks.text intValue];
            }
            if ([txtWindowFunctionalityChecks.text isEqualToString:@""] || ![self isNumeric:txtWindowFunctionalityChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtWindowFunctionalityChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            strDefectType = @"AD";
            if ([txtWindowADTicks.text isEqualToString:@""] || ![self isNumeric:txtWindowADTicks.text]) {
                intNumTicks = 0;
            } else {
                intNumTicks = [txtWindowADTicks.text intValue];
            }
            if ([txtWindowADChecks.text isEqualToString:@""] || ![self isNumeric:txtWindowADChecks.text]) {
                intNumChecks = 0;
            } else {
                intNumChecks = [txtWindowADChecks.text intValue];
            }
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, elementType, defectType, numTicks, numChecks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %i, %i);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, strElementType, strDefectType, intNumTicks, intNumChecks];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            float score = [lblScore.text floatValue];
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesSummaryDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, score) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %f);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, score];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            
            //comment - Update The Score For That Entire Unit (blkNumber + storeyNumber + unitNumber + editionNumber) Without Taking locationName Into Account.
            NSString *tempElementType;
            NSString *tempDefectType;
            NSString *tempNumTicks;
            NSString *tempNumChecks;
            NSString *selectSQL = [NSString stringWithFormat: @"SELECT elementType, defectType, SUM(numTicks), SUM(numChecks) FROM InternalFinishesDetails where blkNumber=\"%@\" and  storeyNumber=\"%@\" and unitNumber=\"%@\" and editionNumber=\"%@\" GROUP BY elementType, defectType;", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber];
            const char *query_stmt = [selectSQL UTF8String];
            
            if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                txtLocationName.text = @"-Whole Unit-";
                while (sqlite3_step(statement) == SQLITE_ROW)
                {
                    tempElementType = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                    tempDefectType = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                    tempNumTicks = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                    tempNumChecks = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                    
                    if ([tempElementType isEqualToString:@"Ceiling"]) {
                        if ([tempDefectType isEqualToString:@"AE"]) {
                            txtCeilingAETicks.text = tempNumTicks;
                            txtCeilingAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"CD"]) {
                            txtCeilingCDTicks.text = tempNumTicks;
                            txtCeilingCDChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Finishing"]) {
                            txtCeilingFinishingTicks.text = tempNumTicks;
                            txtCeilingFinishingChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Jointing"]) {
                            txtCeilingJointingTicks.text = tempNumTicks;
                            txtCeilingJointingChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Roughness"]) {
                            txtCeilingRoughnessTicks.text = tempNumTicks;
                            txtCeilingRoughnessChecks.text = tempNumChecks;
                        }
                    } else if ([tempElementType isEqualToString:@"Component"]) {
                        if ([tempDefectType isEqualToString:@"AD"]) {
                            txtComponentADTicks.text = tempNumTicks;
                            txtComponentADChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"AE"]) {
                            txtComponentAETicks.text = tempNumTicks;
                            txtComponentAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Functionality"]) {
                            txtComponentFunctionalityTicks.text = tempNumTicks;
                            txtComponentFunctionalityChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"JP"]) {
                            txtComponentJGTicks.text = tempNumTicks;
                            txtComponentJGChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"MD"]) {
                            txtComponentMDTicks.text = tempNumTicks;
                            txtComponentMDChecks.text = tempNumChecks;
                        }
                    } else if ([tempElementType isEqualToString:@"Door"]) {
                        if ([tempDefectType isEqualToString:@"AD"]) {
                            txtDoorADTicks.text = tempNumTicks;
                            txtDoorADChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"AE"]) {
                            txtDoorAETicks.text = tempNumTicks;
                            txtDoorAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Functionality"]) {
                            txtDoorFunctionalityTicks.text = tempNumTicks;
                            txtDoorFunctionalityChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"JP"]) {
                            txtDoorJGTicks.text = tempNumTicks;
                            txtDoorJGChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"MD"]) {
                            txtDoorMDTicks.text = tempNumTicks;
                            txtDoorMDChecks.text = tempNumChecks;
                        }
                    } else if ([tempElementType isEqualToString:@"Floor"]) {
                        if ([tempDefectType isEqualToString:@"AE"]) {
                            txtFloorAETicks.text = tempNumTicks;
                            txtFloorAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"CD"]) {
                            txtFloorCDTicks.text = tempNumTicks;
                            txtFloorCDChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Finishing"]) {
                            txtFloorFinishingTicks.text = tempNumTicks;
                            txtFloorFinishingChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Hollowness"]) {
                            txtFloorHollownessTicks.text = tempNumTicks;
                            txtFloorHollownessChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Jointing"]) {
                            txtFloorJointingTicks.text = tempNumTicks;
                            txtFloorJointingChecks.text = tempNumChecks;
                        }
                    } else if ([tempElementType isEqualToString:@"ME"]) {
                        if ([tempDefectType isEqualToString:@"AD"]) {
                            txtMEADTicks.text = tempNumTicks;
                            txtMEADChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"AE"]) {
                            txtMEAETicks.text = tempNumTicks;
                            txtMEAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Functionality"]) {
                            txtMEFunctionalityTicks.text = tempNumTicks;
                            txtMEFunctionalityChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"JP"]) {
                            txtMEJGTicks.text = tempNumTicks;
                            txtMEJGChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"MD"]) {
                            txtMEMDTicks.text = tempNumTicks;
                            txtMEMDChecks.text = tempNumChecks;
                        }
                    } else if ([tempElementType isEqualToString:@"Wall"]) {
                        if ([tempDefectType isEqualToString:@"AE"]) {
                            txtWallAETicks.text = tempNumTicks;
                            txtWallAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"CD"]) {
                            txtWallCDTicks.text = tempNumTicks;
                            txtWallCDChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Finishing"]) {
                            txtWallFinishingTicks.text = tempNumTicks;
                            txtWallFinishingChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Hollowness"]) {
                            txtWallHollownessTicks.text = tempNumTicks;
                            txtWallHollownessChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Jointing"]) {
                            txtWallJointingTicks.text = tempNumTicks;
                            txtWallJointingChecks.text = tempNumChecks;
                        }
                    } else if ([tempElementType isEqualToString:@"Window"]) {
                        if ([tempDefectType isEqualToString:@"AD"]) {
                            txtWindowADTicks.text = tempNumTicks;
                            txtWindowADChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"AE"]) {
                            txtWindowAETicks.text = tempNumTicks;
                            txtWindowAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Functionality"]) {
                            txtWindowFunctionalityTicks.text = tempNumTicks;
                            txtWindowFunctionalityChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"JG"]) {
                            txtWindowJGTicks.text = tempNumTicks;
                            txtWindowJGChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"MD"]) {
                            txtWindowMDTicks.text = tempNumTicks;
                            txtWindowMDChecks.text = tempNumChecks;
                        }
                    }
                }
            }
            
            //NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
            sqlite3_finalize(statement);
            [self calculateScore:nil];
            strLocationName = txtLocationName.text;
            score = [lblScore.text floatValue];
            insertSQL = [NSString stringWithFormat: @"INSERT INTO InternalFinishesSummaryDetails(blkNumber, storeyNumber, unitNumber, editionNumber, locationName, score) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", %f);", strBlkNumber, strStoreyNumber, strUnitNumber, strEditionNumber, strLocationName, score];
            insert_stmt = [insertSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, insert_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {}
            sqlite3_finalize(statement);
            [self resetScore:nil];
            
            for (UIView *subview in [svSavedInformation subviews]) {
                [subview removeFromSuperview];
            }
            [self retrieveSavedInformation:nil];
            
            //sqlite3_close(CONQUASDB);
            message = @"Saved Successfully.";
        }
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:message delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
    [alert show];

}

-(void)sampleEdit:(id)sender{
    
    int sampleID = ((UIControl *) sender).tag;
    NSString *tempBlkNumber;
    NSString *tempStoreyNumber;
    NSString *tempUnitNumber;
    NSString *tempLocationName;
    NSString *tempScore;
    NSString *tempEditionNumber;
    NSString *tempElementType;
    NSString *tempDefectType;
    NSString *tempNumTicks;
    NSString *tempNumChecks;
    sqlite3_stmt *statement, *statement2;
    
    NSString *selectSQL = [NSString stringWithFormat: @"SELECT blkNumber, storeyNumber, unitNumber, editionNumber, locationName, score FROM InternalFinishesSummaryDetails WHERE ID=%i", sampleID];
    const char *query_stmt = [selectSQL UTF8String];
    
    if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_ROW)
        {
            tempBlkNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
            tempStoreyNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
            tempUnitNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
            tempEditionNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
            tempLocationName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
            tempScore = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
            
            txtBlkNumber.text = tempBlkNumber;
            txtStoreyNumber.text = tempStoreyNumber;
            txtUnitNumber.text = tempUnitNumber;
            txtLocationName.text = tempLocationName;
            float floatScore = round( [tempScore floatValue] * 100.0 ) / 100.0;
            lblScore.text = [NSString stringWithFormat:@"%1.2f", floatScore];
            int intEditionNumber = [tempEditionNumber intValue];
            if (intEditionNumber == 6) {
                lblEditionNumber.text = @"6th Edition";
            } else if (intEditionNumber == 7) {
                lblEditionNumber.text = @"7th Edition";
            } else if (intEditionNumber == 8) {
                lblEditionNumber.text = @"8th Edition";
            }
            
            selectSQL = [NSString stringWithFormat: @"SELECT editionNumber, elementType, defectType, numTicks, numChecks FROM InternalFinishesDetails WHERE blkNumber='%@' and storeyNumber='%@' and unitNumber='%@' and locationName='%@'", tempBlkNumber, tempStoreyNumber, tempUnitNumber, tempLocationName];
            query_stmt = [selectSQL UTF8String];
            if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement2, NULL) == SQLITE_OK) {
                while (sqlite3_step(statement2) == SQLITE_ROW) {
                    tempEditionNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement2, 0)];
                    tempElementType = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement2, 1)];
                    tempDefectType = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement2, 2)];
                    tempNumTicks = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement2, 3)];
                    tempNumChecks = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement2, 4)];
                    
                    editionNumber.value = [tempEditionNumber floatValue];
                    if ([tempElementType isEqualToString:@"Ceiling"]) {
                        if ([tempDefectType isEqualToString:@"AE"]) {
                            txtCeilingAETicks.text = tempNumTicks;
                            txtCeilingAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"CD"]) {
                            txtCeilingCDTicks.text = tempNumTicks;
                            txtCeilingCDChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Finishing"]) {
                            txtCeilingFinishingTicks.text = tempNumTicks;
                            txtCeilingFinishingChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Jointing"]) {
                            txtCeilingJointingTicks.text = tempNumTicks;
                            txtCeilingJointingChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Roughness"]) {
                            txtCeilingRoughnessTicks.text = tempNumTicks;
                            txtCeilingRoughnessChecks.text = tempNumChecks;
                        }
                    } else if ([tempElementType isEqualToString:@"Component"]) {
                        if ([tempDefectType isEqualToString:@"AD"]) {
                            txtComponentADTicks.text = tempNumTicks;
                            txtComponentADChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"AE"]) {
                            txtComponentAETicks.text = tempNumTicks;
                            txtComponentAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Functionality"]) {
                            txtComponentFunctionalityTicks.text = tempNumTicks;
                            txtComponentFunctionalityChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"JP"]) {
                            txtComponentJGTicks.text = tempNumTicks;
                            txtComponentJGChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"MD"]) {
                            txtComponentMDTicks.text = tempNumTicks;
                            txtComponentMDChecks.text = tempNumChecks;
                        }
                    } else if ([tempElementType isEqualToString:@"Door"]) {
                        if ([tempDefectType isEqualToString:@"AD"]) {
                            txtDoorADTicks.text = tempNumTicks;
                            txtDoorADChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"AE"]) {
                            txtDoorAETicks.text = tempNumTicks;
                            txtDoorAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Functionality"]) {
                            txtDoorFunctionalityTicks.text = tempNumTicks;
                            txtDoorFunctionalityChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"JP"]) {
                            txtDoorJGTicks.text = tempNumTicks;
                            txtDoorJGChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"MD"]) {
                            txtDoorMDTicks.text = tempNumTicks;
                            txtDoorMDChecks.text = tempNumChecks;
                        }
                    } else if ([tempElementType isEqualToString:@"Floor"]) {
                        if ([tempDefectType isEqualToString:@"AE"]) {
                            txtFloorAETicks.text = tempNumTicks;
                            txtFloorAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"CD"]) {
                            txtFloorCDTicks.text = tempNumTicks;
                            txtFloorCDChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Finishing"]) {
                            txtFloorFinishingTicks.text = tempNumTicks;
                            txtFloorFinishingChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Hollowness"]) {
                            txtFloorHollownessTicks.text = tempNumTicks;
                            txtFloorHollownessChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Jointing"]) {
                            txtFloorJointingTicks.text = tempNumTicks;
                            txtFloorJointingChecks.text = tempNumChecks;
                        }
                    } else if ([tempElementType isEqualToString:@"ME"]) {
                        if ([tempDefectType isEqualToString:@"AD"]) {
                            txtMEADTicks.text = tempNumTicks;
                            txtMEADChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"AE"]) {
                            txtMEAETicks.text = tempNumTicks;
                            txtMEAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Functionality"]) {
                            txtMEFunctionalityTicks.text = tempNumTicks;
                            txtMEFunctionalityChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"JP"]) {
                            txtMEJGTicks.text = tempNumTicks;
                            txtMEJGChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"MD"]) {
                            txtMEMDTicks.text = tempNumTicks;
                            txtMEMDChecks.text = tempNumChecks;
                        }
                    } else if ([tempElementType isEqualToString:@"Wall"]) {
                        if ([tempDefectType isEqualToString:@"AE"]) {
                            txtWallAETicks.text = tempNumTicks;
                            txtWallAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"CD"]) {
                            txtWallCDTicks.text = tempNumTicks;
                            txtWallCDChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Finishing"]) {
                            txtWallFinishingTicks.text = tempNumTicks;
                            txtWallFinishingChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Hollowness"]) {
                            txtWallHollownessTicks.text = tempNumTicks;
                            txtWallHollownessChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Jointing"]) {
                            txtWallJointingTicks.text = tempNumTicks;
                            txtWallJointingChecks.text = tempNumChecks;
                        }
                    } else if ([tempElementType isEqualToString:@"Window"]) {
                        if ([tempDefectType isEqualToString:@"AD"]) {
                            txtWindowADTicks.text = tempNumTicks;
                            txtWindowADChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"AE"]) {
                            txtWindowAETicks.text = tempNumTicks;
                            txtWindowAEChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"Functionality"]) {
                            txtWindowFunctionalityTicks.text = tempNumTicks;
                            txtWindowFunctionalityChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"JG"]) {
                            txtWindowJGTicks.text = tempNumTicks;
                            txtWindowJGChecks.text = tempNumChecks;
                        } else if ([tempDefectType isEqualToString:@"MD"]) {
                            txtWindowMDTicks.text = tempNumTicks;
                            txtWindowMDChecks.text = tempNumChecks;
                        }
                    }
                }
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Data Retrieved Successfully!" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
                [alert show];
            }
            sqlite3_finalize(statement2);
        }
    }
    NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
    sqlite3_finalize(statement);

    
}
-(void)sampleDelete:(id)sender{
    
    for (UIView *subview in [svSavedInformation subviews]) {
        [subview removeFromSuperview];
    }
    int sampleID = ((UIControl *) sender).tag;
    NSString *tempBlkNumber;
    NSString *tempStoreyNumber;
    NSString *tempUnitNumber;
    NSString *tempEditionNumber;
    NSString *tempLocationName;
    NSString *deleteSQL;
    sqlite3_stmt *statement, *statement2;
    const char *delete_stmt;
    
    NSString *selectSQL = [NSString stringWithFormat: @"SELECT blkNumber, storeyNumber, unitNumber, editionNumber, locationName FROM InternalFinishesSummaryDetails WHERE ID=%i", sampleID];
    const char *query_stmt = [selectSQL UTF8String];
    
    if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_ROW)
        {
            tempBlkNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
            tempStoreyNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
            tempUnitNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
            tempEditionNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
            tempLocationName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
            
            deleteSQL = [NSString stringWithFormat: @"DELETE FROM InternalFinishesDetails WHERE blkNumber='%@' and storeyNumber='%@' and unitNumber='%@' and editionNumber='%@' and  locationName='%@';", tempBlkNumber, tempStoreyNumber, tempUnitNumber, tempEditionNumber, tempLocationName];
            delete_stmt = [deleteSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, delete_stmt, -1, &statement2, NULL);
            if (sqlite3_step(statement2) == SQLITE_DONE) {}
            sqlite3_finalize(statement2);
        }
    }
    //NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
    sqlite3_finalize(statement);
    
    deleteSQL = [NSString stringWithFormat: @"DELETE FROM InternalFinishesSummaryDetails WHERE ID=%i;", sampleID];
    delete_stmt = [deleteSQL UTF8String];
    sqlite3_prepare_v2(CONQUASDB, delete_stmt, -1, &statement, NULL);
    if (sqlite3_step(statement) == SQLITE_DONE) {}
    sqlite3_finalize(statement);
    
    deleteSQL = [NSString stringWithFormat: @"DELETE FROM InternalFinishesSummaryDetails WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and editionNumber=\"%@\" and locationName=\"-Whole Unit-\";", tempBlkNumber, tempStoreyNumber, tempUnitNumber, tempEditionNumber];
    delete_stmt = [deleteSQL UTF8String];
    sqlite3_prepare_v2(CONQUASDB, delete_stmt, -1, &statement, NULL);
    if (sqlite3_step(statement) == SQLITE_DONE) {}
    sqlite3_finalize(statement);
    
    [self retrieveSavedInformation:nil];

    
}

-(BOOL)isNumeric:(NSString *)strValue {
    NSScanner *ns = [NSScanner scannerWithString:strValue];
    float the_value;
    if ( [ns scanFloat:&the_value] )
    {
        return TRUE;
    }
    else {
        return FALSE;
    }
}
@end



@implementation UIViewController (NumPadReturn)

//-(void) viewDidLoad{
// add observer for the respective notifications (depending on the os version)
//if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
//    [[NSNotificationCenter defaultCenter] addObserver:self 
//                                         selector:@selector(keyboardDidShow:) 
//                                             name:UIKeyboardDidShowNotification 
//                                           object:nil];     
//} else {
//    [[NSNotificationCenter defaultCenter] addObserver:self 
//                                         selector:@selector(keyboardWillShow:) 
//                                             name:UIKeyboardWillShowNotification 
//                                           object:nil];
//}

//}


- (void)keyboardWillShow:(NSNotification *)note {
    // if clause is just an additional precaution, you could also dismiss it
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 3.2) {
        [self addButtonToKeyboard];
    }
}

- (void)keyboardDidShow:(NSNotification *)note {
    // if clause is just an additional precaution, you could also dismiss it
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
        [self addButtonToKeyboard];
    }
}

- (void)addButtonToKeyboard {
    // create custom button
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.frame = CGRectMake(0, 163, 106, 53);
    doneButton.adjustsImageWhenHighlighted = NO;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.0) {
        [doneButton setImage:[UIImage imageNamed:@"btnDoneUp.png"] forState:UIControlStateNormal];
        [doneButton setImage:[UIImage imageNamed:@"btnDoneDown.png"] forState:UIControlStateHighlighted];
    } else {        
        [doneButton setImage:[UIImage imageNamed:@"btnDoneUp.png"] forState:UIControlStateNormal];
        [doneButton setImage:[UIImage imageNamed:@"btnDoneDown.png"] forState:UIControlStateHighlighted];
    }
    [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
    // locate keyboard view
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    UIView* keyboard;
    for(int i=0; i<[tempWindow.subviews count]; i++) {
        keyboard = [tempWindow.subviews objectAtIndex:i];
        // keyboard found, add the button
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
            if([[keyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
                [keyboard addSubview:doneButton];
        } else {
            if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
                [keyboard addSubview:doneButton];
        }
    }
}

- (void)doneButton:(id)sender {
    NSLog(@"doneButton");
    [self.view endEditing:TRUE];
}
@end
