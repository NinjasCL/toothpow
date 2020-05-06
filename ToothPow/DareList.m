//
//  DareList.m
//  ToothPow
//
//  Created by Camilo Castro Cabrera on 28-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

#import "DareList.h"
#import "Dare.h"

@implementation DareList

+ (NSArray *)tomanjiDares{
    // Desafios del juego tomanji
    Dare *dare = [[Dare alloc] initWithName:@"El jugador debe tomar su vaso al seco (todo en una vez). Se estiman 8 sorbos."];
    
    Dare *dare1 = [[Dare alloc] initWithName:@"El jugador sentado a la izquierda del jugador actual debe tomar 1 sorbo."];
    
    Dare *dare2 = [[Dare alloc] initWithName:@"El jugador no puede ir al baño. En caso de que sea una emergencia debe tomar 6 sorbos."];
    
    Dare *dare3 = [[Dare alloc] initWithName:@"El jugador de pelo más largo debe tomar 1 sorbo."];
    
    Dare *dare4 = [[Dare alloc] initWithName:@"Todos los jugadores que tengan hermana deben tomar 1 sorbo."];
    
    Dare *dare5 = [[Dare alloc] initWithName:@"El jugador debe realizar 10 abdominales e inmediatamente tomar 2 sorbos."];
    
    Dare *dare6 = [[Dare alloc] initWithName:@"El jugador de pelo más corto debe tomar 1 sorbo."];
    
    Dare *dare7 = [[Dare alloc] initWithName:@"El jugador más flaco debe tomar 1 sorbo."];
    
    Dare *dare8 = [[Dare alloc] initWithName:@"Todos los jugadores toman 1 sorbo."];
    
    Dare *dare9 = [[Dare alloc] initWithName:@"El jugador debe beber una tapa llena de alcohol puro de alto octanaje (llámese ron, pisco, tequila, vodka, aguardiente, etc). Se estiman 5 sorbos."];
    
    Dare *dare10 = [[Dare alloc] initWithName:@"El jugador debe recitar un trabalenguas a elección. En caso de equivocarse debe tomar 1 sorbo."];
    
    Dare *dare11 = [[Dare alloc] initWithName:@"El jugador debe tomar un sorbo de ron puro desde la botella (puede cambiarse por otro licor fuerte). Se estiman 5 sorbos."];
    
    Dare *dare12 = [[Dare alloc] initWithName:@"El jugador más guatón debe tomar 1 sorbo."];
    
    Dare *dare13 = [[Dare alloc] initWithName:@"El jugador sentado a la derecha del jugador actual debe tomar 1 sorbo."];
    
    NSArray *dareList = [[NSArray alloc] initWithObjects:dare,dare1, dare2,dare3,dare4,dare5,dare6,dare7,dare8,dare9,dare10,dare11,dare12,dare13,nil];
    
    dare = nil;
    dare1 = nil;
    dare2 = nil;
    dare3 = nil;
    dare4 = nil;
    dare5 = nil;
    dare6 = nil;
    dare7 = nil;
    dare8 = nil;
    dare9 = nil;
    dare10 = nil;
    dare11 = nil;
    dare12 = nil;
    dare13 = nil;
    
    return dareList;
}

@end
