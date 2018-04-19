//
//  CheckBox.m
//  Conquas
//
//  Created by Aparna Reddy Challa on 03/09/12.
//  Copyright (c) 2012 MobTwo Pte Ltd. All rights reserved.
//

#import "CheckBox.h"


@interface CheckBox ()
{
    NSMutableArray *stateNames;
    NSMutableArray *stateNamesEdition;
    NSMutableArray *radioNames;
    NSMutableArray *radioNamesPrevState;
    NSMutableArray *ticksTotal;
    NSMutableArray *checksTotal;
    NSArray *pageNo;
    int prevSelectedPage, isUpdate;
    int pgCount,pgMax,deleteID;
    NSString *selectedPage;
    NSString *origBlock,*origStorey,*origUnit,*origProjectID,*origProjectName;
    BOOL keyboardIsShowing;
    int totalEntry,origPageNumber;
    
}
@end

@implementation CheckBox
@synthesize showPicker;
@synthesize scoreLabel;
@synthesize txtLocation4;
@synthesize searchButton;
@synthesize nextButtonO;
@synthesize viewDatadb2;
@synthesize viewDatadb1;
@synthesize scrolDatadb2;
@synthesize scrolDatadb1;
@synthesize mainView2;
@synthesize mainView1;
@synthesize mainView;
@synthesize pageView;
@synthesize viewPages;
@synthesize scrolPages;
@synthesize secondPicker;
@synthesize showPickerData;
@synthesize showScoreData;
@synthesize showPageNumber;
@dynamic singlePicker;
@synthesize label35;
@synthesize label34;
@synthesize label33;
@synthesize label32;
@synthesize label31;
@synthesize label30;
@synthesize label29;
@synthesize label28;
@synthesize label27;
@synthesize label26;
@synthesize label25;
@synthesize label24;
@synthesize label23;
@synthesize label22;
@synthesize label21;
@synthesize label20;
@synthesize label19;
@synthesize label18;
@synthesize label17;
@synthesize label16;
@synthesize label15;
@synthesize label14;
@synthesize label13;
@synthesize label12;
@synthesize label11;
@synthesize label10;
@synthesize label9;
@synthesize label8;
@synthesize label7;
@synthesize label6;
@synthesize label5;
@synthesize label4;
@synthesize label3;
@synthesize label2;
@synthesize scroller;
@synthesize scroller1;
@synthesize txtUnit1;
@synthesize txtProjectID;
@synthesize txtProjectName;
@synthesize txtStorey1;
@synthesize txtBlock1;
@synthesize txtLocation1;
@synthesize txtLocation2;
@synthesize txtLocation3;
@synthesize loadSavedBtn;
@synthesize prevsButton;
@synthesize nextButtun;
@synthesize pickerData;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self==nil) {
        return nil;
        // Custom initialization
    }
    return self;
}

- (void) showScore
{
    NSFileManager *filemgr = [NSFileManager defaultManager];
    float score = 0.0;
    
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Access Database" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    } else {
        const char *charDBPath = [databasePath UTF8String];
        sqlite3_stmt *statement;
        NSString *bnum = txtBlock1.text;
        if (sqlite3_open(charDBPath, &CONQUASDB) == SQLITE_OK) {
            
            
            
            NSString *selectSQL = [NSString stringWithFormat: @"SELECT sum(score),count(id) FROM InternalFinishesDetailsNew WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and saved=0",bnum, txtStorey1.text,txtUnit1.text];
            
            
            const char *query_stmt = [selectSQL UTF8String];
            float finalScoreValue=0;
            int locationsSaved=0;
            
            sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
            
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                locationsSaved = sqlite3_column_int(statement, 1);
                if(locationsSaved!=0)
                    finalScoreValue = [[[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)] floatValue];
            }
            
            if (locationsSaved>0)
                score = finalScoreValue/locationsSaved;
            else
                score = 0;
            
        }
        sqlite3_finalize(statement);
    }
    
    
    
    
    
    
    
    showScoreData.text=[NSString stringWithFormat:@"%1.2f", score];
    
    sqlite3_close(CONQUASDB);
    
    
}


- (float) calculateMainScore:(int) edition:(int)location
{
    
    
    int ticks=0,checks=0,j=0;
    float floorTotalTicks, floorTotalChecks, wallTotalTicks, wallTotalChecks, ceilingTotalTicks, ceilingTotalChecks, doorTotalTicks, doorTotalChecks, windowTotalTicks, windowTotalChecks, componentTotalTicks, componentTotalChecks, METotalTicks, METotalChecks;
    
    NSArray *individualWeightage;
    NSArray *individualComponentWeightage;
    
    if(edition==7)
    {
        individualWeightage = [NSArray arrayWithObjects:@"6.6",@"3.3",@"6.6",@"2.2",@"3.3",@"2.5",@"1.5",@"3.0",@"1.5",@"1.5",@"0.9",@"0.9",@"1.8",@"1.5",@"0.9",@"2.0",@"2.0",@"6",@"6",@"4",@"1",@"1",@"2",@"3",@"3",@"2.2",@"2.2",@"6.6",@"6.6",@"4.4",@"1",@"2",@"3",@"3",@"1", nil];
        individualComponentWeightage = [NSArray arrayWithObjects:@"22",@"10",@"6",@"20",@"10",@"22",@"10", nil];
    }
    if (edition==8) {
        individualWeightage = [NSArray arrayWithObjects:@"4.8",@"2.8",@"4.8",@"1.6",@"2",@"2.8",@"2.8",@"4.8",@"2.8",@"2.8",@"0.9",@"0.9",@"1.8",@"1.5",@"0.9",@"0.6",@"0.6",@"1.8",@"1.8",@"1.2",@"0.6",@"0.6",@"1.2",@"1.8",@"1.8",@"0.6",@"0.6",@"1.8",@"1.8",@"1.2",@"1.5",@"3",@"4.5",@"4.5",@"1.5", nil];
        individualComponentWeightage = [NSArray arrayWithObjects:@"16",@"16",@"6",@"6",@"6",@"6",@"15", nil];
        
    }
    NSMutableArray *individualComponentScore = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    
    
    
    NSMutableArray *individualScore = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    
    NSMutableArray *componentTicksTotal = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",nil];
    NSMutableArray *componentChecksTotal = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",nil];
    
    int i;
    for(i=35*(location-1);i<35*location;i=i+5)
    {
        while(j<5)
        {
            ticks=ticks+[[ticksTotal objectAtIndex:i+j] intValue];
            checks=checks+[[checksTotal objectAtIndex:i+j] intValue];
            j++;
            
            
        }
        
        [componentTicksTotal replaceObjectAtIndex:((i-(35*(location-1)))/5) withObject:[NSString stringWithFormat:@"%i", ticks]];
        [componentChecksTotal replaceObjectAtIndex:((i-(35*(location-1)))/5) withObject:[NSString stringWithFormat:@"%i", checks]];
        
        
        ticks=0;
        checks=0;
        j=0;
    }
    
    floorTotalTicks = [[componentTicksTotal objectAtIndex:0] floatValue];
    wallTotalTicks = [[componentTicksTotal objectAtIndex:1] floatValue];
    ceilingTotalTicks = [[componentTicksTotal objectAtIndex:2] floatValue];
    doorTotalTicks = [[componentTicksTotal objectAtIndex:3] floatValue];
    windowTotalTicks = [[componentTicksTotal objectAtIndex:4] floatValue];
    componentTotalTicks = [[componentTicksTotal objectAtIndex:5] floatValue];
    METotalTicks = [[componentTicksTotal objectAtIndex:6] floatValue];
    
    floorTotalChecks = [[componentChecksTotal objectAtIndex:0] floatValue];
    wallTotalChecks = [[componentChecksTotal objectAtIndex:1] floatValue];
    ceilingTotalChecks = [[componentChecksTotal objectAtIndex:2] floatValue];
    doorTotalChecks = [[componentChecksTotal objectAtIndex:3] floatValue];
    windowTotalChecks = [[componentChecksTotal objectAtIndex:4] floatValue];
    componentTotalChecks = [[componentChecksTotal objectAtIndex:5] floatValue];
    METotalChecks = [[componentChecksTotal objectAtIndex:6] floatValue];
    
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
    float tempScore = 0;
    int loopCount=0;
    
    float weightageTotal = 0;
    float scoreTotal = 0;
    j=0;
    
    float totalWeightage = 0;
    float totalScore = 0;
    
    if ((edition==7)||(edition==8)) {
        
        
        int k=35*(location-1);
        
        for(i=35*(location-1);i<35*location;i++)
        {
            
            if ([[checksTotal objectAtIndex:k] intValue]!=0) {
                float val = ([[ticksTotal objectAtIndex:k] floatValue] / [[checksTotal objectAtIndex:k]floatValue]) * [[individualWeightage objectAtIndex:(i%35)] floatValue];
                [individualScore replaceObjectAtIndex:(i%35) withObject:[NSString stringWithFormat:@"%f", val]];
            }
            k++;
        }
        k=0;
        for(i=140*(location-1);i<140*location;i=i+20)
        {
            while(j%5<5)
            {
                if ([[checksTotal objectAtIndex:j+(35*(location-1))] intValue]>0) {
                    weightageTotal = weightageTotal + [[individualWeightage objectAtIndex:j] floatValue];
                    scoreTotal = scoreTotal + [[individualScore objectAtIndex:j] floatValue];
                }
                
                j++;
                loopCount++;
                if (loopCount==5)
                {
                    loopCount=0;
                    break;
                }
            }
            if(weightageTotal!=0)
            {
                tempScore = (scoreTotal/weightageTotal)*[[individualComponentWeightage objectAtIndex:k] floatValue];
                tempScore = round( tempScore * 100.0 ) / 100.0;
                [individualComponentScore replaceObjectAtIndex:k withObject:[NSString stringWithFormat:@"%f", tempScore]];
                
            }
            k++;
            weightageTotal=0;
            scoreTotal=0;
            
        }
        for (int i=0;i<7;i++)
        {
            if([[componentChecksTotal objectAtIndex:i] intValue]>0)
            {
                totalScore = [[individualComponentScore objectAtIndex:i] floatValue] + totalScore;
                totalWeightage = [[individualComponentWeightage objectAtIndex:i] floatValue] + totalWeightage;
            }
        }
        
    }
    
    else if (edition==6) {
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
        
        totalScore = floorScore+wallScore+ceilingScore+doorScore+windowScore+componentScore+MEScore;
        totalWeightage = floorWeightage+wallWeightage+ceilingWeightage+doorWeightage+windowWeightage+componentWeightage+MEWeightage;
        
    }
    
    
    float sampleScore = 0;
    if (totalWeightage!=0)
    {
        sampleScore = (totalScore/totalWeightage)*100;
        sampleScore = round( sampleScore * 100.0 ) / 100.0;
        
    }
    
    return sampleScore;
    
}

