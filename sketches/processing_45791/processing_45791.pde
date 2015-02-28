
// Día 10, partitura.
// ssbeltran


// - - - - - - - - - - - - - - - - -
// declaro variables

float contador ;
float rot;

float ringDown = 75;



int mahler = 333;

float [] posY = new float [mahler];
float [] noiseY = new float [mahler];
float [] varY = new float [mahler];
float [] AposY = new float [mahler];
float [] AnoiseY = new float [mahler];
float [] AvarY = new float [mahler];
float [] BposY = new float [mahler];
float [] BnoiseY = new float [mahler];
float [] BvarY = new float [mahler];
float [] initialX = new float [mahler];

float opacity = random (255);
float jitter = random (5,10);

// - - - - - - - - - - SETUP

void setup (){

size (800,800);
smooth ();
background (255);

laDecima ();

}

// - - - - - - - - - - - DRAW

void draw (){


background (255);
translate(width/2,height/2);
rotate (radians(rot));
contador += 0.25;
rot ++;

laDecima ();

}

