//
//  ViewController.m
//  Conquas
//
//  Created by Eric Teng on 31/10/11.
//  Copyright (c) 2011 MobTwo Pte Ltd. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize activityIndicator;

- (BOOL)shouldAutorotate {
    
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}


- (IBAction)btnggbaCalc:(id)sender {
    
    /*UIStoryboard *storyboard = self.storyboard;
    vcPopupTips = [storyboard instantiateViewControllerWithIdentifier:@"ggCalc"];
    vcPopupTips.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentModalViewController:vcPopupTips animated:YES];
     */
}

-(IBAction)btnDismissKeyboard:(id)sender {
    [self.view endEditing:YES];
}

-(IBAction)btnFacebook {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.facebook.com/BCASingapore"]];
}

-(IBAction)btnCQMOnline:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/CQMOnline/"]];
}

-(IBAction)btnConquasScore:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/homeowners/listsql/default.asp"]];
}

-(IBAction)btnSearchSubmitClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://sgms.internet.gov.sg/Search.aspx?q=%@", txtKeywords.text]]];
}

-(IBAction)btnSearchResetClicked:(id)sender {
    txtKeywords.text = @"";
}

-(IBAction)btnCloseWVDisplayClicked:(id)sender {
    wvDisplay.hidden = TRUE;
    btnCloseWVDisplay.hidden = TRUE;
}



- (void)viewDidLoad
{
    url = [NSURL URLWithString:strWSURL];
    req = [NSMutableURLRequest requestWithURL:url];
    [req addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [req setHTTPMethod:@"POST"];
    
    NSError *error;
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths objectAtIndex:0];
    path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath: path])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath: path error:&error];
    }
    data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    userID = [data valueForKey:@"userID"];
    userLoginString = [data valueForKey:@"userLoginString"];
    userName = [data valueForKey:@"userName"];
    userEmail = [data valueForKey:@"userEmail"];
    userMobileNumber = [data valueForKey:@"userMobileNumber"];
    
    //svScrollView.frame = CGRectMake(0, 0, 320, 460);
    //[svScrollView setContentSize:CGSizeMake(320, 900)];  
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        return YES;
    } else {
        return false;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    txtUserName.text = userName;
    txtUserEmail.text = userEmail;
    txtUserMobileNumber.text = userMobileNumber;
    [self becomeFirstResponder];
    
    
    [txtGreen1 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen2 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen3 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen4 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen5 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen6 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen7 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen8 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen9 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen10 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen11 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen12 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen13 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen14 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen15 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen16 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen17 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen18 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen19 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen20 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen21 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen22 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGreen23 setKeyboardType:UIKeyboardTypeNumberPad];
    
    [txtGracious1 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious2 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious3 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious4 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious5 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious6 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious7 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious8 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious9 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious10 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious11 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious12 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious13 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious14 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious15 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious16 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious17 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious18 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious19 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious20 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious21 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious22 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious23 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious24 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious25 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious26 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious27 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious28 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious29 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious30 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious31 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious32 setKeyboardType:UIKeyboardTypeNumberPad];
    [txtGracious33 setKeyboardType:UIKeyboardTypeNumberPad];
    
    [txtInnovation1 setKeyboardType:UIKeyboardTypeNumberPad];
    
    [txtBonus1 setKeyboardType:UIKeyboardTypeNumberPad];
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    // Do your thing after shaking device
    UIStoryboard *storyboard = self.storyboard;
    vcPopupTips = [storyboard instantiateViewControllerWithIdentifier:@"vcTips"];
    vcPopupTips.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentModalViewController:vcPopupTips animated:YES];
     
}

-(IBAction)btnTipsClicked:(id)sender {
    
    
    UIStoryboard *storyboard = self.storyboard;
    vcPopupTips = [storyboard instantiateViewControllerWithIdentifier:@"vcTips"];
    vcPopupTips.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentModalViewController:vcPopupTips animated:YES];
     
}

