//
//  Teeth.m
//  ToothPow
//
//  Created by Camilo Castro Cabrera on 14-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

// Clase para almacenar los estados de un diente

#import "Teeth.h"

@implementation Teeth
@synthesize explosivo = _explosivo;
@synthesize activado = _activado;

- (void) cambiarEstado{
    self.activado = !self.activado;
}
@end