- (float) calculateScore:(int) edition:(int)location
{
    int ticks=0,checks=0,j=0;
    for (int i=0;i<280;i=i+2)
    {
        while(j<2)
        {
            if([[stateNames objectAtIndex:i+j] intValue]==1)
            {
                ticks++;checks++;
            }
            else if ([[stateNames objectAtIndex:i+j] intValue]==2)
                checks++;
            j++;
        }
        [ticksTotal replaceObjectAtIndex:i/2 withObject:[NSString stringWithFormat:@"%d", ticks]];
        [checksTotal replaceObjectAtIndex:i/2 withObject:[NSString stringWithFormat:@"%d", checks]];
        ticks=0;
        checks=0;
        j=0;
        
    }
    float score=0.0;
    score=[self calculateMainScore:edition :location];
    return score;
}

- (float) calculateEditionScore:(int) editionNumber: (int)tempID: (int)locationNumber
{
    int ticks=0,checks=0,j=0;
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Access Database" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    } else {
        sqlite3_stmt *statement3;
        //if (sqlite3_open(charDBPath, &CONQUASDB) == SQLITE_OK) {
        
        
        NSString *selectSQL = [NSString stringWithFormat: @"SELECT tagValue,checkState FROM InternalFinishesSummaryDetailsNew WHERE IFD_Fkey=\"%i\" and saved=0",tempID];
        const char *query_stmt = [selectSQL UTF8String];
        int tagValue;
        int checkState;
        sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement3, NULL);
        while (sqlite3_step(statement3) == SQLITE_ROW)
        {
            tagValue = sqlite3_column_int(statement3, 0);
            checkState = sqlite3_column_int(statement3, 1);
            [stateNamesEdition replaceObjectAtIndex:(tagValue-1) withObject:[NSString stringWithFormat:@"%d", checkState]];
        }
        sqlite3_finalize(statement3);
    }
    
    //}
    
    //sqlite3_close(CONQUASDB);
    
    
    for (int i=0;i<280;i=i+2)
    {
        while(j<2)
        {
            if([[stateNamesEdition objectAtIndex:i+j] intValue]==1)
            {
                ticks++;checks++;
            }
            else if ([[stateNamesEdition objectAtIndex:i+j] intValue]==2)
                checks++;
            j++;
        }
        [ticksTotal replaceObjectAtIndex:i/2 withObject:[NSString stringWithFormat:@"%d", ticks]];
        [checksTotal replaceObjectAtIndex:i/2 withObject:[NSString stringWithFormat:@"%d", checks]];
        ticks=0;
        checks=0;
        j=0;
        
    }
    
    float score=0.0;
    if(editionNumber==504)
        editionNumber=6;
    else if(editionNumber==505)
        editionNumber=7;
    else if(editionNumber==506)
        editionNumber=8;
    
    
    score = [self calculateMainScore:editionNumber :locationNumber];
    for(int i=0;i<70;i++)
    {
        [stateNamesEdition replaceObjectAtIndex:i withObject:@"0"];
    }
    
    return score;
    
}

- (void)loadPicker:(id)sender
{
    
    NSMutableArray *pvData;
    NSString *tempBlockNumber;
    NSString *tempStoreyNumber;
    NSString *tempUnitNumber;
    NSString *tempEditionNumber;
    NSString *displayString;
    NSString *tempScore;
    NSString *tempID;
    int rownum=0;
    int countRow=0;
    int countRow1=0;
    int countRow2=0;
    int countRow3=0;
    int i=0;
    //UIButton *nxtBtn=(UIButton*)sender;
    int tag1=(int)[sender tag];
    if (pgCount>0) tag1=pgCount;
    for (i=0;i<10;i++)
    {
        
        UILabel *lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(0, 5 + (35 * countRow2) + (5 * countRow2), 400, 21)];
        lblTemp.text = [NSString stringWithFormat: @" %@           %@          %@       %@ ",@"" ,@"" ,@"" ,@"" ];
        lblTemp.adjustsFontSizeToFitWidth = YES;
        [scrolDatadb1 addSubview:lblTemp];
        
        
        UIButton *btnTempEdit = [UIButton buttonWithType:UIButtonTypeCustom];
        btnTempEdit.frame = CGRectMake(225, (35 * countRow2) + (5 * countRow2), 40, 35);
        [[btnTempEdit layer] setBorderWidth:4.0f];
        [btnTempEdit.layer setBorderColor:[[UIColor whiteColor] CGColor]];
        [scrolDatadb1 addSubview:btnTempEdit];
        
        
        UIButton *btnTempDelete = [UIButton buttonWithType:UIButtonTypeCustom];
        btnTempDelete.frame = CGRectMake(282, (35 * countRow2) + (5 * countRow2), 40, 35);
        [[btnTempDelete layer] setBorderWidth:4.0f];
        [btnTempDelete.layer setBorderColor:[[UIColor whiteColor] CGColor]];
        [scrolDatadb1 addSubview:btnTempDelete];
        
        
        countRow2 = countRow2 + 1;
        
    }
    countRow=0;
    i=0;
    for (i=10;i<20;i++)
    {
        
        UILabel *lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(0, 5 + (35 * countRow3) + (5 * countRow3), 400, 21)];
        lblTemp.text = [NSString stringWithFormat: @" %@           %@          %@       %@ ",@"" ,@"" ,@"" ,@"" ];
        lblTemp.adjustsFontSizeToFitWidth = YES;
        [scrolDatadb2 addSubview:lblTemp];
        
        
        UIButton *btnTempEdit = [UIButton buttonWithType:UIButtonTypeCustom];
        btnTempEdit.frame = CGRectMake(225, (35 * countRow3) + (5 * countRow3), 40, 35);
        [[btnTempEdit layer] setBorderWidth:4.0f];
        [btnTempEdit.layer setBorderColor:[[UIColor whiteColor] CGColor]];
        [scrolDatadb2 addSubview:btnTempEdit];
        
        
        UIButton *btnTempDelete = [UIButton buttonWithType:UIButtonTypeCustom];
        btnTempDelete.frame = CGRectMake(282, (35 * countRow3) + (5 * countRow3), 40, 35);
        [[btnTempDelete layer] setBorderWidth:4.0f];
        [btnTempDelete.layer setBorderColor:[[UIColor whiteColor] CGColor]];
        [scrolDatadb2 addSubview:btnTempDelete];
        
        
        countRow3 = countRow3 + 1;
        
    }
    countRow1=0;
    i=0;
    countRow2=0;
    countRow3=0;
    
    pvData = [[NSMutableArray alloc] initWithObjects:@"", nil];
    
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Access Database" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    } else {
        const char *charDBPath = [databasePath UTF8String];
        sqlite3_stmt *statement;
        if (sqlite3_open(charDBPath, &CONQUASDB) == SQLITE_OK) {
            
            //comment - Retrieve Individual Samples Information.
            
            /* NSString *selectSQL =[NSString stringWithFormat:@"SELECT   id,blkNumber, storeyNumber, unitNumber, editionNumber, sum(score)/count(id) FROM InternalFinishesDetailsNew where saved=\"%i\" GROUP BY blkNumber,storeyNumber,unitNumber ORDER BY blkNumber, storeyNumber, unitNumber ",1];*/
            NSString *selectSQL =[NSString stringWithFormat:@"SELECT id,blkNumber, storeyNumber, unitNumber,editionNumber, sum(score)/count(id)  FROM InternalFinishesDetailsNew where blkNumber like \'%%%@%%\' and storeyNumber like \'%%%@%%\' and unitNumber like \'%%%@%%\' and saved=%i and projectID like \'%%%@%%\' and projectName like \'%%%@%%\' GROUP BY blkNumber,storeyNumber,unitNumber ORDER BY blkNumber, storeyNumber, unitNumber",txtBlock1.text, txtStorey1.text,txtUnit1.text,1,txtProjectID.text,txtProjectName.text];
            NSLog(@"load query search=%@",selectSQL);
            const char *query_stmt = [selectSQL UTF8String];
            
            if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                while (sqlite3_step(statement) == SQLITE_ROW)
                {
                    
                    tempID = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                    tempBlockNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                    tempStoreyNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                    tempUnitNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                    tempEditionNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                    tempScore  = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                    //tempLocation = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                    displayString = [[NSString alloc] initWithFormat:@"%@-%@-%@-%@", tempBlockNumber,tempStoreyNumber,tempUnitNumber, tempScore];
                    //[pvData addObject:displayString];
                    //stringID =  [NSString stringWithFormat:@"%d", tempID];
                    //[pvID addObject:stringID];
                    rownum++;
                    
                    
                    if(i>=tag1*10 && i<tag1*10+10)
                    {
                        
                        UILabel *lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(0, 5 + (35 * countRow) + (5 * countRow), 400, 21)];
                        //lblTemp.text = [NSString stringWithFormat: @" %@        %@        %@     %1.2f ", tempBlockNumber, tempStoreyNumber, tempUnitNumber, [tempScore floatValue]];
                        lblTemp.text = [NSString stringWithFormat: @" %@", tempBlockNumber];
                        
                        lblTemp.adjustsFontSizeToFitWidth = YES;
                        [scrolDatadb1 addSubview:lblTemp];
                        
                        lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(55, 5 + (35 * countRow) + (5 * countRow), 400, 21)];
                        //lblTemp.text = [NSString stringWithFormat: @" %@        %@        %@     %1.2f ", tempBlockNumber, tempStoreyNumber, tempUnitNumber, [tempScore floatValue]];
                        lblTemp.text = [NSString stringWithFormat: @" %@", tempStoreyNumber];
                        lblTemp.adjustsFontSizeToFitWidth = YES;
                        [scrolDatadb1 addSubview:lblTemp];
                        
                        lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(110, 5 + (35 * countRow) + (5 * countRow), 400, 21)];
                        lblTemp.text = [NSString stringWithFormat: @" %@", tempUnitNumber];
                        lblTemp.adjustsFontSizeToFitWidth = YES;
                        [scrolDatadb1 addSubview:lblTemp];
                        
                        lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(160, 5 + (35 * countRow) + (5 * countRow), 400, 21)];
                        lblTemp.text = [NSString stringWithFormat: @" %1.2f", [tempScore floatValue]];
                        lblTemp.adjustsFontSizeToFitWidth = YES;
                        [scrolDatadb1 addSubview:lblTemp];
                        
                        
                        UIButton *btnTempEdit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                        [btnTempEdit addTarget:self action:@selector(loadSavedInformationNew:) forControlEvents:UIControlEventTouchUpInside];
                        [btnTempEdit setTitle:@"Edit" forState:UIControlStateNormal];
                        btnTempEdit.tag = [tempID intValue]+10000;
                        btnTempEdit.frame = CGRectMake(225, (35 * countRow) + (5 * countRow), 40, 35);
                        [scrolDatadb1 addSubview:btnTempEdit];
                        
                        UIButton *btnTempDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                        [btnTempDelete addTarget:self action:@selector(deleteButton:) forControlEvents:UIControlEventTouchUpInside];
                        [btnTempDelete setTitle:@"Del" forState:UIControlStateNormal];
                        btnTempDelete.tag = [tempID intValue]+10000;
                        btnTempDelete.frame = CGRectMake(282, (35 * countRow) + (5 * countRow), 40, 35);
                        [scrolDatadb1 addSubview:btnTempDelete];
                        
                        countRow = countRow + 1;
                        
                        
                    }
                    
                    if(i>=tag1*10+10 && i<tag1*10+20)
                    {
                        UILabel *lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(0, 5 + (35 * countRow1) + (5 * countRow1), 400, 21)];
                        //lblTemp.text = [NSString stringWithFormat: @" %@        %@        %@     %1.2f ", tempBlockNumber, tempStoreyNumber, tempUnitNumber, [tempScore floatValue]];
                        lblTemp.text = [NSString stringWithFormat: @" %@", tempBlockNumber];
                        
                        lblTemp.adjustsFontSizeToFitWidth = YES;
                        [scrolDatadb2 addSubview:lblTemp];
                        
                        lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(55, 5 + (35 * countRow1) + (5 * countRow1), 400, 21)];
                        //lblTemp.text = [NSString stringWithFormat: @" %@        %@        %@     %1.2f ", tempBlockNumber, tempStoreyNumber, tempUnitNumber, [tempScore floatValue]];
                        lblTemp.text = [NSString stringWithFormat: @" %@", tempStoreyNumber];
                        lblTemp.adjustsFontSizeToFitWidth = YES;
                        [scrolDatadb2 addSubview:lblTemp];
                        
                        lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(110, 5 + (35 * countRow1) + (5 * countRow1), 400, 21)];
                        lblTemp.text = [NSString stringWithFormat: @" %@", tempUnitNumber];
                        lblTemp.adjustsFontSizeToFitWidth = YES;
                        [scrolDatadb2 addSubview:lblTemp];
                        
                        lblTemp = [[UILabel alloc] initWithFrame:CGRectMake(160, 5 + (35 * countRow1) + (5 * countRow1), 400, 21)];
                        lblTemp.text = [NSString stringWithFormat: @" %1.2f", [tempScore floatValue]];
                        lblTemp.adjustsFontSizeToFitWidth = YES;
                        [scrolDatadb2 addSubview:lblTemp];
                        
                        
                        
                        
                        UIButton *btnTempEdit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                        [btnTempEdit addTarget:self action:@selector(loadSavedInformationNew:) forControlEvents:UIControlEventTouchUpInside];
                        [btnTempEdit setTitle:@"Edit" forState:UIControlStateNormal];
                        btnTempEdit.tag = [tempID intValue]+10000;
                        btnTempEdit.frame = CGRectMake(225, (35 * countRow1) + (5 * countRow1), 40, 35);
                        [scrolDatadb2 addSubview:btnTempEdit];
                        
                        UIButton *btnTempDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                        [btnTempDelete addTarget:self action:@selector(deleteButton:) forControlEvents:UIControlEventTouchUpInside];
                        [btnTempDelete setTitle:@"Del" forState:UIControlStateNormal];
                        btnTempDelete.tag = [tempID intValue]+10000;
                        btnTempDelete.frame = CGRectMake(282, (35 * countRow1) + (5 * countRow1), 40, 35);
                        [scrolDatadb2 addSubview:btnTempDelete];
                        
                        countRow1 = countRow1 + 1;
                    }
                    i++;
                    
                    
                    //countRow = countRow + 1;
                }
                selectSQL =[NSString stringWithFormat:@"SELECT count(blkNumber)/10  FROM (select distinct blkNumber, storeyNumber, unitNumber from InternalFinishesDetailsNew where blkNumber like \'%%%@%%\' and storeyNumber like \'%%%@%%\' and unitNumber like \'%%%@%%\' and saved=%i and projectID like \'%%%@%%\' and projectName like \'%%%@%%\' GROUP BY blkNumber,storeyNumber,unitNumber) ORDER BY blkNumber, storeyNumber, unitNumber",txtBlock1.text, txtStorey1.text,txtUnit1.text,1,txtProjectID.text,txtProjectName.text];
                query_stmt = [selectSQL UTF8String];
                
                if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                    while (sqlite3_step(statement) == SQLITE_ROW)
                    {
                        pgMax  = [[[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)] intValue];
                    }
                }
                
            }
            else {
                NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
            }
            
            
            
            sqlite3_finalize(statement);
            
        }
        else {
            NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
        }
        
        
        
        //sqlite3_finalize(statement);
        
    }
    sqlite3_close(CONQUASDB);
    
    [secondPicker selectRow: 0 inComponent:0 animated:NO];
    showPickerData.text=@"1";
    //loadSavedBtn.hidden=NO;
    showPageNumber.hidden=NO;
    showPageNumber.text = [NSString stringWithFormat: @"%i / %i", (pgCount/2)+1,(pgMax/2)+1];
    
}

