//
//  GameScreen.m
//  ToothPow
//
//  Created by Camilo Castro Cabrera on 28-06-12.
//  Copyright (c) 2012 Ninjas.cl. All rights reserved.
//

#import "GameScreen.h"
#import "Teeth.h"
#import "Tooth.h"
#import "SimpleAudioEngine.h"
#import "Dare.h"
#import "DareList.h"
#import <AudioToolbox/AudioToolbox.h>

static BOOL juegoEnCurso = NO;
static BOOL debugMode = NO;
static BOOL muteSounds = NO;

static int bombCounter = 0;

static int hardMaxBombs = 3;
static int normalMaxBombs = 2;
static int easyMaxBombs = 1;

@interface GameScreen ()
@property (weak, nonatomic) IBOutlet UIButton *dienteSender;

@property (weak, nonatomic) IBOutlet UIButton *dienteSender1;

@property (weak, nonatomic) IBOutlet UIButton *dienteSender2;

@property (weak, nonatomic) IBOutlet UIButton *dienteSender3;

@property (weak, nonatomic) IBOutlet UIButton *dienteSender4;

@property (weak, nonatomic) IBOutlet UIButton *dienteSender5;

@property (weak, nonatomic) IBOutlet UIButton *dienteSender6;

@property (weak, nonatomic) IBOutlet UIButton *dienteSender7;

@property (weak, nonatomic) IBOutlet UIButton *dienteSender8;

@property (weak, nonatomic) IBOutlet UIButton *dienteSender9;

@property (weak, nonatomic) IBOutlet UIButton *dienteSender10;

@property (weak, nonatomic) IBOutlet UIButton *dienteSender11;

@property(nonatomic,strong) NSArray *dientes;

@property(nonatomic,strong) NSArray *dientesSenders;

@property (weak, nonatomic) IBOutlet UIImageView *shuwakaFace;

@end

@implementation GameScreen
@synthesize dienteSender = _dienteSender;
@synthesize dienteSender1 = _dienteSender1;
@synthesize dienteSender2 = _dienteSender2;
@synthesize dienteSender3 = _dienteSender3;
@synthesize dienteSender4 = _dienteSender4;
@synthesize dienteSender5 = _dienteSender5;
@synthesize dienteSender6 = _dienteServer6;
@synthesize dienteSender7 = _dienteSender7;
@synthesize dienteSender8 = _dienteSender8;
@synthesize dienteSender9 = _dienteSender9;
@synthesize dienteSender10 = _dienteSender10;
@synthesize dienteSender11 = _dienteSender11;
@synthesize dientes = _dientes;
@synthesize dientesSenders = _dientesSenders;
@synthesize shuwakaFace = _shuwakaFace;
@synthesize difficulty = _difficulty;

- (NSArray *) dientesSenders{
    if (!_dientesSenders) {
        _dientesSenders = [[NSArray alloc] initWithObjects:self.dienteSender,self.dienteSender1,self.dienteSender2,self.dienteSender3,self.dienteSender4,self.dienteSender5,self.dienteSender6,self.dienteSender7,self.dienteSender8,self.dienteSender9,self.dienteSender10,self.dienteSender11, nil];
    }
    
    return _dientesSenders; 
}

- (NSArray *) dientes{
    if (!_dientes) {
        _dientes = [Tooth ToothList];
    }
    return _dientes;
}

- (void) setDifficulty:(NSNumber *)difficulty{
    if (difficulty.intValue < 0) {
        difficulty = [NSNumber numberWithInt: 0];
    } else if (difficulty.intValue > 2){
        difficulty = [NSNumber numberWithInt: 2];
    }
    
    _difficulty = difficulty;
}

- (void) startWithBombs:(int) bombs{
    
    int dienteEscogido = 0;
    Teeth *diente;
    
    // mientras haya bombas
    // asignamos un diente explosivo
    // al azar
    
    // Guaramos las bombas generadas
    // para no repetir su posicion
    NSMutableArray *bombas = [[NSMutableArray alloc] init];
    
    while (bombs > 0) {
        
        // Numero al azar del 0 al 11
        dienteEscogido = arc4random() % 12;
        
        // Si no contiene el diente escogido
        // lo asignamos y guardamos en el arreglo 
        if (![bombas containsObject:[NSNumber numberWithInt:dienteEscogido]]) {
        
            [bombas addObject:[NSNumber numberWithInt:dienteEscogido]];
        
            diente = [self.dientes objectAtIndex:dienteEscogido];
            diente.explosivo = YES;
            bombs--;
        }
    }
    
    bombas = nil;
}

