//
//  Dare.m
//  ToothPow
//
//  Created by Camilo Castro Cabrera on 28-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

#import "Dare.h"

@implementation Dare
@synthesize name = _name;

- (id) initWithName:(NSString *)name{
    self = [super init];
    if (self) {
        self.name = name;
    }
    
    return self;
}
@end
