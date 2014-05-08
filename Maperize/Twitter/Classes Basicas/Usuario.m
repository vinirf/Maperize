//
//  Usuario.m
//  TwitterSDK
//
//  Created by VINICIUS RESENDE FIALHO on 26/03/14.
//  Copyright (c) 2014 VINICIUS RESENDE FIALHO. All rights reserved.
//

#import "Usuario.h"


@implementation Usuario

+(Usuario*)sharedManager{
    static Usuario *unicoUsuario = nil;
    if(!unicoUsuario){
        unicoUsuario = [[super allocWithZone:nil]init];
    }
    return unicoUsuario;
}

-(id)init{
    self = [super init];
    if(self){
        self.listaRotas= [[NSMutableArray alloc]init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

-(void)setaPosicaoUsuario:(CLLocationCoordinate2D)posUsuario{
    self.locUsuario = posUsuario;
}

-(NSMutableArray*)SerializarRotasDoSistema{
    
    //    Categoria *cat = [[Categoria alloc]init];
    //    [cat setNome:@"Nenhuma"];
    //    Tarefa *taf = [[Tarefa alloc]init];
    //    [taf setNome:@"Bem Vindo"];
    //    [taf setCat:cat];
    //    [taf setPreco:0.0];
    //    [taf setData:@"00/00/0000"];
    
    
    
    //    [[self listaPessoasSistema]addObject:user1];
    
    
    return [self listaRotas];
    
}


@end