- (void) newGame{
    
    // Valor inicial
    bombCounter = 0;
    
    // Todos los botones se muestran
    
    for (UIButton *dienteSender in self.dientesSenders) {
        dienteSender.hidden = NO;
        dienteSender.backgroundColor = [UIColor whiteColor];
        dienteSender.tintColor = [UIColor brownColor];
    }
  
    // Reiniciamos los valores de los dientes
    for (Teeth *diente in self.dientes) {
        diente.explosivo = NO;
        diente.activado = NO;
    }
    
    // Establecemos la cantidad de explosivos segun dificultad
    switch (self.difficulty.intValue) {
        case 1: // Normal
            [self startWithBombs:normalMaxBombs];
            break;
        case 2: // Hard
            [self startWithBombs:hardMaxBombs];
            break;
        default: // Easy
            [self startWithBombs:easyMaxBombs];
            break;
    }
    
    // Comenzamos a Jugar 
    juegoEnCurso = YES;
    
    // Cambiamos el color de fondo del diente que es explosivo
    Teeth *diente;
    for (UIButton *dienteSender in self.dientesSenders) {
        
        diente = [self.dientes objectAtIndex:(dienteSender.tag - 1)];
        
        if (diente.explosivo) {
            dienteSender.tintColor = [UIColor redColor];
            
            // Para saber donde estan las bombas
            if(debugMode) dienteSender.backgroundColor = [UIColor redColor];
        }
    }
}

- (void) endGame{
    juegoEnCurso = NO;
    
    if (!muteSounds) {
        [[SimpleAudioEngine sharedEngine] playEffect:@"BadBomb.mp3"];
        
        // Pausa para dramatismo
        sleep(2);
        
        [[SimpleAudioEngine sharedEngine] playEffect:@"Bomb.mp3"];
    } else {
        
        // Pausa para dramatismo
        sleep(2);
    }
    
    
    [self activateVibration];
    
    
    int randomDare = arc4random() % [[DareList tomanjiDares] count];
    
    Dare *dare = [[DareList tomanjiDares] objectAtIndex:randomDare];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Juego Terminado" message:dare.name delegate:self cancelButtonTitle:@"Continue" otherButtonTitles: @"Change Difficulty",nil];
    
    [alert setTag:1];
    [alert show];
    
    [self newGame];
}


- (void) playRandomSound{
    int randomSound = arc4random() % 2;
    NSString *sound;
    
    if (randomSound == 1)
        sound = @"Wilhelm.mp3";
    else
        sound = @"Goofy.mp3";
    
   
    if (!muteSounds) [[SimpleAudioEngine sharedEngine] playEffect:sound];
    
    
}

