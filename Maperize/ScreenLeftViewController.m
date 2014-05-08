//
//  ScreenLeftViewController.m
//  Maperize
//
//  Created by Vinicius Resende Fialho on 04/04/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ScreenLeftViewController.h"
#import "Usuario.h"
#import "DataBaseCoordenadaRadares.h"

@interface ScreenLeftViewController ()

@end

@implementation ScreenLeftViewController

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);



- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if([ViewController sharedManager].gambiBotaoRadar==0){
        self.AddRadarFixoHidden.hidden = YES;
        self.RemoveRadarFixoHidden.hidden = NO;
    }else{
        self.AddRadarFixoHidden.hidden = NO;
        self.RemoveRadarFixoHidden.hidden = YES;
    }
    
    if([ViewController sharedManager].gambiBotaoRadar2==0){
        self.AddRadarMovelHidden.hidden = YES;
        self.RemoveRadarMovelhidden.hidden = NO;
    }else{
        self.AddRadarMovelHidden.hidden = NO;
        self.RemoveRadarMovelhidden.hidden = YES;
    }
    
}

-(void)viewDidAppear:(BOOL)animated{
     [super viewDidAppear:animated];
    [self locationMana];
    [self pegarDadosTransitoCET];

}

-(void)viewDidDisappear:(BOOL)animated{
     [super viewDidDisappear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationMana{
    
    CLGeocoder *ceo = [[CLGeocoder alloc]init];
    CLLocationCoordinate2D coord = [[Usuario sharedManager]locUsuario];
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:coord.latitude  longitude:coord.longitude] ;
    
    [ceo reverseGeocodeLocation: loc completionHandler:
     ^(NSArray *placemarks, NSError *error) {
         CLPlacemark *placemark = [placemarks objectAtIndex:0];
         //NSLog(@"placemark %@",placemark);
         //String to hold address
         //NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
         //NSLog(@"addressDictionary %@", placemark.addressDictionary);
//         NSLog(@"Cidade %@",placemark.locality); // Extract the city name
//         NSLog(@"Rua %@",placemark.name);
//         NSLog(@"Bairro %@",placemark.subLocality);
         //NSLog(@"location %@",placemark.location);
         
         self.localizacao = [NSString stringWithFormat:@"%@%@%@",placemark.subLocality,@", ",placemark.name];
         
         
     }];
    
}


- (IBAction)buttonTwetar:(id)sender {
   
   
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Tweeting from my own app! :)"];
        
        
        [tweetSheet addImage:self.imageView.image];
        
      
        NSString *endereco = [NSString stringWithFormat:@"%@%@%@%@",self.nomeTwitter,@" ",self.localizacao,@", "];
        [tweetSheet setInitialText:endereco];
        

        
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (IBAction)buttonProject:(id)sender {
      self.nomeTwitter = @"@ProjetoSdkIOS";
}

- (IBAction)buttonCET:(id)sender {
        self.nomeTwitter = @"@CETSP_";
}

- (IBAction)buttonBomb:(id)sender {
      self.nomeTwitter = @"@BombeirosPMESP";
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    self.imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self.imageView setImage:self.imageView.image];
    
    // UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    
    [self dismissViewControllerAnimated:YES completion:nil];
  
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


-(void)pegarDadosTransitoCET{
 
    NSString* url = @"http://www.cetsp.com.br/";
    NSURL* query = [NSURL URLWithString:url];
    NSString* result = [NSString stringWithContentsOfURL:query encoding:NSUTF8StringEncoding error:nil];
  
    
    NSString *string=result;
    NSRange searchFromRange = [string rangeOfString:@"<body>"];
    NSRange searchToRange = [string rangeOfString:@"</body>"];
    NSString *substring = [string substringWithRange:NSMakeRange(searchFromRange.location+searchFromRange.length, searchToRange.location-searchFromRange.location-searchFromRange.length)];
    
    NSString *stringFinal = substring;
    
    NSRange continua =[stringFinal rangeOfString:@"<div class=\"boxZona"];
    int i=0;
 
    while(continua.location != NSNotFound){
        i +=1;
        
        stringFinal = [stringFinal substringFromIndex:continua.location];
        stringFinal = [stringFinal substringFromIndex:[stringFinal rangeOfString:@"<h4>"].location+4];
        NSString *vra = [stringFinal substringToIndex:[stringFinal rangeOfString:@"</h4>"].location-2];
        
        switch (i) {
            case 1:
                self.label1.text = vra;
                break;
            case 2:
                self.label2.text = vra;
                break;
            case 3:
                self.label3.text = vra;
                break;
            case 4:
                self.label4.text = vra;
                break;
            case 5:
                self.label5.text = vra;
                break;
                
            default:
                break;
        }
               
        continua = [stringFinal rangeOfString:@"<div class=\"boxZona"];
        
        
        
    }
    
    continua = [stringFinal rangeOfString:@"<div class=\"boxZona"];
}


-(void)pegarDadosVariadosSP{
    
    NSString* url = @"http://www.capital.sp.gov.br/portal/";
    NSURL* query = [NSURL URLWithString:url];
    NSString* result = [NSString stringWithContentsOfURL:query encoding:NSUTF8StringEncoding error:nil];
    
    
    NSString *string=result;
    NSRange searchFromRange = [string rangeOfString:@""];
    NSRange searchToRange = [string rangeOfString:@"<!-- Aeroportos -->"];
    NSString *substring = [string substringWithRange:NSMakeRange(searchFromRange.location+searchFromRange.length, searchToRange.location-searchFromRange.location-searchFromRange.length)];
    
    NSString *stringFinal = substring;
    NSLog(@"string %@",stringFinal);
    
//    stringFinal = [stringFinal substringFromIndex:[stringFinal rangeOfString:@"<b"].location+4];
//    NSString *vra = [stringFinal substringToIndex:[stringFinal rangeOfString:@"</b>"].location-2];
//    NSLog(@"string %@",vra);
   
}

- (IBAction)buttonAddRadarFixo:(id)sender {
    
    [[[ViewController sharedManager]mapaBacana]addAnnotations:[[DataBaseCoordenadaRadares sharedManager]marcarPosicaoNoMapaRadarFixo] ];
    
    
    self.AddRadarFixoHidden.hidden = YES;
    self.RemoveRadarFixoHidden.hidden = NO;
    
   [ViewController sharedManager].gambiBotaoRadar = 0;
    
}

- (IBAction)buttonRemoveRadarFixo:(id)sender {
    

   [[[ViewController sharedManager]mapaBacana] removeAnnotations:[[DataBaseCoordenadaRadares sharedManager]listCoord]];
    
    [[[ViewController sharedManager]mapaBacana]reloadInputViews];
    [[[ViewController sharedManager]mapaBacana]setNeedsDisplay];
    [[[ViewController sharedManager]mapaBacana]setNeedsLayout];
    
    self.AddRadarFixoHidden.hidden = NO;
    self.RemoveRadarFixoHidden.hidden = YES;
    
    [ViewController sharedManager].gambiBotaoRadar = 1;
}


- (IBAction)buttonRemoveRadarMovel:(id)sender {
   
    [[[ViewController sharedManager]mapaBacana] removeAnnotations:[[DataBaseCoordenadaRadares sharedManager]listCoordRadarMovel]];
    
    [[[ViewController sharedManager]mapaBacana]reloadInputViews];
    [[[ViewController sharedManager]mapaBacana]setNeedsDisplay];
    [[[ViewController sharedManager]mapaBacana]setNeedsLayout];
    
    self.AddRadarMovelHidden.hidden = NO;
    self.RemoveRadarMovelhidden.hidden = YES;
    
    [ViewController sharedManager].gambiBotaoRadar2 = 1;
    
}


- (IBAction)buttonAddRadarMovel:(id)sender {
    
    [[[ViewController sharedManager]mapaBacana]addAnnotations:[[DataBaseCoordenadaRadares sharedManager]marcarPosicaoNoMapaRadarMovel] ];
    
    self.AddRadarMovelHidden.hidden = YES;
    self.RemoveRadarMovelhidden.hidden = NO;
    
    [ViewController sharedManager].gambiBotaoRadar2 = 0;
    
}




@end








