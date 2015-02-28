
// Día 9, mi canal.
// ssbeltran

// inspirado en el texto de Jhavier Loeza,


// - - - - - - - - - - - - - - - -  -
// declaro variables

float contador ;
int rot = 180;
int grun = 255;
int blau = 0;

int impulse = 333;

float [] posY = new float [impulse];
float [] noiseY = new float [impulse];
float [] varY = new float [impulse];
float [] AposY = new float [impulse];
float [] AnoiseY = new float [impulse];
float [] AvarY = new float [impulse];
float [] BposY = new float [impulse];
float [] BnoiseY = new float [impulse];
float [] BvarY = new float [impulse];
float [] initialX = new float [impulse];

float opacity = random (255);
float jitter = random (5,10);

// - - - - - - - - - - SETUP

void setup (){

size (800,800);
smooth ();
background (0);

inicializarArray ();

}

// - - - - - - - - - - - DRAW

void draw (){
  
  
background (0);
contador += 0.25;
opacity ++;

firstSpawn ();

println (opacity);


}

// - - - - - - -  INTERACTIVO

  