-(IBAction)btnMyProfileSaveClicked:(id)sender {
    errorID = @""; errorMessage = @""; action = @"submitUserInfo";
    postString = [NSString stringWithFormat:@"action=%@&userID=%@&userLoginString=%@&userName=%@&userEmail=%@&userMobileNumber=%@", action, userID, userLoginString, txtUserName.text, txtUserEmail.text, txtUserMobileNumber.text];
    [req setHTTPBody: [postString dataUsingEncoding:NSUTF8StringEncoding]];
    activityIndicator.hidden = FALSE;
    [activityIndicator startAnimating];
    conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (conn) {
        webData = [NSMutableData data];
    }
}

-(IBAction)btnMyProfileResetClicked:(id)sender {
    txtUserName.text = @"";
    txtUserEmail.text = @"";
    txtUserMobileNumber.text = @"";
}

-(IBAction)btnFeedbackSendClicked:(id)sender {
    errorID = @""; errorMessage = @""; action = @"submitFeedback";
    NSString *feedbackDescription = txtFeedbackDescription.text;
    feedbackDescription = [feedbackDescription stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    postString = [NSString stringWithFormat:@"action=%@&userName=%@&userEmail=%@&userMobileNumber=%@&userFeedbackDescription=%@", action, txtUserName.text, txtUserEmail.text, txtUserMobileNumber.text, feedbackDescription];
    [req setHTTPBody: [postString dataUsingEncoding:NSUTF8StringEncoding]];
    activityIndicator.hidden = FALSE;
    [activityIndicator startAnimating];
    conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (conn) {
        webData = [NSMutableData data];
    }
    
}

-(IBAction)btnFeedbackResetClicked:(id)sender {
    txtUserName.text = @"";
    txtUserEmail.text = @"";
    txtUserMobileNumber.text = @"";
    txtFeedbackDescription.text = @"";
}

-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *) response {
    [webData setLength: 0];
}

-(void) connection:(NSURLConnection *) connection didReceiveData:(NSData *) data {
    [webData appendData:data];
}

-(void) connection:(NSURLConnection *) connection didFailWithError:(NSError *) error {
    [activityIndicator stopAnimating];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Connection Failed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(void) connectionDidFinishLoading:(NSURLConnection *) connection {
    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    //---shows the XML---
    NSLog(@"%@", theXML);
    [activityIndicator stopAnimating];
    xmlParser = [[NSXMLParser alloc] initWithData: webData];
    [xmlParser setDelegate: self];
    [xmlParser setShouldResolveExternalEntities:YES];
    [xmlParser parse];
    if ([action isEqualToString:@"submitUserInfo"]) {
        if ([errorID isEqualToString:@"0"]) {
            [data setValue:[NSString stringWithFormat:@"%@", userID] forKey:@"userID"];
            [data setValue:[NSString stringWithFormat:@"%@", userLoginString] forKey:@"userLoginString"];
            [data setValue:[NSString stringWithFormat:@"%@", txtUserName.text] forKey:@"userName"];
            [data setValue:[NSString stringWithFormat:@"%@", txtUserEmail.text] forKey:@"userEmail"];
            [data setValue:[NSString stringWithFormat:@"%@", txtUserMobileNumber.text] forKey:@"userMobileNumber"];
            [data writeToFile:path atomically:YES];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Profile Saved Successfully!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [self dismissModalViewControllerAnimated:TRUE];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    } else if ([action isEqualToString:@"submitFeedback"]) {
        if ([errorID isEqualToString:@"0"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Feedback Submitted Successfully!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [self dismissModalViewControllerAnimated:TRUE];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}

//---when the start of an element is found---
-(void) parser:(NSXMLParser *) parser didStartElement:(NSString *) elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *) qName attributes:(NSDictionary *) attributeDict {
    if ([elementName isEqualToString:@"errorID"] || [elementName isEqualToString:@"errorMessage"] || [elementName isEqualToString:@"userID"] || [elementName isEqualToString:@"userLoginString"]) {
        if (!soapResults) {
            soapResults = [[NSMutableString alloc] init];
        }
        elementFound = TRUE;
    }
}

-(void)parser:(NSXMLParser *) parser foundCharacters:(NSString *)string {
    if (elementFound) { [soapResults appendString: string]; }
}

//---when the end of element is found---
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if([elementName isEqualToString:@"errorID"]) {
        errorID = [[NSString alloc] initWithString:soapResults];
        [soapResults setString:@""];
        elementFound = FALSE;
    } else if ([elementName isEqualToString:@"errorMessage"]) {
        errorMessage = [[NSString alloc] initWithString:soapResults];
        [soapResults setString:@""];
        elementFound = FALSE;
    } else if ([elementName isEqualToString:@"userID"]) {
        userID = [[NSString alloc] initWithString:soapResults];
        [soapResults setString:@""];
        elementFound = FALSE;
    } else if ([elementName isEqualToString:@"userLoginString"]) {
        userLoginString = [[NSString alloc] initWithString:soapResults];
        [soapResults setString:@""];
        elementFound = FALSE;
    }
}

-(IBAction)btnGGBSBookClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/AppConquas/Files/bookGGBS.pdf"]];
    //wvDisplay.hidden = FALSE;
    //NSString *tempPath = [[NSBundle mainBundle] pathForResource:@"bookGGBS" ofType:@"pdf"];
    //NSURL *targetURL = [NSURL fileURLWithPath:tempPath];
    //NSURLRequest *tempRequest = [NSURLRequest requestWithURL:targetURL];
    //[wvDisplay loadRequest:tempRequest];
    //btnCloseWVDisplay.hidden = FALSE;
}

-(IBAction)btnGGBSApplicationFormClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/AppConquas/Files/ggbsApplicationForm.pdf"]];
}

-(IBAction)btnGGBSIndustryKPIClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/AppConquas/Files/ggbsIndustryKPI.pdf"]];
}

-(IBAction)btnGGBSKPIWeightageClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/AppConquas/Files/ggbsKPIWeightage.pdf"]];
}

-(IBAction)btnChecklistAluminiumWindowsClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/AppConquas/Files/checklistAluminiumWindows.pdf"]];
}

-(IBAction)btnChecklistCeramicTilingClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/AppConquas/Files/checklistCeramicTiling.pdf"]];
}

-(IBAction)btnChecklistConquasSubmissionClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/AppConquas/Files/checklistConquasSubmission.pdf"]];
}

-(IBAction)btnChecklistGGBAClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/AppConquas/Files/checklistGreenAndGraciousBuildersAward.pdf"]];
}

-(IBAction)btnChecklistMarbleAndGraniteFinishesClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/AppConquas/Files/checklistMarbleAndGraniteFinishes.pdf"]];
}

-(IBAction)btnChecklistTimberFlooringClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/AppConquas/Files/checklistTimberFlooring.pdf"]];
}

-(IBAction)btnChecklistWaterproofingClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/AppConquas/Files/checklistWaterproofing.pdf"]];
}

-(IBAction)btnChecklistFormAClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/form_a.pdf"]];
}

-(IBAction)btnChecklistFormBClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/form_b.pdf"]];
}

-(IBAction)btnChecklistFormCClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/form_c.pdf"]];
}

-(IBAction)btnChecklistFormDClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/form_d.pdf"]];
}

-(IBAction)btnChecklistFormEClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/form_e.pdf"]];
}

-(IBAction)btnChecklistFormFClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/form_f.pdf"]];
}

