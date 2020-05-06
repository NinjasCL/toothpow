//
//  AuthorList.m
//  ToothPow
//
//  Created by Camilo Castro Cabrera on 28-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

#import "AuthorList.h"
#import "Author.h"

@implementation AuthorList
+ (NSArray *)authors{
    Author *camilo = [[Author alloc] initWithName:@"Camilo Castro" andEmail:@"camilo@ninjas.cl" withPhoto:nil andContribution:@"Lead Programmer, Game Desing"];
    
    Author *javier = [[Author alloc] initWithName:@"Javier Campos" andEmail:@"wachimingo@gmail.com" withPhoto:nil andContribution:@"Animations Programming"];
    
    
    Author *ernesto = [[Author alloc] initWithName:@"Ernesto Muñoz" andEmail:@"" withPhoto:[UIImage imageNamed:@"analog.jpeg"] andContribution:@"Game Music"];
    
    Author *luis = [[Author alloc] initWithName:@"Luis Salas" andEmail:@"" withPhoto:[UIImage imageNamed:@"luis.jpeg"] andContribution:@"Character Desing"];
    
    
    NSArray *authors = [[NSArray alloc] initWithObjects:camilo,javier,ernesto,luis, nil];
    
    camilo = nil;
    javier = nil;
    ernesto = nil;
    luis = nil;
    
    return authors;
}
@end
