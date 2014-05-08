//
//  SendTwitterViewController.h
//  Maperize
//
//  Created by VINICIUS RESENDE FIALHO on 02/04/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import "ViewController.h"

@interface SendTwitterViewController : UIViewController

@property NSString *nomeTwitter;
@property  NSString *imageString;

- (IBAction)buttonTwetar:(id)sender;


- (IBAction)buttonProject:(id)sender;
- (IBAction)buttonCET:(id)sender;
- (IBAction)buttonBomb:(id)sender;

@end
