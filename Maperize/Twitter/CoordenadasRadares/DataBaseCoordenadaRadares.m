//
//  DataBaseCoordenadaRadares.m
//  TwitterSDK
//
//  Created by VINICIUS RESENDE FIALHO on 27/03/14.
//  Copyright (c) 2014 VINICIUS RESENDE FIALHO. All rights reserved.
//

#import "DataBaseCoordenadaRadares.h"

@implementation DataBaseCoordenadaRadares


+(DataBaseCoordenadaRadares*)sharedManager{
    static DataBaseCoordenadaRadares *unicoDataCoordRadar = nil;
    if(!unicoDataCoordRadar){
        unicoDataCoordRadar = [[super allocWithZone:nil]init];
    }
    return unicoDataCoordRadar;
}

-(id)init{
    self = [super init];
    if(self){
        self.listaCoordenadasRadarFixo= [[NSMutableArray alloc]init];
        self.listaCoordenadasRadarMovel= [[NSMutableArray alloc]init];
        self.listaCoordenadasSemaforoCamera= [[NSMutableArray alloc]init];
        self.listaCoordenadasSemaforoRadar= [[NSMutableArray alloc]init];
        self.listaCoordenadasPoliciaRodoviaria= [[NSMutableArray alloc]init];
        self.listaCoordenadasPedagio= [[NSMutableArray alloc]init];
        self.listaCoordenadasLompada= [[NSMutableArray alloc]init];
        
        self.listCoord = [[NSMutableArray alloc]init];
        self.listCoordRadarMovel = [[NSMutableArray alloc]init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

-(NSMutableArray*)SerializarCoordenadasRadarDoSistema{
    
    
    NSString *ar = [[DataBaseCoordenadaRadares sharedManager]getFile];
    NSArray *atxt = [ar componentsSeparatedByString:@"\n"];
    NSArray *separaCord1;
    
    for(int i=0;i<atxt.count -1;i++){
        
        separaCord1 = [[atxt objectAtIndex:i ] componentsSeparatedByString:@","];
        
        CoordenadaRadares *cordRad = [[CoordenadaRadares alloc]init];
        cordRad.latitude = [[separaCord1 objectAtIndex:0]floatValue];
        cordRad.longitude = [[separaCord1 objectAtIndex:1]floatValue];
        cordRad.speeds = [[separaCord1 objectAtIndex:3]integerValue];
        cordRad.typesN = [[separaCord1 objectAtIndex:2]integerValue];
        cordRad.direction =  [[separaCord1 objectAtIndex:4]integerValue];
        cordRad.dirType = [[separaCord1 objectAtIndex:5]integerValue];
        
       
        //X,Y,TYPE,SPEED,DirType,Direction
        
        
        switch ([[separaCord1 objectAtIndex:2]integerValue]) {
            case 8:
                 [[[DataBaseCoordenadaRadares sharedManager] listaCoordenadasLompada]addObject:cordRad];
                break;
                
            case 14:
                [[[DataBaseCoordenadaRadares sharedManager] listaCoordenadasPedagio]addObject:cordRad];
                break;
            case 7:
                [[[DataBaseCoordenadaRadares sharedManager] listaCoordenadasPoliciaRodoviaria]addObject:cordRad];
                break;
                
            case 1:
                [[[DataBaseCoordenadaRadares sharedManager] listaCoordenadasRadarFixo]addObject:cordRad];
                break;
                
            case 5:
                [[[DataBaseCoordenadaRadares sharedManager] listaCoordenadasRadarMovel]addObject:cordRad];
                break;
                
            case 3:
                [[[DataBaseCoordenadaRadares sharedManager] listaCoordenadasSemaforoCamera]addObject:cordRad];
                break;
            
            case 2:
                [[[DataBaseCoordenadaRadares sharedManager] listaCoordenadasSemaforoRadar]addObject:cordRad];
                break;
                
            default:
                NSLog(@"Saiu fora");
                break;
        }
    
        
    }
    
    
    
    return [self listaCoordenadasRadarFixo];
    
}


- (NSString*)getFile {
    

    NSString* path = [[NSBundle mainBundle] pathForResource:@"maparadar_todos_SP"
                                                     ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    return content;
}



-(NSMutableArray*)marcarPosicaoNoMaparPoliciaRodoviaria{
    
   
     NSMutableArray *listcoord = [[NSMutableArray alloc]init];
    
    for(int i=0;i<[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasPoliciaRodoviaria]count];i++){
        
        CLLocationCoordinate2D localizacao;
        MKPointAnnotation *ponto = [[MKPointAnnotation alloc] init];
        
        //Guarda a latitude e longitude para marcação no mapa
        localizacao.latitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasPoliciaRodoviaria]objectAtIndex:i] longitude ];
        localizacao.longitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasPoliciaRodoviaria]objectAtIndex:i]latitude  ];
        
        ponto.coordinate = localizacao;
        NSString *s = [NSString stringWithFormat:@"%2.f",[[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasPoliciaRodoviaria]objectAtIndex:i]speeds ]];
        ponto.title = s;
        
        //Zoom no ponto
        ponto.coordinate = localizacao;
        
        
        [listcoord addObject:ponto];
        
        
        NSLog(@"%d",i);
        
    }
    
   return listcoord;
    
}

-(NSMutableArray*)marcarPosicaoNoMaparLomapada{
    
    
     NSMutableArray *listcoord = [[NSMutableArray alloc]init];
    
    for(int i=0;i<[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasLompada]count];i++){
        
        CLLocationCoordinate2D localizacao;
       MKPointAnnotation *ponto = [[MKPointAnnotation alloc] init];
        
        //Guarda a latitude e longitude para marcação no mapa
        localizacao.latitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasLompada]objectAtIndex:i] longitude ];
        localizacao.longitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasLompada]objectAtIndex:i]latitude  ];
        
        ponto.coordinate = localizacao;
        NSString *s = [NSString stringWithFormat:@"%2.f",[[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasLompada]objectAtIndex:i]speeds ]];
        ponto.title = s;
        
        //Zoom no ponto
        ponto.coordinate = localizacao;
        
      [listcoord addObject:ponto];
        
        NSLog(@"%d",i);
        
    }
    return listcoord;
}

