//
//  Tweet.h
//  TwitterSDK
//
//  Created by VINICIUS RESENDE FIALHO on 26/03/14.
//  Copyright (c) 2014 VINICIUS RESENDE FIALHO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject {

    
}

@property NSString *nomeCategoria;
@property NSString *bairro;

@property NSString *tweetCompleto;
@property NSString *cep;
@property NSString *rua;
@property NSString *numero;
@property NSString *descricao;

@property NSString *data;
@property NSString *hora;
@property NSString *caminhoImagem;
@property bool estado;

@end
