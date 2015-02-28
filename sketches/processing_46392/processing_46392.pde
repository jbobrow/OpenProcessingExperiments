

// dia 15, die Sterne

//ssbeltran

// - - - - - - - DECLARO VARIABLES

int Stern = 100;
float [] posX = new float [Stern];
float [] ruidoX = new float [Stern];
float [] varX = new float [Stern];
float [] posY = new float [Stern];
float [] ruidoY = new float [Stern];
float [] varY = new float [Stern];


PFont font;

float rot;
float skl;

float tamano = random (2,5);


// - - - - - - - - SETUP

void setup (){
  size (800,800);
  smooth ();
  background (210,255,120);
  frameRate (60);

  
  
  inicializarArray ();
}


// - - - - - - - DRAW

void draw (){

  translate (width/2, height/2);
rotate (radians(rot%180));
rot += 1;

scale (skl%2);
skl += 0.2;

Galaxie ();
  
}


// - - - - - - INTERACTIVO 


  

