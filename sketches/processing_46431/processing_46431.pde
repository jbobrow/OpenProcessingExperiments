

// dia 19 Octopi

//ssbeltran

// - - - - - - - DECLARO VARIABLES

int Tentacles = 5;


float [] posX =  new float [Tentacles];
float [] varX = new float [Tentacles];
float [] ruiX = new float [Tentacles];
float [] posY =  new float [Tentacles];
float [] varY = new float [Tentacles];
float [] ruiY = new float [Tentacles];


float [] rojo = new float [Tentacles];
float [] grun = new float [Tentacles];
float [] blau = new float [Tentacles];


float [] VposX =  new float [Tentacles];
float [] VvarX = new float [Tentacles];
float [] VruiX = new float [Tentacles];

float contador;

// - - - - - - - - SETUP

void setup (){
  size (800,800);
  smooth ();
  background (255);
  frameRate (24);
noCursor();
  
  inicializarArray ();
}


// - - - - - - - DRAW

void draw (){
  
scale (1.5);
translate (100,-200);
rotate (radians(35));

fill (255,20);
stroke(0,0);
rect (-500,-500, 1600,1600);

contador ++;

Run ();



}


// - - - - - - INTERACTIVO 


  

