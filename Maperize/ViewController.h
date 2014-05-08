//
//  ViewController.h
//  Maperize
//
//  Created by EMERSON DE SOUZA BARROS on 26/03/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "STTwitter.h"
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate , UITextFieldDelegate, UISearchBarDelegate,UITableViewDataSource, UITableViewDelegate > {
    //API do twiiter
    STTwitterAPI *twitter;
    BOOL currDirection;
}
+(ViewController*)sharedManager;

@property int gambiBotaoRadar;
@property int gambiBotaoRadar2;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityTime;

@property (weak, nonatomic) IBOutlet UIView *topView;


@property int rotaAPintar;
@property UIColor *corPriRota, *corSegRota, *corTerRota;
@property (weak, nonatomic) IBOutlet UIView *viewGesture;
@property UISwipeGestureRecognizer *swipe;
@property int gambi;
@property BOOL achouObstaculo;
@property NSDate *dataBrasil;


//Tipo do mapa
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipoMapa;
- (IBAction)escolhaTipoDoMapa:(id)sender;

//Mapa e pesquisa
@property (weak, nonatomic) IBOutlet MKMapView *mapaBacana;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

//Passo a passo da rota
@property (weak, nonatomic) IBOutlet UITableView *tabelaDeDirecoes;
@property MKDirectionsResponse *direcoesPorRota;
@property int numeroDeRotas;
@property (weak, nonatomic) IBOutlet UIView *menuView;



//Rota
@property (weak, nonatomic) IBOutlet UITextField *txtPartida;
@property (weak, nonatomic) IBOutlet UITextField *txtDestino;
@property (weak, nonatomic) IBOutlet UILabel *lblRota;
@property (weak, nonatomic) IBOutlet UIButton *outAddRota;
- (IBAction)addRota:(id)sender;

//Pinos de ínicio e destino para rota
@property (strong, nonatomic) MKMapItem *inicio;
@property (strong, nonatomic) MKMapItem *destino;

//Linha que ligará os pontos de rota
@property (strong, nonatomic) MKPolylineRenderer *linha;

//Recebe o resultados do twitter
@property (nonatomic, strong) NSArray *results;

@end
