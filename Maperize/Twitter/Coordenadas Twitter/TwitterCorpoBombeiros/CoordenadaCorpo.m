//
//  CoordenadaCorpo.m
//  TwitterSDK
//
//  Created by Vinicius Resende Fialho on 29/03/14.
//  Copyright (c) 2014 VINICIUS RESENDE FIALHO. All rights reserved.
//

#import "CoordenadaCorpo.h"

@implementation CoordenadaCorpo

-(id)initCoordenada:(TweetCorpo *)twet{
    self = [super init];
    
    if(self){
        [self recebeTweetComDados:twet];
        
    }
    
    return self;
}



-(void)recebeTweetComDados:(TweetCorpo*)twet{
    
    
    self.tweetCompleto = twet.tweetCompleto;
    self.descricao = twet.descricao ;
    
    self.bairro = twet.bairro;
    self.nomeCategoria = twet.nomeCategoria;
    
    self.rua = twet.rua;
   
    self.data = twet.data;
    self.hora = twet.hora;
    
    self.caminhoImagem = twet.caminhoImagem;
    
    self.estado = twet.estado;
    
}



@end