-(IBAction)showGGBAItemInformation:(id)sender{
    
}
-(IBAction)updateGGBAScore:(id)sender{
    
    int intGreenPoints, intGraciousPoints, intInnovationPoints, intBonusPoints, intTotalPoints;
    
    intGreenPoints = 0;
    intGraciousPoints = 0;
    intInnovationPoints = 0;
    intBonusPoints = 0;
    intTotalPoints = 0;
    
    if (![txtGreen1.text isEqualToString:@""] && ![txtGreen1.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen1.text intValue];
    }
    if (![txtGreen2.text isEqualToString:@""] && ![txtGreen2.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen2.text intValue];
    }
    if (![txtGreen3.text isEqualToString:@""] && ![txtGreen3.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen3.text intValue];
    }
    if (![txtGreen4.text isEqualToString:@""] && ![txtGreen4.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen4.text intValue];
    }
    if (![txtGreen5.text isEqualToString:@""] && ![txtGreen5.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen5.text intValue];
    }
    if (![txtGreen6.text isEqualToString:@""] && ![txtGreen6.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen6.text intValue];
    }
    if (![txtGreen7.text isEqualToString:@""] && ![txtGreen7.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen7.text intValue];
    }
    if (![txtGreen8.text isEqualToString:@""] && ![txtGreen8.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen8.text intValue];
    }
    if (![txtGreen9.text isEqualToString:@""] && ![txtGreen9.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen9.text intValue];
    }
    if (![txtGreen10.text isEqualToString:@""] && ![txtGreen10.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen10.text intValue];
    }
    if (![txtGreen11.text isEqualToString:@""] && ![txtGreen11.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen11.text intValue];
    }
    if (![txtGreen12.text isEqualToString:@""] && ![txtGreen12.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen12.text intValue];
    }
    if (![txtGreen13.text isEqualToString:@""] && ![txtGreen13.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen13.text intValue];
    }
    if (![txtGreen14.text isEqualToString:@""] && ![txtGreen14.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen14.text intValue];
    }
    if (![txtGreen15.text isEqualToString:@""] && ![txtGreen15.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen15.text intValue];
    }
    if (![txtGreen16.text isEqualToString:@""] && ![txtGreen16.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen16.text intValue];
    }
    if (![txtGreen17.text isEqualToString:@""] && ![txtGreen17.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen17.text intValue];
    }
    if (![txtGreen18.text isEqualToString:@""] && ![txtGreen18.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen18.text intValue];
    }
    if (![txtGreen19.text isEqualToString:@""] && ![txtGreen19.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen19.text intValue];
    }
    if (![txtGreen20.text isEqualToString:@""] && ![txtGreen20.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen20.text intValue];
    }
    if (![txtGreen21.text isEqualToString:@""] && ![txtGreen21.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen21.text intValue];
    }
    if (![txtGreen22.text isEqualToString:@""] && ![txtGreen22.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen22.text intValue];
    }
    if (![txtGreen23.text isEqualToString:@""] && ![txtGreen23.text isEqualToString:@"0"]) {
        intGreenPoints = intGreenPoints + [txtGreen23.text intValue];
    }
    
    if (![txtGracious1.text isEqualToString:@""] && ![txtGracious1.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious1.text intValue];
    }
    if (![txtGracious2.text isEqualToString:@""] && ![txtGracious2.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious2.text intValue];
    }
    if (![txtGracious3.text isEqualToString:@""] && ![txtGracious3.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious3.text intValue];
    }
    if (![txtGracious4.text isEqualToString:@""] && ![txtGracious4.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious4.text intValue];
    }
    if (![txtGracious5.text isEqualToString:@""] && ![txtGracious5.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious5.text intValue];
    }
    if (![txtGracious6.text isEqualToString:@""] && ![txtGracious6.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious6.text intValue];
    }
    if (![txtGracious7.text isEqualToString:@""] && ![txtGracious7.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious7.text intValue];
    }
    if (![txtGracious8.text isEqualToString:@""] && ![txtGracious8.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious8.text intValue];
    }
    if (![txtGracious9.text isEqualToString:@""] && ![txtGracious9.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious9.text intValue];
    }
    if (![txtGracious10.text isEqualToString:@""] && ![txtGracious10.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious10.text intValue];
    }
    if (![txtGracious11.text isEqualToString:@""] && ![txtGracious11.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious11.text intValue];
    }
    if (![txtGracious12.text isEqualToString:@""] && ![txtGracious12.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious12.text intValue];
    }
    if (![txtGracious13.text isEqualToString:@""] && ![txtGracious13.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious13.text intValue];
    }
    if (![txtGracious14.text isEqualToString:@""] && ![txtGracious14.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious14.text intValue];
    }
    if (![txtGracious15.text isEqualToString:@""] && ![txtGracious15.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious15.text intValue];
    }
    if (![txtGracious16.text isEqualToString:@""] && ![txtGracious16.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious16.text intValue];
    }
    if (![txtGracious17.text isEqualToString:@""] && ![txtGracious17.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious17.text intValue];
    }
    if (![txtGracious18.text isEqualToString:@""] && ![txtGracious18.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious18.text intValue];
    }
    if (![txtGracious19.text isEqualToString:@""] && ![txtGracious19.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious19.text intValue];
    }
    if (![txtGracious20.text isEqualToString:@""] && ![txtGracious20.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious20.text intValue];
    }
    if (![txtGracious21.text isEqualToString:@""] && ![txtGracious21.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious21.text intValue];
    }
    if (![txtGracious22.text isEqualToString:@""] && ![txtGracious22.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious22.text intValue];
    }
    if (![txtGracious23.text isEqualToString:@""] && ![txtGracious23.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious23.text intValue];
    }
    if (![txtGracious24.text isEqualToString:@""] && ![txtGracious24.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious24.text intValue];
    }
    if (![txtGracious25.text isEqualToString:@""] && ![txtGracious25.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious25.text intValue];
    }
    if (![txtGracious26.text isEqualToString:@""] && ![txtGracious26.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious26.text intValue];
    }
    if (![txtGracious27.text isEqualToString:@""] && ![txtGracious27.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious27.text intValue];
    }
    if (![txtGracious28.text isEqualToString:@""] && ![txtGracious28.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious28.text intValue];
    }
    if (![txtGracious29.text isEqualToString:@""] && ![txtGracious29.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious29.text intValue];
    }
    if (![txtGracious30.text isEqualToString:@""] && ![txtGracious30.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious30.text intValue];
    }
    if (![txtGracious31.text isEqualToString:@""] && ![txtGracious31.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious31.text intValue];
    }
    if (![txtGracious32.text isEqualToString:@""] && ![txtGracious32.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious32.text intValue];
    }
    if (![txtGracious33.text isEqualToString:@""] && ![txtGracious33.text isEqualToString:@"0"]) {
        intGraciousPoints = intGraciousPoints + [txtGracious33.text intValue];
    }
    
    if (![txtInnovation1.text isEqualToString:@""] && ![txtInnovation1.text isEqualToString:@"0"]) {
        intInnovationPoints = intInnovationPoints + [txtInnovation1.text intValue];
    }
    
    if (![txtBonus1.text isEqualToString:@""] && ![txtBonus1.text isEqualToString:@"0"]) {
        intBonusPoints = intBonusPoints + [txtBonus1.text intValue];
    }
    
    intTotalPoints = intGreenPoints + intGraciousPoints + intInnovationPoints + intBonusPoints;
    
    lblGreenPoints.text = [NSString stringWithFormat:@"%i", intGreenPoints];
    lblGraciousPoints.text = [NSString stringWithFormat:@"%i", intGraciousPoints];
    lblInnovationPoints.text = [NSString stringWithFormat:@"%i", intInnovationPoints];
    lblBonusPoints.text = [NSString stringWithFormat:@"%i", intBonusPoints];
    lblTotalPoints.text = [NSString stringWithFormat:@"%i", intTotalPoints];
    lblMainPoints.text = [NSString stringWithFormat:@"%i Points", intTotalPoints];
    
    if (intTotalPoints>90) {
        lblScore.text = @"STAR";
    } else if (intTotalPoints>75 && intTotalPoints<=90) {
        lblScore.text = @"EXCELLENT";
    } else if (intTotalPoints>60 && intTotalPoints<=75) {
        lblScore.text = @"MERIT";
    } else if (intTotalPoints>=50 && intTotalPoints<=60) {
        lblScore.text = @"CERTIFIED";
    } else {
        lblScore.text = @"N/A";
    }

    
}
-(IBAction)btnGGBAButtonsClicked:(id)sender{
    UIButton *tempButton = (UIButton *)sender;
    NSString *tempButtonTitle = tempButton.currentTitle;
    if ([tempButtonTitle isEqualToString:@"Green"]) {
        svGreen.hidden = false;
        svGracious.hidden = true;
        svInnovation.hidden = true;
        svBonus.hidden = true;
        svSummary.hidden = true;
    } else if ([tempButtonTitle isEqualToString:@"Gracious"]) {
        svGreen.hidden = true;
        svGracious.hidden = false;
        svInnovation.hidden = true;
        svBonus.hidden = true;
        svSummary.hidden = true;
    } else if ([tempButtonTitle isEqualToString:@"Innovation"]) {
        svGreen.hidden = true;
        svGracious.hidden = true;
        svInnovation.hidden = false;
        svBonus.hidden = true;
        svSummary.hidden = true;
    } else if ([tempButtonTitle isEqualToString:@"Bonus"]) {
        svGreen.hidden = true;
        svGracious.hidden = true;
        svInnovation.hidden = true;
        svBonus.hidden = false;
        svSummary.hidden = true;
    } else if ([tempButtonTitle isEqualToString:@"Summary"]) {
        svGreen.hidden = true;
        svGracious.hidden = true;
        svInnovation.hidden = true;
        svBonus.hidden = true;
        svSummary.hidden = false;
    }
    
    [svGreen setScrollEnabled:YES];
    [svGreen setContentSize:CGSizeMake(745,1350)];
    [svGracious setScrollEnabled:YES];
    [svGracious setContentSize:CGSizeMake(745,2000)];
    [svInnovation setScrollEnabled:YES];
    [svInnovation setContentSize:CGSizeMake(745,400)];

}


