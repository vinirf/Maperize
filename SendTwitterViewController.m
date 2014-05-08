//
//  SendTwitterViewController.m
//  Maperize
//
//  Created by VINICIUS RESENDE FIALHO on 02/04/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "SendTwitterViewController.h"

@interface SendTwitterViewController ()

@end

@implementation SendTwitterViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonTwetar:(id)sender {
    if ([TWTweetComposeViewController canSendTweet])
    {
        TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
        [tweetSheet setInitialText:@"Coloque a descricao do problema e escolha"];
        
        if (self.imageString)
        {
            [tweetSheet addImage:[UIImage imageNamed:self.imageString]];
        }
        
        if (self.nomeTwitter)
        {
            [tweetSheet addURL:[NSURL URLWithString:self.nomeTwitter]];
        }
        
	    [self presentModalViewController:tweetSheet animated:YES];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Desculpe"
                                                            message:@"Voce nao pode logar se nao estiver com o twitter instalado e logado!"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    }

}

- (IBAction)buttonProject:(id)sender {
   //[[ViewController sharedManager] mapaBacana].userLocation.location.;
    self.nomeTwitter = @"@ProjetoSdkIOS";
}

- (IBAction)buttonCET:(id)sender {
    self.nomeTwitter = @"@CETSP_";
}

- (IBAction)buttonBomb:(id)sender {
    
}



@end






