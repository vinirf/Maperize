//
//  DataBaseCoordenadaRadares.h
//  TwitterSDK
//
//  Created by VINICIUS RESENDE FIALHO on 27/03/14.
//  Copyright (c) 2014 VINICIUS RESENDE FIALHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoordenadaRadares.h"
#import <MapKit/MapKit.h>

@interface DataBaseCoordenadaRadares : NSObject {
    
}

@property NSMutableArray *listCoord;
@property NSMutableArray *listCoordRadarMovel;

@property NSMutableArray *listaCoordenadasRadarFixo;
@property NSMutableArray *listaCoordenadasRadarMovel;
@property NSMutableArray *listaCoordenadasSemaforoCamera;
@property NSMutableArray *listaCoordenadasSemaforoRadar;
@property NSMutableArray *listaCoordenadasPoliciaRodoviaria;
@property NSMutableArray *listaCoordenadasPedagio;
@property NSMutableArray *listaCoordenadasLompada;

-(NSMutableArray*)SerializarCoordenadasRadarDoSistema;

+(DataBaseCoordenadaRadares*)sharedManager;

-(NSString*)getFile;

-(NSMutableArray*)marcarPosicaoNoMaparPoliciaRodoviaria;
-(NSMutableArray*)marcarPosicaoNoMaparLomapada;
-(NSMutableArray*)marcarPosicaoNoMaparPedagio;
-(NSMutableArray*)marcarPosicaoNoMapaRadarFixo;
-(NSMutableArray*)marcarPosicaoNoMapaRadarMovel;
-(NSMutableArray*)marcarPosicaoNoMapaSemafaroComCamera;
-(NSMutableArray*)marcarPosicaoNoMapaSemafaroComRadar;
    
@end
