//
//  DataBaseCoordenada.m
//  TwitterSDK
//
//  Created by VINICIUS RESENDE FIALHO on 26/03/14.
//  Copyright (c) 2014 VINICIUS RESENDE FIALHO. All rights reserved.
//

#import "DataBaseCoordenada.h"


@implementation DataBaseCoordenada


+(DataBaseCoordenada*)sharedManager{
    static DataBaseCoordenada *unicoDataCoord = nil;
    if(!unicoDataCoord){
        unicoDataCoord = [[super allocWithZone:nil]init];
    }
    return unicoDataCoord;
}

-(id)init{
    self = [super init];
    if(self){
        self.listaCoordenadas= [[NSMutableArray alloc]init];
        self.listaCoordenadasLatLong= [[NSMutableArray alloc]init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


-(NSArray*)allItems{
    return [self listaCoordenadas];
}



-(void)criaCoordenada:(Coordenada *)coord{
    [[[DataBaseCoordenada sharedManager] listaCoordenadas]addObject:coord];
    
    for(int i=0;i<self.listaCoordenadas.count;i++){
//        NSLog(@"%@",coord.nomeCategoria);
//        NSLog(@"%@",coord.bairro);
//        NSLog(@"%@",coord.cep);
//        NSLog(@"r = %@",coord.rua);
//        NSLog(@"n= %@",coord.numero);
//        NSLog(@"%@",coord.descricao);
//        NSLog(@"%@",coord.hora);
//        NSLog(@"%@",coord.caminhoImagem);
//        NSLog(@"%@",coord.data);
//        NSLog(@"%d",coord.estado);
//        NSLog(@"\n\n");
    }
}

-(void)criaCoordenadaCET:(CoordenadaCet *)coord{
    [[[DataBaseCoordenada sharedManager] listaCoordenadas]addObject:coord];
    
}

-(void)criaCoordenadaCorpo:(CoordenadaCorpo *)coord {
    [[[DataBaseCoordenada sharedManager] listaCoordenadas]addObject:coord];
    
}

-(void)criaCoordenadaSiteCET:(CoordenadaCetSite *)coord{
    [[[DataBaseCoordenada sharedManager] listaCoordenadas]addObject:coord];
}


-(MKPointAnnotation*)marcarPosicaoNoMapaDiretoTwitterCadaProject:(Coordenada*)Coord{
    
    MKPointAnnotation *ponto = [[MKPointAnnotation alloc] init];
    CLGeocoder* geocoder = [[CLGeocoder alloc]init];
    NSString *ruaNumero = [NSString stringWithFormat:@"%@%@%@", [Coord rua],@" ", [Coord numero ]];
    
    NSLog(@" vPRO = %@",ruaNumero);
    
    [geocoder geocodeAddressString:ruaNumero completionHandler:^(NSArray* placemarks, NSError* error){
        for (CLPlacemark  *aPlacemark in placemarks) {
            
            CLLocationCoordinate2D localizacao;
            
            ponto.title = @"Project";
            ponto.subtitle = [Coord nomeCategoria];
            
            
            
            //Guarda a latitude e longitude para marcação no mapa
            NSString *latitude = [NSString stringWithFormat:@"%f", aPlacemark.location.coordinate.latitude];
            NSString *longitude = [NSString stringWithFormat:@"%f", aPlacemark.location.coordinate.longitude];
            localizacao.latitude = [latitude doubleValue];
            localizacao.longitude = [longitude doubleValue];
            
            
            CoodenadaLatitudeLongitude *cordll = [[CoodenadaLatitudeLongitude alloc]init];
            cordll.latitude = [latitude doubleValue];
            cordll.longitude = [longitude doubleValue];
            [[[DataBaseCoordenada sharedManager] listaCoordenadasLatLong]addObject:cordll];
            
            ponto.coordinate = localizacao;
            
            
        }
    }];
    
    return ponto;
}


-(MKPointAnnotation*)marcarPosicaoNoMapaDiretoTwitterCadaUmCET:(CoordenadaCet*)CoordCet{
    
     MKPointAnnotation *ponto = [[MKPointAnnotation alloc] init];
    CLGeocoder* geocoder = [[CLGeocoder alloc]init];
    NSString *ruaNumero = [NSString stringWithFormat:@"%@",[CoordCet rua]];
    
    NSLog(@" vCET = %@",ruaNumero);
    
    [geocoder geocodeAddressString:ruaNumero completionHandler:^(NSArray* placemarks, NSError* error){
        for (CLPlacemark  *aPlacemark in placemarks) {
            
            
            CLLocationCoordinate2D localizacao;
            ponto.title = @"CET";
            ponto.subtitle = [CoordCet nomeCategoria];
            
            //Guarda a latitude e longitude para marcação no mapa
            NSString *latitude = [NSString stringWithFormat:@"%f", aPlacemark.location.coordinate.latitude];
            NSString *longitude = [NSString stringWithFormat:@"%f", aPlacemark.location.coordinate.longitude];
            localizacao.latitude = [latitude doubleValue];
            localizacao.longitude = [longitude doubleValue];
            
            CoodenadaLatitudeLongitude *cordll = [[CoodenadaLatitudeLongitude alloc]init];
            cordll.latitude = [latitude doubleValue];
            cordll.longitude = [longitude doubleValue];
            [[[DataBaseCoordenada sharedManager] listaCoordenadasLatLong]addObject:cordll];
            
            ponto.coordinate = localizacao;
            
            
        }
    }];
    
     return ponto;
}

-(MKPointAnnotation*)marcarPosicaoNoMapaDiretoTwitterCadaUmCorpo:(CoordenadaCorpo*)CoordCet{
    
    MKPointAnnotation *ponto = [[MKPointAnnotation alloc] init];
    CLGeocoder* geocoder = [[CLGeocoder alloc]init];
    NSString *ruaNumero = [NSString stringWithFormat:@"%@",[CoordCet rua]];
    
    NSLog(@" vBOM = %@",ruaNumero);
    
    [geocoder geocodeAddressString:ruaNumero completionHandler:^(NSArray* placemarks, NSError* error){
        for (CLPlacemark  *aPlacemark in placemarks) {
            
            
            CLLocationCoordinate2D localizacao;
            ponto.title = @"Corpo";
            ponto.subtitle = [CoordCet nomeCategoria];
            
            //Guarda a latitude e longitude para marcação no mapa
            NSString *latitude = [NSString stringWithFormat:@"%f", aPlacemark.location.coordinate.latitude];
            NSString *longitude = [NSString stringWithFormat:@"%f", aPlacemark.location.coordinate.longitude];
            localizacao.latitude = [latitude doubleValue];
            localizacao.longitude = [longitude doubleValue];
            
            CoodenadaLatitudeLongitude *cordll = [[CoodenadaLatitudeLongitude alloc]init];
            cordll.latitude = [latitude doubleValue];
            cordll.longitude = [longitude doubleValue];
            [[[DataBaseCoordenada sharedManager] listaCoordenadasLatLong]addObject:cordll];
            
            ponto.coordinate = localizacao;
        
            
            
        }
    }];
    
    return ponto;
    
}


-(MKPointAnnotation*)marcarPosicaoNoMapaDiretoSiteCet:(CoordenadaCetSite*)CoordCet{
    
    MKPointAnnotation *ponto = [[MKPointAnnotation alloc] init];
    CLGeocoder* geocoder = [[CLGeocoder alloc]init];
    NSString *ruaNumero = [NSString stringWithFormat:@"%@",[CoordCet local]];
    
    NSString *s = [NSString stringWithFormat:@"%@%@%@",ruaNumero,@" ",@"São Paulo"];
    NSLog(@" site cet = %@",s);
    
    [geocoder geocodeAddressString:s completionHandler:^(NSArray* placemarks, NSError* error){
        for (CLPlacemark  *aPlacemark in placemarks) {
            
            
            CLLocationCoordinate2D localizacao;
            ponto.title = @"Site CET";
            ponto.subtitle = [CoordCet titulo];
            
            //Guarda a latitude e longitude para marcação no mapa
            NSString *latitude = [NSString stringWithFormat:@"%f", aPlacemark.location.coordinate.latitude];
            NSString *longitude = [NSString stringWithFormat:@"%f", aPlacemark.location.coordinate.longitude];
            localizacao.latitude = [latitude doubleValue];
            localizacao.longitude = [longitude doubleValue];
            
            CoodenadaLatitudeLongitude *cordll = [[CoodenadaLatitudeLongitude alloc]init];
            cordll.latitude = [latitude doubleValue];
            cordll.longitude = [longitude doubleValue];
            [[[DataBaseCoordenada sharedManager] listaCoordenadasLatLong]addObject:cordll];
            
//            NSLog(@"lat = %f",cordll.latitude);
//            NSLog(@"long = %f",cordll.longitude);
            
            ponto.coordinate = localizacao;
            
            
        }
    }];
    
    return ponto;

}


@end




