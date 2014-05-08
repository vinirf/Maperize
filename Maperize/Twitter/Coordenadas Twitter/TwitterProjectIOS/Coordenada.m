//
//  Coordenada.m
//  TwitterSDK
//
//  Created by VINICIUS RESENDE FIALHO on 26/03/14.
//  Copyright (c) 2014 VINICIUS RESENDE FIALHO. All rights reserved.
//

#import "Coordenada.h"
#import "Tweet.h"


@implementation Coordenada

-(id)initCoordenada:(Tweet *)twet{
    self = [super init];
    
    if(self){
        [self recebeTweetComDados:twet];
    }
    
    return self;
}


-(void)tranformaCepEmCardinal:(int)cep {
    self.latitude = 1;
    self.longitude =1;
}


-(void)recebeTweetComDados:(Tweet*)twet{
    
    self.nomeCategoria = twet.bairro;
    self.bairro = twet.nomeCategoria ;
    
    self.tweetCompleto = twet.tweetCompleto;
    
    self.cep = twet.cep;
    self.rua = twet.rua;
    self.numero = twet.numero;
    self.descricao = twet.descricao;
    
    self.data = twet.data ;
    self.hora = twet.hora;
    self.caminhoImagem = twet.caminhoImagem;
    
    self.estado = twet.estado;

}



@end
