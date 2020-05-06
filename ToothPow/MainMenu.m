//
//  MainMenu.m
//  ToothPow
//
//  Created by Camilo Castro Cabrera on 22-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

#import "MainMenu.h"
#import "SimpleAudioEngine.h"
#import <QuartzCore/QuartzCore.h>

@interface MainMenu ()
@property (weak, nonatomic) IBOutlet UIImageView *logo;

@end

@implementation MainMenu
@synthesize logo = _logo;


- (void) startMusic{
    // Reproducir la musica de fondo
    
    [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"mainTheme.mp3"];
    
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"mainTheme.mp3" loop:YES];
}

- (void) animateLogo{
    
    // Animar el Logo
    
    // Primero asociamos al IBOutlet
    CALayer *logotipo = self.logo.layer;
    
    // hacemos la animacion
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    // de que punto en el eje y
    anim1.fromValue = [NSNumber numberWithFloat:0.0f]; 
    
    //start
    anim1.toValue = [NSNumber numberWithFloat:-20.0f]; 
    //end
    
    // cuanto se demorara
    anim1.duration = 2;           //tiempo en recorrer de ida
    
    anim1.repeatCount = HUGE_VALF; //bucle infinito
    
    anim1.autoreverses = true;     //al terminar una vuelta, va en reversa...
    
    // añado la animacion
    [logotipo addAnimation:anim1 forKey:@"SubeyBaja"];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self startMusic];
    [self animateLogo];

}

- (void)viewDidUnload
{
    [self setLogo:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