- (IBAction)resetAllTxt:(id)sender {
    
txtGreen1.text=@"";
txtGreen2.text=@"";
txtGreen3.text=@"";
txtGreen4.text=@"";
txtGreen5.text=@"";
txtGreen6.text=@"";
txtGreen7.text=@"";
txtGreen8.text=@"";
txtGreen9.text=@"";
txtGreen10.text=@"";
txtGreen11.text=@"";
txtGreen12.text=@"";
txtGreen13.text=@"";
txtGreen14.text=@"";
txtGreen15.text=@"";
txtGreen16.text=@"";
txtGreen17.text=@"";
txtGreen18.text=@"";
txtGreen19.text=@"";
txtGreen20.text=@"";
txtGreen21.text=@"";
txtGreen22.text=@"";
txtGreen23.text=@"";
txtGracious1.text=@"";
txtGracious2.text=@"";
txtGracious3.text=@"";
txtGracious4.text=@"";
txtGracious5.text=@"";
txtGracious6.text=@"";
txtGracious7.text=@"";
txtGracious8.text=@"";
txtGracious9.text=@"";
txtGracious10.text=@"";
txtGracious11.text=@"";
txtGracious12.text=@"";
txtGracious13.text=@"";
txtGracious14.text=@"";
txtGracious15.text=@"";
txtGracious16.text=@"";
txtGracious17.text=@"";
txtGracious18.text=@"";
txtGracious19.text=@"";
txtGracious20.text=@"";
txtGracious21.text=@"";
txtGracious22.text=@"";
txtGracious23.text=@"";
txtGracious24.text=@"";
txtGracious25.text=@"";
txtGracious26.text=@"";
txtGracious27.text=@"";
txtGracious28.text=@"";
txtGracious29.text=@"";
txtGracious30.text=@"";
txtGracious31.text=@"";
txtGracious32.text=@"";
txtGracious33.text=@"";
txtInnovation1.text=@"";
txtBonus1.text=@"";
lblScore.text=@"";
lblBonusPoints.text=@"";
lblGraciousPoints.text=@"";
lblGreenPoints.text=@"";
lblInnovationPoints.text=@"";
lblTotalPoints.text=@"";
lblMainPoints.text=@"";
    
    





}
@end
