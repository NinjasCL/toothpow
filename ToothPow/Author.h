//
//  Autores.h
//  ToothPow
//
//  Created by Javier Campos on 28-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Author : NSObject 
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *contribution;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) UIImage *photo;

- (id) initWithName:(NSString *) name andEmail:(NSString *)email withPhoto:(UIImage *)photo andContribution:(NSString *) contribution;
@end
