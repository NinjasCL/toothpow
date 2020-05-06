//
//  Teeth.h
//  ToothPow
//
//  Created by Camilo Castro Cabrera on 14-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teeth : NSObject
@property(nonatomic) BOOL explosivo;
@property(nonatomic) BOOL activado;
- (void) cambiarEstado;
@end
