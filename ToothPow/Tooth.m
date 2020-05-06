//
//  Tooth.m
//  ToothPow
//
//  Created by Camilo Castro Cabrera on 29-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

#import "Tooth.h"
#import "Teeth.h"

@implementation Tooth
+ (NSArray *) ToothList{
    NSArray *dientes;
    
    Teeth *diente0 = [[Teeth alloc] init];
    Teeth *diente1 = [[Teeth alloc] init];
    Teeth *diente2 = [[Teeth alloc] init];
    Teeth *diente3 = [[Teeth alloc] init];
    Teeth *diente4 = [[Teeth alloc] init];
    Teeth *diente5 = [[Teeth alloc] init];
    Teeth *diente6 = [[Teeth alloc] init];
    Teeth *diente7 = [[Teeth alloc] init];
    Teeth *diente8 = [[Teeth alloc] init];
    Teeth *diente9 = [[Teeth alloc] init];
    Teeth *diente10 = [[Teeth alloc] init];
    Teeth *diente11 = [[Teeth alloc] init];
    
    dientes = [[NSArray alloc ] initWithObjects:diente0,diente1,diente2,diente3,diente4,diente5,diente6,diente7,diente8,diente9,diente10,diente11, nil];
    
    return dientes;
}
@end
