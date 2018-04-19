//
//  ViewBooks.m
//  Conquas
//
//  Created by Aparna Reddy Challa on 29/08/12.
//  Copyright (c) 2012 MobTwo Pte Ltd. All rights reserved.
//

#import "ViewBooks.h"

@interface ViewBooks ()

@end

@implementation ViewBooks
@synthesize viewScrollBooks;

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
    //viewScrollBooks.frame = CGRectMake(0, 0, 320, 460);
    //[viewScrollBooks setContentSize:CGSizeMake(320, 995)];  
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

-(IBAction)btnBookCeramicTiling_1:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/CTiling/CForeword.pdf"]]; }
-(IBAction)btnBookCeramicTiling_2:(id)sender 
{ [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/CTiling/CAcknowledge.pdf"]]; }
-(IBAction)btnBookCeramicTiling_3:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/CTiling/CContent.pdf"]]; }
-(IBAction)btnBookCeramicTiling_4:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/CTiling/CIntroduction.pdf"]]; }
-(IBAction)btnBookCeramicTiling_5:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/CTiling/CChpt2R1.pdf"]]; }
-(IBAction)btnBookCeramicTiling_6:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/CTiling/CChpt3.pdf"]]; }
-(IBAction)btnBookCeramicTiling_7:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/CTiling/CChpt4.pdf"]]; }
-(IBAction)btnBookCeramicTiling_8:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/CTiling/CChpt5.pdf"]]; }
-(IBAction)btnBookCeramicTiling_9:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/CTiling/CChpt6.pdf"]]; }
-(IBAction)btnBookCeramicTiling_10:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/CTiling/CChpt7.pdf"]]; }
-(IBAction)btnBookCeramicTiling_11:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/CTiling/CAppendix.pdf"]]; }
-(IBAction)btnBookCeramicTiling_12:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/CTiling/CReferences.pdf"]]; }

-(IBAction)btnBookMarbleAndGraniteFinishes_1:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MForeword.pdf"]]; }
-(IBAction)btnBookMarbleAndGraniteFinishes_2:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MAcknowledge.pdf"]]; }
-(IBAction)btnBookMarbleAndGraniteFinishes_3:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MContent.pdf"]]; }
-(IBAction)btnBookMarbleAndGraniteFinishes_4:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MChpt1.pdf"]]; }
-(IBAction)btnBookMarbleAndGraniteFinishes_5:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MChpt2.pdf"]]; }
-(IBAction)btnBookMarbleAndGraniteFinishes_6:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MChpt3.pdf"]]; }
-(IBAction)btnBookMarbleAndGraniteFinishes_7:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MChpt4.pdf"]]; }
-(IBAction)btnBookMarbleAndGraniteFinishes_8:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MChpt5.pdf"]]; }
-(IBAction)btnBookMarbleAndGraniteFinishes_9:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MChpt6.pdf"]]; }
-(IBAction)btnBookMarbleAndGraniteFinishes_10:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MChpt7.pdf"]]; }
-(IBAction)btnBookMarbleAndGraniteFinishes_11:(id)sender { 
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MChpt8.pdf"]]; }
-(IBAction)btnBookMarbleAndGraniteFinishes_12:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MAppendix.pdf"]]; }
-(IBAction)btnBookMarbleAndGraniteFinishes_13:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/MGFinishes/MReferences.pdf"]]; }

-(IBAction)btnBookWaterproofingForInternalWetAreas_1:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAForeword.pdf"]]; }
-(IBAction)btnBookWaterproofingForInternalWetAreas_2:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAAcknowledge.pdf"]]; }
-(IBAction)btnBookWaterproofingForInternalWetAreas_3:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAContent.pdf"]]; }
-(IBAction)btnBookWaterproofingForInternalWetAreas_4:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAChpt1.pdf"]]; }
-(IBAction)btnBookWaterproofingForInternalWetAreas_5:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAChpt2.pdf"]]; }
-(IBAction)btnBookWaterproofingForInternalWetAreas_6:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAChpt3.pdf"]]; }
-(IBAction)btnBookWaterproofingForInternalWetAreas_7:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAChpt4.pdf"]]; }
-(IBAction)btnBookWaterproofingForInternalWetAreas_8:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAChpt5.pdf"]]; }
-(IBAction)btnBookWaterproofingForInternalWetAreas_9:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAChpt6.pdf"]]; }
-(IBAction)btnBookWaterproofingForInternalWetAreas_10:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAChpt7.pdf"]]; }
-(IBAction)btnBookWaterproofingForInternalWetAreas_11:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAChpt8.pdf"]]; }
-(IBAction)btnBookWaterproofingForInternalWetAreas_12:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAAppendix.pdf"]]; }
-(IBAction)btnBookWaterproofingForInternalWetAreas_13:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WIWAreas/WIWAReferences.pdf"]]; }

-(IBAction)btnBookPainting_1:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/Painting/PForeword.pdf"]]; }
-(IBAction)btnBookPainting_2:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/Painting/PAcknowledge.pdf"]]; }
-(IBAction)btnBookPainting_3:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/Painting/PContent.pdf"]]; }
-(IBAction)btnBookPainting_4:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/Painting/PIntroduction.pdf"]]; }
-(IBAction)btnBookPainting_5:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/Painting/PMaterialSelect.pdf"]]; }
-(IBAction)btnBookPainting_6:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/Painting/PDelivery.pdf"]]; }
-(IBAction)btnBookPainting_7:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/Painting/PPreparatory.pdf"]]; }
-(IBAction)btnBookPainting_8:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/Painting/PApplication.pdf"]]; }
-(IBAction)btnBookPainting_9:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/Painting/PCommondefects.pdf"]]; }
-(IBAction)btnBookPainting_10:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/Painting/PAppendix.pdf"]]; }
-(IBAction)btnBookPainting_11:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/Painting/PReference.pdf"]]; }

-(IBAction)btnBookWaterproofingForExternalWall_1:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WEWall/WEWForeword.pdf"]]; }
-(IBAction)btnBookWaterproofingForExternalWall_2:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WEWall/WEWAcknowledge.pdf"]]; }
-(IBAction)btnBookWaterproofingForExternalWall_3:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WEWall/WEWContent.pdf"]]; }
-(IBAction)btnBookWaterproofingForExternalWall_4:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WEWall/WEWChpt1.pdf"]]; }
-(IBAction)btnBookWaterproofingForExternalWall_5:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WEWall/WEWChpt2.pdf"]]; }
-(IBAction)btnBookWaterproofingForExternalWall_6:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WEWall/WEWChpt3.pdf"]]; }
-(IBAction)btnBookWaterproofingForExternalWall_7:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WEWall/WEWChpt4.pdf"]]; }
-(IBAction)btnBookWaterproofingForExternalWall_8:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WEWall/WEWChpt5.pdf"]]; }
-(IBAction)btnBookWaterproofingForExternalWall_9:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WEWall/WEWChpt6.pdf"]]; }
-(IBAction)btnBookWaterproofingForExternalWall_10:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WEWall/WEWAppendix.pdf"]]; }
-(IBAction)btnBookWaterproofingForExternalWall_11:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/WEWall/WEWReference.pdf"]]; }

-(IBAction)btnBookTimberFlooring_1:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFForeword.pdf"]]; }
-(IBAction)btnBookTimberFlooring_2:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFAcknowledge.pdf"]]; }
-(IBAction)btnBookTimberFlooring_3:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFContent.pdf"]]; }
-(IBAction)btnBookTimberFlooring_4:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFIntroduction.pdf"]]; }
-(IBAction)btnBookTimberFlooring_5:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFDesign.pdf"]]; }
-(IBAction)btnBookTimberFlooring_6:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFDelivery.pdf"]]; }
-(IBAction)btnBookTimberFlooring_7:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFPreparatory.pdf"]]; }
-(IBAction)btnBookTimberFlooring_8:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFInstallation.pdf"]]; }
-(IBAction)btnBookTimberFlooring_9:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFProtection.pdf"]]; }
-(IBAction)btnBookTimberFlooring_10:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFMaintenance.pdf"]]; }
-(IBAction)btnBookTimberFlooring_11:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFComplaint.pdf"]]; }
-(IBAction)btnBookTimberFlooring_12:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFAppendix.pdf"]]; }
-(IBAction)btnBookTimberFlooring_13:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/TFlooring/TFReference.pdf"]]; }

-(IBAction)btnBookAluminiumWindow_1:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWForeword.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_2:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWAcknowledge.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_3:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWContent.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_4:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWIntroduction.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_5:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWDesign.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_6:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWMaterial.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_7:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWFabrication.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_8:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWDelivery.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_9:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWPreparatory.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_10:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWInstallation.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_11:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWProtect.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_12:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWDefectsRemedies.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_13:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWAppendix.pdf"]]; }
-(IBAction)btnBookAluminiumWindow_14:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/Iquas/gpgs/AWindow/AWReferences.pdf"]]; }

-(IBAction)btnBookTimberDoors_1:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doorcontent.pdf"]]; }
-(IBAction)btnBookTimberDoors_2:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doorintroduction.pdf"]]; }
-(IBAction)btnBookTimberDoors_3:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doordesign.pdf"]]; }
-(IBAction)btnBookTimberDoors_4:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doormaterial.pdf"]]; }
-(IBAction)btnBookTimberDoors_5:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doorfabrication.pdf"]]; }
-(IBAction)btnBookTimberDoors_6:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doordelivery.pdf"]]; }
-(IBAction)btnBookTimberDoors_7:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doorpreparatory.pdf"]]; }
-(IBAction)btnBookTimberDoors_8:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doorinstallation.pdf"]]; }
-(IBAction)btnBookTimberDoors_9:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doorprotection.pdf"]]; }
-(IBAction)btnBookTimberDoors_10:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doordefects.pdf"]]; }
-(IBAction)btnBookTimberDoors_11:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doorappendixA.pdf"]]; }
-(IBAction)btnBookTimberDoors_12:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doorappendixB.pdf"]]; }
-(IBAction)btnBookTimberDoors_13:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/doorreferences.pdf"]]; }

-(IBAction)btnBookWardrobesAndKitchenCabinets_1:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/cabinetcontent.pdf"]]; }
-(IBAction)btnBookWardrobesAndKitchenCabinets_2:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/cabinetintroduction.pdf"]]; }
-(IBAction)btnBookWardrobesAndKitchenCabinets_3:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/cabinetdesign.pdf"]]; }
-(IBAction)btnBookWardrobesAndKitchenCabinets_4:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/cabinetmaterial.pdf"]]; }
-(IBAction)btnBookWardrobesAndKitchenCabinets_5:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/cabinetfabrication.pdf"]]; }
-(IBAction)btnBookWardrobesAndKitchenCabinets_6:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/cabinetdelivery.pdf"]]; }
-(IBAction)btnBookWardrobesAndKitchenCabinets_7:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/cabinetinstallation.pdf"]]; }
-(IBAction)btnBookWardrobesAndKitchenCabinets_8:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/cabinetprotection.pdf"]]; }
-(IBAction)btnBookWardrobesAndKitchenCabinets_9:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/cabinetappendixA.pdf"]]; }
-(IBAction)btnBookWardrobesAndKitchenCabinets_10:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/cabinetappendixB.pdf"]]; }
-(IBAction)btnBookWardrobesAndKitchenCabinets_11:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/cabinetreferences.pdf"]]; }

-(IBAction)btnBookPrecastConcreteElements_1:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/precastcontent.pdf"]]; }
-(IBAction)btnBookPrecastConcreteElements_2:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/precastintroduction.pdf"]]; }
-(IBAction)btnBookPrecastConcreteElements_3:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/precastdesign.pdf"]]; }
-(IBAction)btnBookPrecastConcreteElements_4:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/precastfabrication.pdf"]]; }
-(IBAction)btnBookPrecastConcreteElements_5:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/precastdelivery.pdf"]]; }
-(IBAction)btnBookPrecastConcreteElements_6:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/precastinstallation.pdf"]]; }
-(IBAction)btnBookPrecastConcreteElements_7:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/precastinspection.pdf"]]; }
-(IBAction)btnBookPrecastConcreteElements_8:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/precastdefect.pdf"]]; }
-(IBAction)btnBookPrecastConcreteElements_9:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/precastappendixA.pdf"]]; }
-(IBAction)btnBookPrecastConcreteElements_10:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/precastappendixB.pdf"]]; }
-(IBAction)btnBookPrecastConcreteElements_11:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Professionals/IQUAS/others/precastreferences.pdf"]]; }

-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_1:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/designforeword.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_2:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/designack.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_3:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/designcontent.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_4:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/designintro.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_5:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/Chapter1.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_6:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/Chapter2.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_7:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/Chapter3.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_8:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/Chapter4.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_9:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/Chapter5.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_10:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/Chapter6.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_11:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/Chapter7.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_12:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/Chapter8.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol1_13:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/ref.pdf"]]; }

-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_1:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2foreword.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_2:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2ack.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_3:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2content.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_4:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2intro.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_5:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch1.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_6:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch2.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_7:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch3.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_8:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch4.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_9:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch5.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_10:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch6.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_11:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch7.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_12:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch8.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_13:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch9.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_14:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch10.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_15:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch11.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_16:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch12.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_17:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2Ch13.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_18:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2proj.pdf"]]; }
-(IBAction)btnBookDesignAndMaterialSelectionForQualityVol2_19:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/Publications/EnhancementSeries/others/design2ref.pdf"]]; }

-(IBAction)btnConquasManual6thEdition:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/professionals/iquas/others/CON21.pdf"]]; }
-(IBAction)btnConquasManual7thEdition:(id)sender { [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.bca.gov.sg/professionals/iquas/others/CONQUAS_7edit.pdf"]]; }

-(IBAction)btnGGBSBookClicked:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.corenet.gov.sg/AppConquas/Files/bookGGBS.pdf"]];
}

/*@synthesize viewScrollBooks;

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
    [self setViewScrollBooks:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}*/

@end
