//
//  Autores.m
//  ToothPow
//
//  Created by Javier Campos on 28-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

#import "Author.h"

@implementation Author

@synthesize name = _name;
@synthesize email = _email;
@synthesize photo = _photo;
@synthesize contribution = _contribution;

- (id) initWithName:(NSString *)name andEmail:(NSString *)email withPhoto:(UIImage *)photo andContribution:(NSString *)contribution{
    self = [super init];
    
    if (self) {
        self.name = name;
        self.email = email;
        self.photo = photo;
        self.contribution = contribution;
    }
    
    return self;
}



@end
