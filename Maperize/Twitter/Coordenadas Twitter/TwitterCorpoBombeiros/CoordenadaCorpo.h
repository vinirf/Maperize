//
//  CoordenadaCorpo.h
//  TwitterSDK
//
//  Created by Vinicius Resende Fialho on 29/03/14.
//  Copyright (c) 2014 VINICIUS RESENDE FIALHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TweetCorpo.h"

@interface CoordenadaCorpo : NSObject

-(id)initCoordenada:(TweetCorpo *)twet;


@property NSString *tweetCompleto;
@property NSString *hora;
@property NSString *nomeCategoria;

@property NSString *rua;
@property NSString *numero;

@property NSString *descricao;
@property NSString *bairro;

@property NSString *data;

@property NSString *caminhoImagem;

@property BOOL estado;



@end