- (void)duplicatesaved:(id)sender
{
    NSString *tempBlkNumber, *tempStoreyNumber, *tempUnitNumber, *tempLocationName, *tempEditionNumber,*tempProjectID,*tempProjectName;
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Access Database" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    } else {
        const char *charDBPath = [databasePath UTF8String];
        sqlite3_stmt *statement_dupSaved,*statement1_dupSaved,*statement2_dupSaved;
        if (sqlite3_open(charDBPath, &CONQUASDB) == SQLITE_OK) {
            NSString *selectSQL;
            NSString *sqlCommand,*sqlCommand1;
            const char *query_stmt,*query_stmt1,*query_stmt2;
            int tempID;
            
            selectSQL = [NSString stringWithFormat: @"SELECT blkNumber, storeyNumber, unitNumber,score FROM InternalFinishesDetailsNew WHERE ID=%i", [sender tag]-10000];
            query_stmt = [selectSQL UTF8String];
            
            if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement_dupSaved, NULL) == SQLITE_OK) {
                
                if(sqlite3_step(statement_dupSaved) == SQLITE_ROW)
                {
                    
                    tempBlkNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_dupSaved, 0)];
                    tempStoreyNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_dupSaved, 1)];
                    tempUnitNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_dupSaved, 2)];
                    
                }
            }
            sqlite3_finalize(statement_dupSaved);
            
            
            selectSQL = [NSString stringWithFormat: @"SELECT ID, locationName,editionNumber,score,pageNumber,locationNumber,projectID,projectName FROM InternalFinishesDetailsNew WHERE saved=1 and blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\"",tempBlkNumber,tempStoreyNumber,tempUnitNumber];
            query_stmt = [selectSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement_dupSaved, NULL);
            float tempScore;
            int tempPgNumber,tempLocationNumber;
            
            while (sqlite3_step(statement_dupSaved) == SQLITE_ROW)
            {
                tempID = sqlite3_column_int(statement_dupSaved, 0);
                tempLocationName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_dupSaved, 1)];
                tempEditionNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_dupSaved, 2)];
                tempScore = [[[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_dupSaved, 3)] floatValue];
                tempPgNumber = sqlite3_column_int(statement_dupSaved, 4);
                tempLocationNumber = sqlite3_column_int(statement_dupSaved, 5);
                tempProjectID = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_dupSaved, 6)];
                tempProjectName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_dupSaved, 7)];
                
                sqlCommand = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetailsNew(blkNumber,storeyNumber,unitNumber,locationName,editionNumber,score,pageNumber,locationNumber,saved,projectID,projectName) values (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%1.2f\", \"%i\", \"%i\", \"%i\", \"%@\", \"%@\")", tempBlkNumber, tempStoreyNumber, tempUnitNumber, tempLocationName, tempEditionNumber, tempScore, tempPgNumber, tempLocationNumber,0,tempProjectID,tempProjectName];
                query_stmt1 = [sqlCommand UTF8String];
                sqlite3_prepare_v2(CONQUASDB, query_stmt1, -1, &statement1_dupSaved, NULL);
                if (sqlite3_step(statement1_dupSaved) == SQLITE_DONE) {
                }
                else {
                    NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                }
                sqlite3_finalize(statement1_dupSaved);
                int IFD_ID = sqlite3_last_insert_rowid(CONQUASDB);
                
                NSLog(@"IFDID1:%i",IFD_ID);
                
                sqlCommand = [NSString stringWithFormat: @"SELECT tagValue, checkState FROM InternalFinishesSummaryDetailsNew WHERE IFD_Fkey =\"%i\"", tempID];
                query_stmt1 = [sqlCommand UTF8String];
                sqlite3_prepare_v2(CONQUASDB, query_stmt1, -1, &statement1_dupSaved, NULL);
                int tempTagValue, tempCheckState;
                while (sqlite3_step(statement1_dupSaved) == SQLITE_ROW)
                {
                    tempTagValue = sqlite3_column_int(statement1_dupSaved, 0);
                    tempCheckState = sqlite3_column_int(statement1_dupSaved, 1);
                    sqlCommand1 = [NSString stringWithFormat: @"INSERT INTO InternalFinishesSummaryDetailsNew(IFD_Fkey, tagValue, checkState, saved) values (\"%i\", \"%i\", \"%i\", \"%i\")", IFD_ID, tempTagValue, tempCheckState,0];
                    query_stmt2 = [sqlCommand1 UTF8String];
                    sqlite3_prepare_v2(CONQUASDB, query_stmt2, -1, &statement2_dupSaved, NULL);
                    if (sqlite3_step(statement2_dupSaved) == SQLITE_DONE) { }
                    else {
                        NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                    }
                    sqlite3_finalize(statement2_dupSaved);
                    
                }
                sqlite3_finalize(statement1_dupSaved);
                
                
            }
            sqlite3_finalize(statement_dupSaved);
            
            
            //score = finalScoreValue/locationsSaved;
        }
        
    }
    sqlite3_close(CONQUASDB);
    
}

