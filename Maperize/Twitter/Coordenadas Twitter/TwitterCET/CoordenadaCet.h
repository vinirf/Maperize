//
//  CoordenadaCet.h
//  TwitterSDK
//
//  Created by Vinicius Resende Fialho on 29/03/14.
//  Copyright (c) 2014 VINICIUS RESENDE FIALHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TweetCet.h"

@interface CoordenadaCet : NSObject


-(id)initCoordenada:(TweetCet *)twet;


@property float latitude;
@property float longitude;

@property NSString *tweetCompleto;
@property NSString *descricao;

@property NSString *bairro;
@property NSString *nomeCategoria;

@property NSString *rua;
@property NSString *ruaComplemento;

@property NSString *zona;

@property NSString *data;
@property NSString *hora;
@property NSString *caminhoImagem;
@property bool estado;


@end