-(NSMutableArray*)marcarPosicaoNoMaparPedagio{
    
    
     NSMutableArray *listcoord = [[NSMutableArray alloc]init];
    
    for(int i=0;i<[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasPedagio]count];i++){
        
        CLLocationCoordinate2D localizacao;
       MKPointAnnotation *ponto = [[MKPointAnnotation alloc] init];
        
        //Guarda a latitude e longitude para marcação no mapa
        localizacao.latitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasPedagio]objectAtIndex:i] longitude ];
        localizacao.longitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasPedagio]objectAtIndex:i]latitude  ];
        
        ponto.coordinate = localizacao;
        NSString *s = [NSString stringWithFormat:@"%2.f",[[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasPedagio]objectAtIndex:i]speeds ]];
        ponto.title = s;
        
        //Zoom no ponto
        ponto.coordinate = localizacao;
        
       [listcoord addObject:ponto];
        
        NSLog(@"%d",i);
        
    }
    return listcoord;
}

-(NSMutableArray*)marcarPosicaoNoMapaRadarFixo{

    
    for(int i=0;i<[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasRadarFixo]count];i++){
        
        CLLocationCoordinate2D localizacao;
        MKPointAnnotation *ponto = [[MKPointAnnotation alloc] init];

        
        //Guarda a latitude e longitude para marcação no mapa
        localizacao.latitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasRadarFixo]objectAtIndex:i] longitude ];
        localizacao.longitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasRadarFixo]objectAtIndex:i]latitude  ];
        
        
        ponto.coordinate = localizacao;
        NSString *s = [NSString stringWithFormat:@"%2.f",[[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasRadarFixo]objectAtIndex:i]speeds ]];
        ponto.subtitle = s;
        
        
        NSString *ss = [NSString stringWithFormat:@"%d",[[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasRadarFixo]objectAtIndex:i]typesN ]];
        ponto.title = ss;
       
        
        [self.listCoord addObject:ponto];
        
        //NSLog(@"%d",i);
        
    }
    return self.listCoord;
}

-(NSMutableArray*)marcarPosicaoNoMapaRadarMovel{
  
    
    for(int i=0;i<[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasRadarMovel]count];i++){
        
        CLLocationCoordinate2D localizacao;
         MKPointAnnotation *ponto = [[MKPointAnnotation alloc] init];
        
        //Guarda a latitude e longitude para marcação no mapa
        localizacao.latitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasRadarMovel]objectAtIndex:i] longitude ];
        localizacao.longitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasRadarMovel]objectAtIndex:i]latitude  ];
        
        ponto.coordinate = localizacao;
        NSString *s = [NSString stringWithFormat:@"%2.f",[[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasRadarMovel]objectAtIndex:i]speeds ]];
        ponto.subtitle = s;
        
        //Zoom no ponto
        ponto.coordinate = localizacao;
        
        NSString *ss = [NSString stringWithFormat:@"%d",[[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasRadarMovel]objectAtIndex:i]typesN ]];
        ponto.title = ss;

        
        [self.listCoordRadarMovel addObject:ponto];
        
        NSLog(@"%d",i);
        
    }
    return self.listCoordRadarMovel;
}

-(NSMutableArray*)marcarPosicaoNoMapaSemafaroComCamera{
    
   
     NSMutableArray *listcoord = [[NSMutableArray alloc]init];
    
    for(int i=0;i<[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasSemaforoCamera]count];i++){
        
        CLLocationCoordinate2D localizacao;
          MKPointAnnotation *ponto = [[MKPointAnnotation alloc] init];
        
        //Guarda a latitude e longitude para marcação no mapa
        localizacao.latitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasSemaforoCamera]objectAtIndex:i] longitude ];
        localizacao.longitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasSemaforoCamera]objectAtIndex:i]latitude  ];
        
        ponto.coordinate = localizacao;
        NSString *s = [NSString stringWithFormat:@"%2.f",[[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasSemaforoCamera]objectAtIndex:i]speeds ]];
        ponto.title = s;
        
        //Zoom no ponto
        ponto.coordinate = localizacao;
        
        [listcoord addObject:ponto];
        
        NSLog(@"%d",i);
        
    }
    return listcoord;
}

-(NSMutableArray*)marcarPosicaoNoMapaSemafaroComRadar{
    
    NSMutableArray *listcoord = [[NSMutableArray alloc]init];
    
    
    
    for(int i=0;i<[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasSemaforoRadar]count];i++){
        
        CLLocationCoordinate2D localizacao;
         MKPointAnnotation *ponto = [[MKPointAnnotation alloc] init];
        
        //Guarda a latitude e longitude para marcação no mapa
        localizacao.latitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasSemaforoRadar]objectAtIndex:i] longitude ];
        localizacao.longitude = [[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasSemaforoRadar]objectAtIndex:i]latitude  ];
        
        ponto.coordinate = localizacao;
        NSString *s = [NSString stringWithFormat:@"%2.f",[[[[DataBaseCoordenadaRadares sharedManager]listaCoordenadasSemaforoRadar]objectAtIndex:i]speeds ]];
        ponto.title = s;
        
        //Zoom no ponto
        ponto.coordinate = localizacao;
        
        [listcoord addObject:ponto];
        
        NSLog(@"%d",i);
        
    }
    
    return listcoord;
}




@end