- (void) activateVibration{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (BOOL) canContinueCrushingTooths{
    // Contamos la cantidad de dientes
    // sin activar.
    // si es igual a 0 cuando le restamos 1
    // (solo quedan 2 dientes)
    // se reiniciara el juego
    int count = 0;
    
    for (Teeth *diente in self.dientes) {
        if (!diente.activado) {
            count++;
        }
    }
    
    // Verificar por Dificultad
    
    // Si la dificultad es facil, la cantidad de dientes
    // para ganar son 1
    // dificultad normal, la cantidad de dientes sobrantes
    // para ganar son 2
    // dificultad dificil, la cantidad de dientes sobrantes
    // para ganar son 3
    
    if (self.difficulty.intValue == 0 && (count - 1) == 0){
        if(debugMode) NSLog(@"quedan 1 dientes");
        return NO;
    } else if (self.difficulty.intValue == 1 && (count - 2) == 0) {
        if(debugMode) NSLog(@"quedan 2 dientes");
        return NO;
    } else if (self.difficulty.intValue == 2 && (count - 3) == 0) {
        if(debugMode) NSLog(@"quedan 3 dientes");
        return NO;
    }
    
    return YES;
}

- (void) quebrarDiente:(UIButton *) dienteSender isExplosive:(BOOL)explosive{
    
    // Animar la Cara
    self.shuwakaFace.animationImages =[NSArray arrayWithObjects:[UIImage imageNamed:@"shuwaka-pain.png"],[UIImage imageNamed:@"shuwaka.png"],nil];
    
    self.shuwakaFace.animationDuration = 1;
    self.shuwakaFace.animationRepeatCount = 1;
    [self.shuwakaFace startAnimating];
    
    // Si era explosivo, pero no exploto
    // reproducir un sonido especial
    if (explosive){
        if (!muteSounds) [[SimpleAudioEngine sharedEngine] playEffect:@"BadBomb.mp3"];
        
        // Pausa para dramatismo
        sleep(2);
        
        [self playRandomSound];
        
    }else{
    // Si no reproducir un sonido al azar
        [self playRandomSound];
    }
    
    
    // Eliminar el diente
    dienteSender.hidden = YES;

}

- (BOOL) teethwillExplode{
    int difficulty = self.difficulty.intValue;
    
    int explosivePercentage = 0; // Saber que tan probable es que explote la bomba
    
    int willExplode = 0;
    
    switch (difficulty) {
        case 1: // Normal
            explosivePercentage = 65;
            break;
        
        case 2: // Hard 
            explosivePercentage = 75;
            break;
            
        default: // Easy
            explosivePercentage = 55;
            break;
    }
    
    // Formula
    // (rand# / 100 - p ) * 100
    
    willExplode = ((arc4random() % 100) / (100 - explosivePercentage)) * 100;
    
    if (debugMode) NSLog(@"%d",willExplode);
    
    if (willExplode >= 1)
        return YES;
    
    bombCounter++;
    return NO;
}

- (int)maxBombs{
    if (self.difficulty.intValue == 0)
        return easyMaxBombs;
    else if (self.difficulty.intValue == 1)
        return normalMaxBombs;
    else 
        return hardMaxBombs;
}
- (IBAction)activateTeeth:(UIButton *)dienteSender{

    Teeth *diente = [self.dientes objectAtIndex:(dienteSender.tag - 1)];
    
    // Esta el juego iniciado?
    if (juegoEnCurso) {
        if (!diente.activado) {
            diente.activado = YES;
            if (diente.explosivo) {
                if(debugMode) NSLog(@"Explosivo!");
                
                if ([self teethwillExplode]){
                    [self endGame];
                } else {
                    [self quebrarDiente:dienteSender isExplosive:YES];
                    if (![self canContinueCrushingTooths] || bombCounter >= [self maxBombs]) {
                        [self newGame];
                    }
                }
            } else {
                if(debugMode) NSLog(@"Normal");
                
                [self quebrarDiente:dienteSender isExplosive:NO];
                
                if (![self canContinueCrushingTooths]) 
                    [self newGame];
                
            }
        }
    }
}

- (IBAction)MuteMusic:(UIButton *)sender {
    muteSounds = !muteSounds;
    
    if (muteSounds){ 
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
        sender.imageView.image = [UIImage imageNamed:@"nosound.png"];
    }
    else{
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"mainTheme.mp3" loop:YES];
        sender.imageView.image = [UIImage imageNamed:@"soundon.png"];
    }
}

- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if ([alertView tag] == 1) {
        if (buttonIndex == 1) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
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
    
    if(debugMode) NSLog(@"Dificultad: %d",self.difficulty.intValue);
    
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"Wilhelm.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"Goofy.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"Bomb.mp3"];
    
    [self newGame];
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setDienteSender:nil];
    [self setDienteSender1:nil];
    [self setDienteSender2:nil];
    [self setDienteSender3:nil];
    [self setDienteSender4:nil];
    [self setDienteSender5:nil];
    [self setDienteSender6:nil];
    [self setDienteSender7:nil];
    [self setDienteSender8:nil];
    [self setDienteSender9:nil];
    [self setDienteSender10:nil];
    [self setDienteSender11:nil];
    [self setShuwakaFace:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
