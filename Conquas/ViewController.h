//
//  ViewController.h
//  Conquas
//
//  Created by Eric Teng on 31/10/11.
//  Copyright (c) 2011 MobTwo Pte Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


    

NSString *strWSURL = @"http://103.247.132.195/BCA/AppCONQUAS/";

@interface ViewController : UIViewController{
    //---web service access---
    
    
    NSMutableData *webData;
    NSMutableString *soapResults;
    NSURLConnection *conn;
    NSString *postString;
    NSURL *url;
    NSMutableURLRequest *req;
    //---plist access---
    NSArray *paths;
    NSString *documentsDirectory;
    NSString *path;
    NSFileManager *fileManager;
    NSMutableDictionary *data;
    //---xml parsing---
    NSXMLParser *xmlParser;
    BOOL elementFound;
    //---outlets---
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UIScrollView *svScrollView;
    IBOutlet UITextField *txtUserName;
    IBOutlet UITextField *txtUserEmail;
    IBOutlet UITextField *txtUserMobileNumber;
    IBOutlet UITextView *txtFeedbackDescription;
    IBOutlet UITextField *txtKeywords;
    IBOutlet UIWebView *wvDisplay;
    IBOutlet UIButton *btnCloseWVDisplay;
    IBOutlet UIButton *ggbaCalc;
    IBOutlet UITextField *txtGreen1;
    IBOutlet UITextField *txtGreen2;
    IBOutlet UITextField *txtGreen3;
    IBOutlet UITextField *txtGreen4;
    IBOutlet UITextField *txtGreen5;
    IBOutlet UITextField *txtGreen6;
    IBOutlet UITextField *txtGreen7;
    IBOutlet UITextField *txtGreen8;
    IBOutlet UITextField *txtGreen9;
    IBOutlet UITextField *txtGreen10;
    IBOutlet UITextField *txtGreen11;
    IBOutlet UITextField *txtGreen12;
    IBOutlet UITextField *txtGreen13;
    IBOutlet UITextField *txtGreen14;
    IBOutlet UITextField *txtGreen15;
    IBOutlet UITextField *txtGreen16;
    IBOutlet UITextField *txtGreen17;
    IBOutlet UITextField *txtGreen18;
    IBOutlet UITextField *txtGreen19;
    IBOutlet UITextField *txtGreen20;
    IBOutlet UITextField *txtGreen21; 
    IBOutlet UITextField *txtGreen22;
    IBOutlet UITextField *txtGreen23;
    IBOutlet UITextField *txtGracious1;
    IBOutlet UITextField *txtGracious2;
    IBOutlet UITextField *txtGracious3;
    IBOutlet UITextField *txtGracious4;
    IBOutlet UITextField *txtGracious5;
    IBOutlet UITextField *txtGracious6;
    IBOutlet UITextField *txtGracious7;
    IBOutlet UITextField *txtGracious8;
    IBOutlet UITextField *txtGracious9;
    IBOutlet UITextField *txtGracious10;
    IBOutlet UITextField *txtGracious11;
    IBOutlet UITextField *txtGracious12;
    IBOutlet UITextField *txtGracious13;
    IBOutlet UITextField *txtGracious14;
    IBOutlet UITextField *txtGracious15;
    IBOutlet UITextField *txtGracious16;
    IBOutlet UITextField *txtGracious17;
    IBOutlet UITextField *txtGracious18;
    IBOutlet UITextField *txtGracious19;
    IBOutlet UITextField *txtGracious20;
    IBOutlet UITextField *txtGracious21;
    IBOutlet UITextField *txtGracious22;
    IBOutlet UITextField *txtGracious23;
    IBOutlet UITextField *txtGracious24;
    IBOutlet UITextField *txtGracious25;
    IBOutlet UITextField *txtGracious26;
    IBOutlet UITextField *txtGracious27;
    IBOutlet UITextField *txtGracious28;
    IBOutlet UITextField *txtGracious29;
    IBOutlet UITextField *txtGracious30;
    IBOutlet UITextField *txtGracious31;
    IBOutlet UITextField *txtGracious32;
    IBOutlet UITextField *txtGracious33;
    IBOutlet UITextField *txtInnovation1;
    IBOutlet UITextField *txtBonus1;
    IBOutlet UIScrollView *svGreen;
    IBOutlet UIScrollView *svGracious;
    IBOutlet UIScrollView *svInnovation;
    IBOutlet UIScrollView *svBonus;
    IBOutlet UIScrollView *svSummary;
    IBOutlet UILabel *lblGreenPoints;
    IBOutlet UILabel *lblGraciousPoints;
    IBOutlet UILabel *lblInnovationPoints;
    IBOutlet UILabel *lblBonusPoints;
    IBOutlet UILabel *lblTotalPoints;
    IBOutlet UILabel *lblScore;
    IBOutlet UILabel *lblMainPoints;    
    NSString *userID;
    NSString *userLoginString;
    NSString *errorID;
    NSString *errorMessage;
    NSString *action;
    NSString *userName;
    NSString *userEmail;
    NSString *userMobileNumber;
    
    UIPageViewController *vcPopupTips;
}


@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;

- (IBAction)btnggbaCalc:(id)sender;


-(IBAction)btnDismissKeyboard:(id)sender;
-(IBAction)btnFacebook;
-(IBAction)btnCQMOnline:(id)sender;
-(IBAction)btnSearchSubmitClicked:(id)sender;
-(IBAction)btnSearchResetClicked:(id)sender;
-(IBAction)btnMyProfileSaveClicked:(id)sender;
-(IBAction)btnMyProfileResetClicked:(id)sender;
-(IBAction)btnFeedbackSendClicked:(id)sender;
-(IBAction)btnFeedbackResetClicked:(id)sender;
-(IBAction)btnTipsClicked:(id)sender;
-(IBAction)btnGGBSBookClicked:(id)sender;
-(IBAction)btnGGBSApplicationFormClicked:(id)sender;
-(IBAction)btnGGBSIndustryKPIClicked:(id)sender;
-(IBAction)btnGGBSKPIWeightageClicked:(id)sender;
-(IBAction)btnChecklistAluminiumWindowsClicked:(id)sender;
-(IBAction)btnChecklistCeramicTilingClicked:(id)sender;
-(IBAction)btnChecklistConquasSubmissionClicked:(id)sender;
-(IBAction)btnChecklistGGBAClicked:(id)sender;
-(IBAction)btnChecklistMarbleAndGraniteFinishesClicked:(id)sender;
-(IBAction)btnChecklistTimberFlooringClicked:(id)sender;
-(IBAction)btnChecklistWaterproofingClicked:(id)sender;
-(IBAction)btnChecklistFormAClicked:(id)sender;
-(IBAction)btnChecklistFormBClicked:(id)sender;
-(IBAction)btnChecklistFormCClicked:(id)sender;
-(IBAction)btnChecklistFormDClicked:(id)sender;
-(IBAction)btnChecklistFormEClicked:(id)sender;
-(IBAction)btnChecklistFormFClicked:(id)sender;
-(IBAction)btnConquasScore:(id)sender;
-(IBAction)btnCloseWVDisplayClicked:(id)sender;
-(IBAction)showGGBAItemInformation:(id)sender;
-(IBAction)updateGGBAScore:(id)sender;
-(IBAction)btnGGBAButtonsClicked:(id)sender;


@end
