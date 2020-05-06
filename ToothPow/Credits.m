//
//  Credits.m
//  ToothPow
//
//  Created by Camilo Castro Cabrera on 28-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

#import "Credits.h"
#import "Author.h"
#import "AuthorList.h"
#import <QuartzCore/QuartzCore.h>

static int contadorAutores = 0;

@interface Credits ()
@property (weak, nonatomic) IBOutlet UIView *creditsLayer;
@property (weak, nonatomic) IBOutlet UILabel *nombre;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet UIImageView *photo;

@end

@implementation Credits
@synthesize creditsLayer = _creditsLayer;
@synthesize nombre = _nombre;
@synthesize email = _email;
@synthesize description = _description;
@synthesize photo = _photo;

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        [self.photo.layer removeAllAnimations];
        [self.nombre.layer removeAllAnimations];
        [self.email.layer removeAllAnimations];
        [self.description.layer removeAllAnimations];
        [self.creditsLayer.layer removeAllAnimations];
        [self changeAuthor];
    }
}

- (void) changeAuthor{
    
    // Reiniciamos el contador si llego al maximo
    if (contadorAutores >= [[AuthorList authors] count])
        contadorAutores = 0;
    
    Author *author = [[AuthorList authors] objectAtIndex:contadorAutores++];
    
    self.nombre.text = author.name;
    self.email.text = author.email;
    self.description.text = author.contribution;
    self.photo.image = author.photo;
    
    // Comenzamos la Animacion
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:1];
    animation.repeatCount = 0;
    animation.duration = 3;
    animation.autoreverses = YES;
    animation.delegate = self;
    
    [self.creditsLayer.layer addAnimation:animation forKey:@"CreditsAnimation"];
    
}

- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self changeAuthor];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setCreditsLayer:nil];
    [self setNombre:nil];
    [self setEmail:nil];
    [self setDescription:nil];
    [self setPhoto:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