- (void)deleteUnsaved
{
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Access Database" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    } else {
        const char *charDBPath = [databasePath UTF8String];
        sqlite3_stmt *statement,*statement1;
        if (sqlite3_open(charDBPath, &CONQUASDB) == SQLITE_OK) {
            NSString *selectSQL = [NSString stringWithFormat: @"SELECT ID FROM InternalFinishesDetailsNew WHERE saved=0"];
            NSString *sqlCommand;
            const char *query_stmt = [selectSQL UTF8String];
            const char *query_stmt1;
            sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
            int tempID;
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                tempID = sqlite3_column_int(statement, 0);
                sqlCommand = [NSString stringWithFormat: @"DELETE FROM InternalFinishesDetailsNew WHERE id =\"%i\"", tempID];
                query_stmt1 = [sqlCommand UTF8String];
                sqlite3_prepare_v2(CONQUASDB, query_stmt1, -1, &statement1, NULL);
                if (sqlite3_step(statement1) == SQLITE_DONE) { }
                else {
                    NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                }
                sqlite3_finalize(statement1);
                sqlCommand = [NSString stringWithFormat: @"DELETE FROM InternalFinishesSummaryDetailsNew WHERE IFD_Fkey =\"%i\"", tempID];
                query_stmt1 = [sqlCommand UTF8String];
                sqlite3_prepare_v2(CONQUASDB, query_stmt1, -1, &statement1, NULL);
                if (sqlite3_step(statement1) == SQLITE_DONE) { }
                else {
                    NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                }
                sqlite3_finalize(statement1);
                
                
            }
            sqlite3_finalize(statement);
            
        }
        
    }
    sqlite3_close(CONQUASDB);
    
}

