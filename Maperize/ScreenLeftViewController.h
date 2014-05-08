//
//  ScreenLeftViewController.h
//  Maperize
//
//  Created by Vinicius Resende Fialho on 04/04/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <Social/Social.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@interface ScreenLeftViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;



- (IBAction)buttonAddRadarFixo:(id)sender;
- (IBAction)buttonRemoveRadarFixo:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *AddRadarFixoHidden;
@property (weak, nonatomic) IBOutlet UIButton *RemoveRadarFixoHidden;


- (IBAction)buttonRemoveRadarMovel:(id)sender;
- (IBAction)buttonAddRadarMovel:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *AddRadarMovelHidden;
@property (weak, nonatomic) IBOutlet UIButton *RemoveRadarMovelhidden;




@property NSString *nomeTwitter;
@property  NSString *imageString;
@property  NSString *localizacao;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)buttonTwetar:(id)sender;


- (IBAction)buttonProject:(id)sender;
- (IBAction)buttonCET:(id)sender;
- (IBAction)buttonBomb:(id)sender;



- (IBAction)takePhoto:  (UIButton *)sender;
//- (IBAction)selectPhoto:(UIButton *)sender;

@end