-(void)dismissKeyboard {
    [txtBlock1 resignFirstResponder];
    [txtUnit1 resignFirstResponder];
    [txtStorey1 resignFirstResponder];
    [txtProjectID resignFirstResponder];
    [txtProjectName resignFirstResponder];
    [txtLocation1 resignFirstResponder];
    [txtLocation2 resignFirstResponder];
    [txtLocation3 resignFirstResponder];
    [txtLocation4 resignFirstResponder];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    pgCount = 0;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    //Hiding the picker and view when loaded
    singlePicker.hidden=YES;
    secondPicker.hidden=NO;
    mainView2.hidden=YES;
    searchButton.hidden=YES;
    
    
    scroller.contentSize = CGSizeMake(kDefaultGraphWidth, kGraphHeight);
    scroller1.contentSize = CGSizeMake(kDefaultGraphWidth, kGraphHeight);
    
    //Transform the label
    
    label1.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label2.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label3.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label4.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label5.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label6.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label7.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label8.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label9.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label10.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label11.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label12.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label13.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label14.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label15.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label16.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label17.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label18.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label19.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label20.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label21.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label22.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label23.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label24.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label25.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label26.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label27.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label28.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label29.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label30.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label31.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label32.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label33.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label34.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    label35.transform = CGAffineTransformMakeRotation (3.14+(3.14/2));
    
    
    //assigning datasource and delegate for picker
    
    singlePicker.dataSource=self;
    singlePicker.delegate=self;
    selectedPage = @"1";
    secondPicker.dataSource=self;
    secondPicker.delegate=self;
    
    //comment - Prepare The Database & Tables Start.
    NSString *docsDir;
    NSArray *dirPaths;
    
    
    
    pageNo=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20", nil];
    
    
    //int stateNames[4] = {0,0,0,0};
    stateNames = [NSMutableArray arrayWithObjects: @"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", @"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", @"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",
                  nil];
    
    stateNamesEdition = [NSMutableArray arrayWithObjects: @"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"e0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", @"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", @"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",
                         nil];
    
    
    radioNames = [NSMutableArray arrayWithObjects: @"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    radioNamesPrevState = [NSMutableArray arrayWithObjects: @"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    
    ticksTotal = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    
    checksTotal = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    
    
    
    
    UIButton *ui;
    ui = (UIButton *)[self.view viewWithTag:505];
    [ui setImage:[UIImage imageNamed:@"radio2.png"] forState:UIControlStateNormal];
    [radioNames replaceObjectAtIndex:4 withObject:@"1"];
    
    totalEntry=0;
    
    
    
    
    /*ui = (UIButton *)[self.view viewWithTag:504];
     [ui setImage:[UIImage imageNamed:@"radio2.png"] forState:UIControlStateNormal];
     [radioNames replaceObjectAtIndex:3 withObject:@"1"];
     ui = (UIButton *)[self.view viewWithTag:507];
     [ui setImage:[UIImage imageNamed:@"radio2.png"] forState:UIControlStateNormal];
     [radioNames replaceObjectAtIndex:6 withObject:@"1"];
     ui = (UIButton *)[self.view viewWithTag:510];
     [ui setImage:[UIImage imageNamed:@"radio2.png"] forState:UIControlStateNormal];
     [radioNames replaceObjectAtIndex:9 withObject:@"1"];
     
     */
    
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"CONQUASDB.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        //creating tables
        if (sqlite3_open(dbpath, &CONQUASDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *strSQL = "CREATE TABLE IF NOT EXISTS InternalFinishesDetailsNew(ID INTEGER PRIMARY KEY AUTOINCREMENT, blkNumber TEXT, storeyNumber TEXT, unitNumber TEXT,  locationName TEXT,editionNumber TEXT, score FLOAT, pageNumber INTEGER, locationNumber INTEGER, saved INTEGER, projectID TEXT, projectName TEXT, creationDate datetime default current_timestamp)";
            
            if (sqlite3_exec(CONQUASDB, strSQL, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Create Table" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
                [alert show];
            }
            
            strSQL = "CREATE TABLE IF NOT EXISTS InternalFinishesSummaryDetailsNew(IFD_Fkey INTEGER, tagValue INTEGER,checkState INTEGER, saved INTEGER, FOREIGN KEY (IFD_Fkey) REFERENCES InternalFinishesDetailsNew(ID))";
            
            if (sqlite3_exec(CONQUASDB, strSQL, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Create Table" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
                [alert show];
            }
            
            sqlite3_close(CONQUASDB);
            
        } else {
            NSLog(@"could not prepare statement: \n");
            //comment - fail to open/create database.
        }
    }
    
    [self deleteUnsaved];
    
    [secondPicker selectRow: 0 inComponent:0 animated:NO];
    showPickerData.text=@"1";
    
    //[self loadPicker:nil];
    
    
    
    
    
}

- (void)viewDidUnload
{
    // Release any retained subviews of the main view.
    
    self.pickerData = nil;
    label1 = nil;
    [self setScroller1:nil];
    [self setLabel2:nil];
    [self setLabel3:nil];
    [self setLabel4:nil];
    [self setLabel5:nil];
    [self setLabel6:nil];
    [self setLabel7:nil];
    [self setLabel8:nil];
    [self setLabel9:nil];
    [self setLabel10:nil];
    [self setLabel11:nil];
    [self setLabel12:nil];
    [self setLabel13:nil];
    [self setLabel14:nil];
    [self setLabel15:nil];
    [self setLabel16:nil];
    [self setLabel17:nil];
    [self setLabel18:nil];
    [self setLabel19:nil];
    [self setLabel20:nil];
    [self setLabel21:nil];
    [self setLabel22:nil];
    [self setLabel23:nil];
    [self setLabel24:nil];
    [self setLabel25:nil];
    [self setLabel26:nil];
    [self setLabel27:nil];
    [self setLabel28:nil];
    [self setLabel29:nil];
    [self setLabel30:nil];
    [self setLabel31:nil];
    [self setLabel32:nil];
    [self setLabel33:nil];
    [self setLabel34:nil];
    [self setLabel35:nil];
    
    [self setSinglePicker:nil];
    
    [self setShowPickerData:nil];
    [self setShowScoreData:nil];
    
    [self setSecondPicker:nil];
    [self setScrolPages:nil];
    [self setViewPages:nil];
    [self setPageView:nil];
    [self setMainView1:nil];
    [self setMainView2:nil];
    [self setMainView:nil];
    [self setScrolDatadb1:nil];
    [self setScrolDatadb2:nil];
    [self setViewDatadb1:nil];
    [self setViewDatadb2:nil];
    [self setNextButtonO:nil];
    [self setSearchButton:nil];
    [self setTxtLocation4:nil];
    [self setScoreLabel:nil];
    [self setShowPicker:nil];
    [self setLoadSavedBtn:nil];
    [self setPrevsButton:nil];
    [self setNextButtun:nil];
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    //return YES;
    //return UIInterfaceOrientationLandscapeLeft;
}

- (BOOL)shouldAutorotate {
    
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

- (IBAction)nonLocationTextClick:(id)sender {
    [[NSNotificationCenter defaultCenter]
     removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
}


- (IBAction)locationClick:(id)sender {
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (IBAction)locationEditEnd:(id)sender {
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Access Database" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    } else {
        const char *charDBPath = [databasePath UTF8String];
        sqlite3_stmt *statement;
        NSString *selectSQL;
        const char *query_stmt;
        if (sqlite3_open(charDBPath, &CONQUASDB) == SQLITE_OK) {
            selectSQL = [NSString stringWithFormat: @"UPDATE InternalFinishesDetailsNew set locationName=\"%@\" WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and pageNumber=\"%i\" and saved=0 and locationNumber=1",txtLocation1.text,txtBlock1.text,txtStorey1.text,txtUnit1.text,[showPickerData.text intValue]];
            query_stmt = [selectSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {
                
            }else {
                
                NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
            }
            sqlite3_finalize(statement);
            
            selectSQL = [NSString stringWithFormat: @"UPDATE InternalFinishesDetailsNew set locationName=\"%@\" WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and pageNumber=\"%i\" and saved=0 and locationNumber=2",txtLocation2.text,txtBlock1.text,txtStorey1.text,txtUnit1.text,[showPickerData.text intValue]];
            query_stmt = [selectSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {
                
            }else {
                
                NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
            }
            sqlite3_finalize(statement);
            
            selectSQL = [NSString stringWithFormat: @"UPDATE InternalFinishesDetailsNew set locationName=\"%@\" WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and pageNumber=\"%i\" and saved=0 and locationNumber=3",txtLocation3.text,txtBlock1.text,txtStorey1.text,txtUnit1.text,[showPickerData.text intValue]];
            query_stmt = [selectSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {
                
            }else {
                
                NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
            }
            sqlite3_finalize(statement);
            
            selectSQL = [NSString stringWithFormat: @"UPDATE InternalFinishesDetailsNew set locationName=\"%@\" WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and pageNumber=\"%i\" and saved=0 and locationNumber=4",txtLocation4.text,txtBlock1.text,txtStorey1.text,txtUnit1.text,[showPickerData.text intValue]];
            query_stmt = [selectSQL UTF8String];
            sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE) {
                
            }else {
                
                NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
            }
            sqlite3_finalize(statement);
                        }
        }
        sqlite3_close(CONQUASDB);
    
}

- (void)keyboardWillShow:(NSNotification *)note
{
    CGRect keyboardBounds;
    NSValue *aValue = [note.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    
    [aValue getValue:&keyboardBounds];
    //keyboardHeight = keyboardBounds.size.width;
    
    if (!keyboardIsShowing)
    {
        keyboardIsShowing = YES;
        CGRect frame = mainView.frame;
        //frame.size.height -= 168;
        frame.size.width += 250;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:0.3f];
        mainView.frame = frame;
        [UIView commitAnimations];
    }
}
- (void)keyboardWillHide:(NSNotification *)note
{
    CGRect keyboardBounds;
    NSValue *aValue = [note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    [aValue getValue: &keyboardBounds];
    
    //keyboardHeight = keyboardBounds.size.width;
    if (keyboardIsShowing)
    {
        keyboardIsShowing = NO;
        CGRect frame = mainView.frame;
        frame.size.width -= 250;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:0.3f];
        mainView.frame = frame;
        [UIView commitAnimations];
        
    }
    
}

- (IBAction)checkBoxClick:(id)sender {
    
    
    UIButton *check1=(UIButton*)sender;
    
    // [self saveInternalFinishesDataNew:check1];
    int editionNumber;
    if([[radioNames objectAtIndex:3] intValue]==1)
        editionNumber=6;
    else if ([[radioNames objectAtIndex:4] intValue]==1)
        editionNumber=7;
    else if ([[radioNames objectAtIndex:5] intValue]==1)
        editionNumber=8;
    int btnPressed = [sender tag];
    
    /*int location;
    if(btnPressed<=70)
        location=1;
    else if((btnPressed>70) && (btnPressed<=140))
        location=2;
    else if((btnPressed>140) && (btnPressed<=210))
        location=3;
    else if((btnPressed>210) && (btnPressed<=280))
        location=4;
    */
    
    
    
    // [self showScore];
    //NSString *btnPressed = [NSString stringWithFormat:@"%i", [sender tag]];
    int val;
    for(int i=0;i<280;i++)
    {
        
        val = [[stateNames objectAtIndex:i] integerValue];
        if (btnPressed == i+1) {
            
            if (val == 0){
                //ui = (UIButton *)[self.view viewWithTag:i+1];
                [check1 setImage:[UIImage imageNamed:@"checkbox_tick.png"] forState:UIControlStateNormal];
                [stateNames replaceObjectAtIndex:i withObject:@"1"];
            }else if (val == 1){
                [check1 setImage:[UIImage imageNamed:@"checkbox_cross.png"] forState:UIControlStateNormal];
                [stateNames replaceObjectAtIndex:i withObject:@"2"];
                
            }else if (val == 2){
                [check1 setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:UIControlStateNormal];
                [stateNames replaceObjectAtIndex:i withObject:@"0"];
            }
        }
        
        
    }
    
    
    [self saveInternalFinishesDataNew:check1];
    [self showScore];
    
}
- (IBAction)RadioButtonClick:(id)sender {
    
    //radio buttons
    
    UIButton *check1=(UIButton*)sender;
    int editionNumber;
    UIButton *ui;
    //NSString *btnPressed = [NSString stringWithFormat:@"%i", [sender tag]];
    int pageSelected = [sender tag];
    
    if(pageSelected==504)
        editionNumber=6;
    
    if(pageSelected==505)
        editionNumber=7;
    
    if(pageSelected==506)
        editionNumber=8;
    
    
    int val;
    
    for (int i=0;i<3;i++)
    {
        [radioNamesPrevState replaceObjectAtIndex:i withObject:[radioNames objectAtIndex:i]];
    }
    
    
    
    for(int i=500;i<512;i++)
    {
        val = [[radioNames objectAtIndex:i-500] integerValue];
        
        if (pageSelected == i+1) {
            if (val == 0){
                //ui = (UIButton *)[self.view viewWithTag:i+1];
                [check1 setImage:[UIImage imageNamed:@"radio2.png"] forState:UIControlStateNormal];
                
                [radioNames replaceObjectAtIndex:i-500 withObject:@"1"];
                
                
                
            }
        }
        if (pageSelected%3 == 0)
        {
            ui = (UIButton *)[self.view viewWithTag:pageSelected+1];
            [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
            [radioNames replaceObjectAtIndex:(pageSelected+1)-501 withObject:@"0"];
            ui = (UIButton *)[self.view viewWithTag:pageSelected+2];
            [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
            [radioNames replaceObjectAtIndex:(pageSelected+2)-501 withObject:@"0"];
        }
        if (pageSelected%3 == 1)
        {
            ui = (UIButton *)[self.view viewWithTag:pageSelected-1];
            [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
            [radioNames replaceObjectAtIndex:(pageSelected-1)-501 withObject:@"0"];
            ui = (UIButton *)[self.view viewWithTag:pageSelected+1];
            [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
            [radioNames replaceObjectAtIndex:(pageSelected+1)-501 withObject:@"0"];
        }
        
        if (pageSelected%3 == 2)
        {
            ui = (UIButton *)[self.view viewWithTag:pageSelected-2];
            [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
            [radioNames replaceObjectAtIndex:(pageSelected-2)-501 withObject:@"0"];
            ui = (UIButton *)[self.view viewWithTag:pageSelected-1];
            [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
            [radioNames replaceObjectAtIndex:(pageSelected-1)-501 withObject:@"0"];
        }
        
        
        
    }
    
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Access Database" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    } else {
        const char *charDBPath = [databasePath UTF8String];
        sqlite3_stmt *statement,*statement1;
        if (sqlite3_open(charDBPath, &CONQUASDB) == SQLITE_OK) {
            NSString *selectSQL = [NSString stringWithFormat: @"SELECT locationNumber,ID FROM InternalFinishesDetailsNew WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and saved=0 and pageNumber=\"%i\"",txtBlock1.text, txtStorey1.text,txtUnit1.text,[showPickerData.text intValue]];
            NSString *sqlCommand;
            const char *query_stmt = [selectSQL UTF8String];
            const char *query_stmt1;
            float score;
            int locationNumber;
            int tempID;
            sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
            
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                //pageNumber = sqlite3_column_int(statement, 0);
                locationNumber = sqlite3_column_int(statement, 0);
                tempID = sqlite3_column_int(statement, 1);
                score = [self calculateEditionScore:pageSelected:tempID:locationNumber];
                
                sqlCommand = [NSString stringWithFormat: @"UPDATE InternalFinishesDetailsNew SET score =\"%f\", editionNumber=\"%@\" WHERE saved=0 and id=\"%i\"",score,[NSString stringWithFormat:@"%i", editionNumber], tempID];
                
                
                
                query_stmt1 = [sqlCommand UTF8String];
                sqlite3_prepare_v2(CONQUASDB, query_stmt1, -1, &statement1, NULL);
                if (sqlite3_step(statement1) == SQLITE_DONE) {
                }
                else {
                    NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                }
                sqlite3_finalize(statement1);
                
            }
            
            
            
            //score = finalScoreValue/locationsSaved;
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(CONQUASDB);
    
    [self showScore];
    
}
- (void)loadSavedInformationNew:(id)sender {
    
    scoreLabel.hidden=NO;
    showScoreData.hidden=NO;
    showPicker.hidden=NO;
    searchButton.hidden=YES;
    [self deleteUnsaved];
    [self duplicatesaved:(id)sender];
    //[self clearAll:(id)sender];
    [self clearAll];
    [self retrieveSavedInformationNew:(id)sender];
    isUpdate = 1;
    [prevsButton setTag:9000];
    [nextButtun setTag:9001];
    loadSavedBtn.hidden=NO;
    [self showScore];
}
- (void)retrieveSavedInformationNew:(id)sender {
    
    //Retrieving the data from database
    
    
    mainView2.hidden=YES;
    secondPicker.hidden=NO;
    NSString *tempLocationName;
    NSString *tempLocationNumber;
    NSString *tempEditionNumber;
    NSString *tempID;
    NSString *tempScore;
    NSString *tempProjectID;
    NSString *tempProjectName;
    
    UIButton *ui;
    
    NSString* blk;
    NSString* storey;
    NSString* unit;
    
    int tempStateVal;
    int tempTagVal;
    int pgNum;
    int load;
    
    int pgSelected = [sender tag];
    
    //selectedPage = [radioNames objectAtIndex:0];
    
    //    if (pgSelected==601)
    
    if (pgSelected<10001)
    {
        load=0;
        pgNum=[selectedPage intValue];
    }
    else {
        
        load=1;
        pgSelected=pgSelected-10000;
        pgNum=[showPickerData.text intValue];
        
        
        
    }
    for (int i=1; i<=280;i++)
    {
        ui    = (UIButton *)[self.view viewWithTag:i];
        [ui setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:UIControlStateNormal];
        [stateNames replaceObjectAtIndex:i-1 withObject:@"0"];
        
    }
    
    txtLocation1.text=@"";
    txtLocation2.text=@"";
    txtLocation3.text=@"";
    txtLocation4.text=@"";
    
    
    blk=txtBlock1.text;
    storey=txtStorey1.text;
    unit=txtUnit1.text;
    
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Access Database" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    } else {
        
        const char *charDBPath = [databasePath UTF8String];
        if (sqlite3_open(charDBPath, &CONQUASDB) == SQLITE_OK) {
            
            
            //comment - Retrieve Individual Samples Information.
            sqlite3_stmt *statement;
            
            if(load==1)
            {
                
                
                NSString *selectSQL = [NSString stringWithFormat: @"SELECT blkNumber, storeyNumber, unitNumber,score,projectID,projectName FROM InternalFinishesDetailsNew WHERE ID=%i", pgSelected];
                const char *query_stmt = [selectSQL UTF8String];
                
                if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                    
                    if(sqlite3_step(statement) == SQLITE_ROW)
                    {
                        
                        blk = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        storey = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        unit = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        tempScore=[[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                        tempProjectID = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                        tempProjectName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                        
                        
                        float tmpScore;
                        tmpScore=[tempScore floatValue];
                        
                        
                        txtBlock1.text=blk;
                        txtStorey1.text=storey;
                        txtUnit1.text=unit;
                        txtProjectID.text=tempProjectID;
                        txtProjectName.text=tempProjectName;
                        
                        showScoreData.text=[NSString stringWithFormat:@"%1.2f", tmpScore];
                        
                        sqlite3_finalize(statement);
                        
                    }
                    
                    
                    
                }
                
                
            }
            
            
            
            NSString *selectSQL = [NSString stringWithFormat: @"SELECT id,locationName,locationNumber, editionNumber,projectID, projectName FROM InternalFinishesDetailsNew WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and pageNumber=\"%i\" and saved=0",blk,storey,unit,pgNum];
            const char *query_stmt = [selectSQL UTF8String];
            
            
            if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                while (sqlite3_step(statement) == SQLITE_ROW)
                {
                    
                    tempID = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                    tempLocationName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                    tempLocationNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                    tempEditionNumber = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                    
                    
                    
                    
                    if ([tempLocationNumber intValue]==1)
                        txtLocation1.text=tempLocationName;
                    else if ([tempLocationNumber intValue]==2)
                        txtLocation2.text=tempLocationName;
                    else if ([tempLocationNumber intValue]==3)
                        txtLocation3.text=tempLocationName;
                    else if ([tempLocationNumber intValue]==4)
                        txtLocation4.text=tempLocationName;
                    
                    selectSQL = [NSString stringWithFormat: @"SELECT tagValue, checkState FROM InternalFinishesSummaryDetailsNew WHERE IFD_Fkey=%i ",[tempID intValue]];
                    sqlite3_stmt *statement1;
                    query_stmt = [selectSQL UTF8String];
                    if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement1, NULL) == SQLITE_OK) {
                        while(sqlite3_step(statement1) == SQLITE_ROW)
                        {
                            
                            tempTagVal = sqlite3_column_int(statement1, 0);
                            tempStateVal = sqlite3_column_int(statement1, 1);
                            
                            ui = (UIButton *)[self.view viewWithTag:tempTagVal];
                            if (tempStateVal == 1){
                                
                                [ui setImage:[UIImage imageNamed:@"checkbox_tick.png"] forState:UIControlStateNormal];
                                [stateNames replaceObjectAtIndex:tempTagVal-1 withObject:@"1"];
                                
                            }else if (tempStateVal == 2){
                                [ui setImage:[UIImage imageNamed:@"checkbox_cross.png"] forState:UIControlStateNormal];
                                [stateNames replaceObjectAtIndex:tempTagVal-1 withObject:@"2"];
                                
                            }else if (tempStateVal == 0){
                                [ui setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:UIControlStateNormal];
                                [stateNames replaceObjectAtIndex:tempTagVal-1 withObject:@"0"];
                                
                            }
                        }
                        
                    }
                    else {
                        NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                    }
                    
                }
                
                
            }
            else {
                NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
            }
            
            sqlite3_finalize(statement);
            
            
        }
        sqlite3_close(CONQUASDB);
        
    }
    
    if ([tempEditionNumber intValue]==6)
    {
        ui = (UIButton *)[self.view viewWithTag:504];
        [ui setImage:[UIImage imageNamed:@"radio2.png"] forState:UIControlStateNormal];
        [radioNames replaceObjectAtIndex:3 withObject:@"1"];
        ui = (UIButton *)[self.view viewWithTag:505];
        [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
        [radioNames replaceObjectAtIndex:4 withObject:@"0"];
        ui = (UIButton *)[self.view viewWithTag:506];
        [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
        [radioNames replaceObjectAtIndex:5 withObject:@"0"];
        
    }
    else if ([tempEditionNumber intValue]==7)
    {
        ui = (UIButton *)[self.view viewWithTag:504];
        [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
        [radioNames replaceObjectAtIndex:3 withObject:@"0"];
        ui = (UIButton *)[self.view viewWithTag:505];
        [ui setImage:[UIImage imageNamed:@"radio2.png"] forState:UIControlStateNormal];
        [radioNames replaceObjectAtIndex:4 withObject:@"1"];
        ui = (UIButton *)[self.view viewWithTag:506];
        [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
        [radioNames replaceObjectAtIndex:5 withObject:@"0"];
        
    }
    else if ([tempEditionNumber intValue]==8)
    {
        ui = (UIButton *)[self.view viewWithTag:504];
        [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
        [radioNames replaceObjectAtIndex:3 withObject:@"0"];
        ui = (UIButton *)[self.view viewWithTag:505];
        [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
        [radioNames replaceObjectAtIndex:4 withObject:@"0"];
        ui = (UIButton *)[self.view viewWithTag:506];
        [ui setImage:[UIImage imageNamed:@"radio2.png"] forState:UIControlStateNormal];
        [radioNames replaceObjectAtIndex:5 withObject:@"1"];
        
    }
    
    //[self showScore];
    
    
}

- (IBAction)saveInternalFinishesDataNew:(id)sender {
    
    int doInsert=0;
    int saved=0;
    int btnPressed = [sender tag];
    int pgNum;
    
    
    if (btnPressed==601)
    {
        pgNum=prevSelectedPage;
        
    }
    else {
        
        pgNum=[showPickerData.text intValue];
        
    }
    
    
    if ((btnPressed==800) || (btnPressed>=10000))
        saved=1;
    int IFD_ID;
    
    NSString *locName;
    NSMutableArray *doInsertLocation = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0", nil];
    
    NSString *strBlockNumber,*strStoreyNumber,*strUnitNumber;
    //NSString *strLocationName1,*strLocationName2,*strLocationName3,*strLocationName4;
    
    
    strBlockNumber=txtBlock1.text;
    strStoreyNumber=txtStorey1.text;
    strUnitNumber=txtUnit1.text;
    //strLocationName1=txtLocation1.text;
    //strLocationName2=txtLocation2.text;
    //strLocationName3=txtLocation3.text;
    //strLocationName4=txtLocation4.text;
    
    int tempTotalLoc1=0;
    int tempTotalLoc2=0;
    int tempTotalLoc3=0;
    int tempTotalLoc4=0;
    
    //int tempTotalLoc4=0;
    for (int i=0;i<70;i++)
        tempTotalLoc1 = tempTotalLoc1 + [[stateNames objectAtIndex:i] intValue];
    for (int i=70;i<140;i++)
        tempTotalLoc2 = tempTotalLoc2 + [[stateNames objectAtIndex:i] intValue];
    for (int i=140;i<210;i++)
        tempTotalLoc3 = tempTotalLoc3 + [[stateNames objectAtIndex:i] intValue];
    for (int i=210;i<280;i++)
        tempTotalLoc4 = tempTotalLoc4 + [[stateNames objectAtIndex:i] intValue];
    
    if(tempTotalLoc1>0)
        [doInsertLocation replaceObjectAtIndex:0 withObject:@"1"];
    if(tempTotalLoc2>0)
        [doInsertLocation replaceObjectAtIndex:1 withObject:@"1"];
    if(tempTotalLoc3>0)
        [doInsertLocation replaceObjectAtIndex:2 withObject:@"1"];
    if(tempTotalLoc4>0)
        [doInsertLocation replaceObjectAtIndex:3 withObject:@"1"];
    
    
    
    NSString *sqlCommand,*sqlCommand1;
    const char *query_stmt,*query_stmt1;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &CONQUASDB) == SQLITE_OK)
    {
        sqlite3_stmt *statement,*statement1;
        int countInsertedRecords;
        sqlCommand = [NSString stringWithFormat: @"SELECT count(id) FROM InternalFinishesDetailsNew WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and saved=1",strBlockNumber,strStoreyNumber,strUnitNumber];
        NSLog(@"sqlCommandSeletcBlk=%@",sqlCommand);
        query_stmt = [sqlCommand UTF8String];
        if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                
                countInsertedRecords = sqlite3_column_int(statement, 0);
                
            }
        }
        sqlite3_finalize(statement);
        
        int proceedInsert=1;
        
        if (([sender tag]==800) && (countInsertedRecords>0) && (isUpdate!=1)) {
            proceedInsert = 0;
        }
        NSLog(@"proceed insert=%i",proceedInsert);
        //if (([sender tag]==800) && (countInsertedRecords=0))
        if (proceedInsert==1)
        {
            
            for(int k=1;k<=4;k++)
            {
                
                if(k==1)
                    locName=txtLocation1.text;
                if(k==2)
                    locName=txtLocation2.text;
                if(k==3)
                    locName=txtLocation3.text;
                if(k==4)
                    locName=txtLocation4.text;
                NSLog(@"1");
                
                if ([[doInsertLocation objectAtIndex:k-1]intValue]==1) {
                    NSLog(@"2");
                    totalEntry++;
                    sqlCommand = [NSString stringWithFormat: @"SELECT id FROM InternalFinishesDetailsNew WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and pageNumber=\"%i\" and locationNumber=\"%i\" and saved=0",strBlockNumber,strStoreyNumber,strUnitNumber,pgNum,k];
                    NSLog(@"sqlCommandSelect=%@",sqlCommand);
                    query_stmt = [sqlCommand UTF8String];
                    if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                        if (sqlite3_step(statement) == SQLITE_ROW)
                        {
                            
                            IFD_ID = sqlite3_column_int(statement, 0);
                            
                        }
                        else
                        {
                            
                            doInsert = 1;
                        }
                        sqlite3_finalize(statement);
                        
                    }
                    
                    int editionNumber;
                    if([[radioNames objectAtIndex:3] intValue]==1)
                        editionNumber=6;
                    else if ([[radioNames objectAtIndex:4] intValue]==1)
                        editionNumber=7;
                    else if ([[radioNames objectAtIndex:5] intValue]==1)
                        editionNumber=8;
                    
                    
                    
                    float score = [self calculateScore:editionNumber:k];
                    if (doInsert==1) {
                        
                        
                        sqlCommand = [NSString stringWithFormat: @"INSERT INTO InternalFinishesDetailsNew(blkNumber, storeyNumber, unitNumber,  locationName, editionNumber, pageNumber, locationNumber, saved, score, projectID, projectName) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%i\", \"%i\", \"%i\", \"%1.2f\", \"%@\", \"%@\")", strBlockNumber, strStoreyNumber, strUnitNumber, locName,[NSString stringWithFormat:@"%i", editionNumber], pgNum, k, 0, score, txtProjectID.text, txtProjectName.text
                                      ];
                        NSLog(@"sqlCommandInsert0=%@",sqlCommand);
                        query_stmt = [sqlCommand UTF8String];
                        sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
                        if (sqlite3_step(statement) == SQLITE_DONE) {
                            
                        }else {
                            
                            NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                        }
                        
                        sqlite3_finalize(statement);
                        IFD_ID = sqlite3_last_insert_rowid(CONQUASDB);
                        
                        
                    }
                    else {
                        
                        sqlCommand = [NSString stringWithFormat: @"UPDATE InternalFinishesDetailsNew SET locationName =\"%@\", score=\"%1.2f\" WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and pageNumber=\"%i\" and locationNumber=\"%i\" and saved=\"%i\"",locName,score,strBlockNumber,strStoreyNumber,strUnitNumber,pgNum,k,0];
                        NSLog(@"sqlCommand=%@",sqlCommand);
                        query_stmt = [sqlCommand UTF8String];
                        sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
                        if (sqlite3_step(statement) == SQLITE_DONE) {
                        }else {
                            NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                        }
                        sqlite3_finalize(statement);
                        
                    }
                    
                    
                    sqlCommand = [NSString stringWithFormat: @"DELETE FROM InternalFinishesSummaryDetailsNew WHERE IFD_Fkey =\"%i\"",IFD_ID];
                    
                    NSLog(@"sqlCommandDelete=%@",sqlCommand);
                    query_stmt = [sqlCommand UTF8String];
                    sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
                    
                    if (sqlite3_step(statement) == SQLITE_DONE) {
                        NSLog(@"database check1");
                    }
                    
                    else {
                        NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                    }
                    
                    sqlite3_finalize(statement);
                    
                    
                    
                    
                    
                    
                    for(int i=70*(k-1);i<70*k;i++)
                    {
                        
                        if ([[stateNames objectAtIndex:i] integerValue]!=0) {
                            
                            
                            sqlCommand = [NSString stringWithFormat: @"INSERT INTO InternalFinishesSummaryDetailsNew(IFD_Fkey, tagValue,checkState, saved) VALUES (%i, %i, %i, 0);", IFD_ID, i+1, [[stateNames objectAtIndex:i] integerValue]];
                            NSLog(@"sqlCommandInsert=%@",sqlCommand);
                            query_stmt = [sqlCommand UTF8String];
                            sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
                            if (sqlite3_step(statement) == SQLITE_DONE) {
                                
                            }
                            else {
                                NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                            }
                            
                            sqlite3_finalize(statement);
                        }
                        
                    }
                    
                    
                    sqlite3_finalize(statement);
                }
                else
                {
                    sqlCommand = [NSString stringWithFormat: @"DELETE from InternalFinishesDetailsNew WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and pageNumber=\"%i\" and locationNumber=\"%i\" and saved=\"%i\"",strBlockNumber,strStoreyNumber,strUnitNumber,pgNum,k,0];
                    NSLog(@"sqlCommandDel=%@",sqlCommand);
                    query_stmt = [sqlCommand UTF8String];
                    sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
                    if (sqlite3_step(statement) == SQLITE_DONE) {
                    }else {
                        NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                    }
                    sqlite3_finalize(statement);
                    
                }
            }
            
            
            
            
            
            if (saved==1)
            {
                NSLog(@"is saved 1?");
                NSString *message;
                if ([txtBlock1.text isEqualToString:@""]) {
                    message = @"Blk Required!";
                } else if ([txtStorey1.text isEqualToString:@""]) {
                    message = @"Storey Required!";
                } else if (![self isNumeric:txtStorey1.text]) {
                    message = @"Storey Must Be A Number!";
                } else {
                    
                    
                    sqlCommand1 = [NSString stringWithFormat: @"SELECT ID FROM InternalFinishesDetailsNew where blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and saved=\"%i\"", strBlockNumber,strStoreyNumber,strUnitNumber,1];
                    query_stmt1 = [sqlCommand1 UTF8String];
                    sqlite3_prepare_v2(CONQUASDB, query_stmt1, -1, &statement1, NULL);
                    while (sqlite3_step(statement1) == SQLITE_ROW) {
                        IFD_ID = sqlite3_column_int(statement1, 0);
                        sqlCommand = [NSString stringWithFormat: @"DELETE FROM InternalFinishesSummaryDetailsNew where IFD_Fkey=\"%i\"", IFD_ID];
                        query_stmt = [sqlCommand UTF8String];
                        sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
                        if (sqlite3_step(statement) == SQLITE_DONE) {}
                        
                        sqlite3_finalize(statement);
                        
                        
                        
                    }
                    sqlite3_finalize(statement1);
                    
                    
                    sqlCommand = [NSString stringWithFormat: @"UPDATE InternalFinishesSummaryDetailsNew set saved=\"%i\"",saved];
                    
                    query_stmt = [sqlCommand UTF8String];
                    sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
                    if (sqlite3_step(statement) == SQLITE_DONE) { }
                    
                    sqlite3_finalize(statement);
                    
                    sqlCommand = [NSString stringWithFormat: @"DELETE FROM InternalFinishesDetailsNew where saved=1 and blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\"", strBlockNumber,strStoreyNumber,strUnitNumber];
                    query_stmt = [sqlCommand UTF8String];
                    sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
                    if (sqlite3_step(statement) == SQLITE_DONE) {}
                    sqlite3_finalize(statement);
                    
                    
                    sqlCommand = [NSString stringWithFormat: @"UPDATE InternalFinishesDetailsNew set saved=\"%i\"  where blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and saved=\"%i\"", saved, strBlockNumber,strStoreyNumber,strUnitNumber,0];
                    
                    query_stmt = [sqlCommand UTF8String];
                    sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
                    if (sqlite3_step(statement) == SQLITE_DONE) {  }
                    sqlite3_finalize(statement);
                    
                    
                    
                    sqlCommand1 = [NSString stringWithFormat: @"SELECT ID FROM InternalFinishesDetailsNew where blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and saved=\"%i\"", strBlockNumber,strStoreyNumber,strUnitNumber,1];
                    query_stmt1 = [sqlCommand1 UTF8String];
                    sqlite3_prepare_v2(CONQUASDB, query_stmt1, -1, &statement1, NULL);
                    while (sqlite3_step(statement1) == SQLITE_ROW) {
                        IFD_ID = sqlite3_column_int(statement1, 0);
                        
                    }
                    sqlite3_finalize(statement1);
                    //UIButton *ui;
                    //ui = (UIButton *)[self.view viewWithTag:IFD_ID];
                    [sender setTag: IFD_ID+10000];
                    [self duplicatesaved:(id)sender];
                    
                    if (totalEntry==0)
                    {
                        message = @"None of locations data is entered. Save Failed";
                    }
                    else
                    {
                    message = @"Saved Successfully.";
                    }
                    
                    
                    
                }
                
                if([message length] > 0)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:message delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
                    [alert show];
                }
                
                
                
                
                
            }
            
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"An entry with same block number, storey number, unit number already exists."delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
            [alert show];
            
        }
        
        sqlite3_close(CONQUASDB);
        
    }
    
    
}
#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    int count;
    
    if([pickerView isEqual: singlePicker]){
        count = [pickerData count];
    }
    
    if([pickerView isEqual: secondPicker]){
        count = [pageNo count];
    }
    
    return count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if([pickerView isEqual: singlePicker]){
        return [pickerData objectAtIndex:row];
    }
    
    if([pickerView isEqual: secondPicker]){
        return [pageNo objectAtIndex:row];
    }
    [singlePicker reloadAllComponents];
    return nil;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if([pickerView isEqual:singlePicker]){
        NSString *selectedRow = [[NSString alloc] initWithFormat:@"%@",[pickerData objectAtIndex:row]];
        singlePicker.hidden=YES;
        UIButton *ui;
        ui = (UIButton *)[self.view viewWithTag:600];
        if([selectedRow length]>0)
        {
            [secondPicker selectRow: 0 inComponent:0 animated:NO];
            showPickerData.text=@"1";
            
            //[self deleteUnsaved];
            //[self duplicatesaved];
            [self retrieveSavedInformationNew:ui];
            
            
        }
        
    }
    
    
    
    
    if([pickerView isEqual:secondPicker]){
        
        NSString *selectedRow = [[NSString alloc] initWithFormat:@"%@",[pageNo objectAtIndex:row]];
        prevSelectedPage = [selectedPage intValue];
        selectedPage = selectedRow;
        secondPicker.hidden=YES;
        showPickerData.text = selectedRow;
        
        UIButton *ui;
        ui = (UIButton *)[self.view viewWithTag:601];
        
                
        //[self saveInternalFinishesDataNew:ui];
        [self retrieveSavedInformationNew:ui];
    }
    [showPickerData sizeToFit];
    
    [singlePicker reloadComponent:component];
    
}


- (IBAction)showPicker:(id)sender {
    
    loadSavedBtn.hidden=YES;
    origBlock=txtBlock1.text;
    origStorey=txtStorey1.text;
    origUnit=txtUnit1.text;
    origProjectID=txtProjectID.text;
    origProjectName=txtProjectName.text;
    origPageNumber=[secondPicker selectedRowInComponent:0];
    
    if([sender tag]==600)
    {
        txtBlock1.text=@"";
        txtStorey1.text=@"";
        txtUnit1.text=@"";
        txtProjectID.text=@"";
        txtProjectName.text=@"";
    }
    [self loadPicker:nil];
    searchButton.hidden=NO;
    mainView2.hidden=NO;
    secondPicker.hidden=YES;
    showScoreData.hidden=YES;
    scoreLabel.hidden=YES;
    
    
    
    
    [singlePicker reloadAllComponents];
    if(singlePicker.hidden)
    {
        
        singlePicker.hidden=NO;
    }
    else {
        
        singlePicker.hidden=YES;
    }
    secondPicker.hidden=YES;
    showPicker.hidden=YES;
    [prevsButton setTag:9000];
    [nextButtun setTag:9001];
    
}
- (IBAction)newButton:(id)sender {
    
    txtBlock1.text=@"";
    txtStorey1.text=@"";
    txtUnit1.text=@"";
    txtLocation1.text=@"";
    txtLocation2.text=@"";
    txtLocation3.text=@"";
    showScoreData.text=@"";
    showPickerData.text=@"";
    isUpdate=0;
    UIButton *ui;
    for (int i=1; i<=420;i++)
    {
        ui    = (UIButton *)[self.view viewWithTag:i];
        [ui setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:UIControlStateNormal];
        [stateNames replaceObjectAtIndex:i-1 withObject:@"0"];
    }
    
    [secondPicker selectRow: 0 inComponent:0 animated:NO];
    showPickerData.text=@"1";
    
    ui = (UIButton *)[self.view viewWithTag:504];
    [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
    [radioNames replaceObjectAtIndex:3 withObject:@"0"];
    
    ui = (UIButton *)[self.view viewWithTag:505];
    [ui setImage:[UIImage imageNamed:@"radio2.png"] forState:UIControlStateNormal];
    [radioNames replaceObjectAtIndex:4 withObject:@"1"];
    
    ui = (UIButton *)[self.view viewWithTag:506];
    [ui setImage:[UIImage imageNamed:@"radio1.png"] forState:UIControlStateNormal];
    [radioNames replaceObjectAtIndex:5 withObject:@"0"];
    [self deleteUnsaved];
    
}
// Called when an alertview button is touched
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
        {
            
        }
            break;
            
        case 1:
        {
            NSFileManager *filemgr = [NSFileManager defaultManager];
            
            if ([filemgr fileExistsAtPath:databasePath] == NO)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Unable To Access Database" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
                [alert show];
            } else {
                const char *charDBPath = [databasePath UTF8String];
                sqlite3_stmt *statement,*statement1;
                NSString *selectSQL,*sqlCommand;
                NSString *blk,*storey,*unit;
                const char *query_stmt,*query_stmt1;
                int tempID;
                if (sqlite3_open(charDBPath, &CONQUASDB) == SQLITE_OK) {
                    sqlCommand = [NSString stringWithFormat: @"SELECT blkNumber, storeyNumber, unitNumber FROM InternalFinishesDetailsNew WHERE id=\"%i\"",deleteID-10000];
                    query_stmt1 = [sqlCommand UTF8String];
                    sqlite3_prepare_v2(CONQUASDB, query_stmt1, -1, &statement, NULL);
                    while(sqlite3_step(statement) == SQLITE_ROW) {
                        blk  = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        storey  = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        unit  = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        
                        
                    }
                    sqlite3_finalize(statement);
                    sqlCommand = [NSString stringWithFormat: @"SELECT id FROM InternalFinishesDetailsNew WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\"",blk, storey,unit];
                    
                    query_stmt1 = [sqlCommand UTF8String];
                    sqlite3_prepare_v2(CONQUASDB, query_stmt1, -1, &statement1, NULL);
                    while(sqlite3_step(statement1) == SQLITE_ROW) {
                        tempID = sqlite3_column_int(statement1, 0);
                        selectSQL = [NSString stringWithFormat: @"DELETE FROM InternalFinishesDetailsNew WHERE id=\"%i\"",tempID];
                        query_stmt = [selectSQL UTF8String];
                        sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
                        if (sqlite3_step(statement) == SQLITE_DONE) {
                        }
                        else {
                            NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                        }
                        sqlite3_finalize(statement);
                        
                        selectSQL = [NSString stringWithFormat: @"DELETE FROM InternalFinishesSummaryDetailsNew WHERE IFD_Fkey=\"%i\"",tempID];
                        query_stmt = [selectSQL UTF8String];
                        sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL);
                        if (sqlite3_step(statement) == SQLITE_DONE) {
                        }
                        else {
                            NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
                        }
                        sqlite3_finalize(statement);
                    }
                    sqlite3_finalize(statement1);
                    UIButton *ui = (UIButton *)[self.view viewWithTag:0];
                    [self showPicker:(id) ui];
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Deleted Successfully" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
                    [alert show];
                    /*
                     UIButton *check1=(UIButton*)sender;
                     [self newButton:check1];
                     */
                    //score = finalScoreValue/locationsSaved;
                }
                
            }
            sqlite3_close(CONQUASDB);
        }
            break;
    }
}
- (IBAction)deleteButton:(id)sender {
    deleteID=[sender tag];
    NSString * title=@"";
    NSString * message=@"Are you sure you want to delete this record?";
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:NSLocalizedString(@"No", nil)
                                          otherButtonTitles:NSLocalizedString(@"Yes", nil), nil];
	[alert show];
    //[alert release];
	
    
}

- (void)clearAll{
    
    txtLocation1.text=@"";
    txtLocation2.text=@"";
    txtLocation3.text=@"";
    txtLocation4.text=@"";
    txtBlock1.text=@"";
    txtStorey1.text=@"";
    txtUnit1.text=@"";
    showScoreData.text=@"";
    
    
    UIButton *ui;
    for (int i=1; i<=280;i++)
    {
        ui    = (UIButton *)[self.view viewWithTag:i];
        [ui setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:UIControlStateNormal];
        [stateNames replaceObjectAtIndex:i-1 withObject:@"0"];
        
    }
    
    [secondPicker selectRow: 0 inComponent:0 animated:NO];
    showPickerData.text=@"1";
    isUpdate = 0;
    totalEntry = 0;
    
    
}



- (IBAction)clearAll:(id)sender {
    NSString *sqlCommand;
    const char *query_stmt;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &CONQUASDB) == SQLITE_OK)
    {
        sqlite3_stmt *statement;
        sqlCommand = [NSString stringWithFormat: @"DELETE FROM InternalFinishesDetailsNew WHERE blkNumber=\"%@\" and storeyNumber=\"%@\" and unitNumber=\"%@\" and pageNumber=\"%@\" and saved=0",txtBlock1.text,txtStorey1.text,txtUnit1.text,showPageNumber.text];
        query_stmt = [sqlCommand UTF8String];
        if (sqlite3_prepare_v2(CONQUASDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            if (sqlite3_step(statement) == SQLITE_DONE) { }
            else {
                NSLog(@"%s (%1d)", sqlite3_errmsg(CONQUASDB), sqlite3_errcode(CONQUASDB));
            }
        }
        sqlite3_finalize(statement);
    }
    
    txtLocation1.text=@"";
    txtLocation2.text=@"";
    txtLocation3.text=@"";
    txtLocation4.text=@"";
    //txtBlock1.text=@"";
    //txtStorey1.text=@"";
    //txtUnit1.text=@"";
    //showScoreData.text=@"";
    
    
    UIButton *ui;
    for (int i=1; i<=280;i++)
    {
        ui    = (UIButton *)[self.view viewWithTag:i];
        [ui setImage:[UIImage imageNamed:@"checkbox_empty.png"] forState:UIControlStateNormal];
        [stateNames replaceObjectAtIndex:i-1 withObject:@"0"];
        
    }
    
    //[secondPicker selectRow: 0 inComponent:0 animated:NO];
    //showPickerData.text=@"1";
    //isUpdate = 0;
    isUpdate = 1;
    
    [self saveInternalFinishesDataNew:(id)sender];
    [self showScore];
}

- (IBAction)gotoPage:(id)sender {
    if(secondPicker.hidden)
        secondPicker.hidden=NO;
    else {
        secondPicker.hidden=YES;
    }
    
    singlePicker.hidden=YES;
    
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

- (IBAction)prevButton:(id)sender {
    
    if (pgCount>=1)
        pgCount=pgCount-2;
    [sender setTag:pgCount];
    [self loadPicker:(id)sender];
    
    [prevsButton setTag:9000];
}

- (IBAction)nextButton:(id)sender {
    if (pgCount<=pgMax-2)
        pgCount=pgCount+2;
    [sender setTag:pgCount];
    
    [self loadPicker:(id)sender];
    [nextButtun setTag:9001];
    
}


- (IBAction)closeDatadbView:(id)sender {
    searchButton.hidden=YES;
    mainView2.hidden=YES;
    mainView1.hidden=NO;
    secondPicker.hidden=NO;
    scoreLabel.hidden=NO;
    showScoreData.hidden=NO;
    showPicker.hidden=NO;
    loadSavedBtn.hidden=NO;
    
    txtBlock1.text=[NSString  stringWithFormat:@"%@",origBlock];
    txtStorey1.text=[NSString  stringWithFormat:@"%@",origStorey];
    txtUnit1.text=[NSString stringWithFormat:@"%@",origUnit];
    txtProjectID.text=[NSString stringWithFormat:@"%@",origProjectID];
    txtProjectName.text=[NSString stringWithFormat:@"%@",origProjectName];
    [self.secondPicker selectRow: origPageNumber inComponent:0 animated:NO];
    showPickerData.text=[NSString stringWithFormat:@"%d", origPageNumber+1];
    
}
- (IBAction)searchButton1:(id)sender {
    
    
    [self loadPicker:(id)sender];
    
    
}
-(IBAction)backgroundTouched:(id)sender
{
    [self.view endEditing:YES];
}
@end