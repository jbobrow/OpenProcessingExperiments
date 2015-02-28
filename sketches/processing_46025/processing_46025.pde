
// Día 12, Stunden
// ssbeltran

// - - - - - - - - DECLARO VARIABLES

int hora = 5;


// variables normales
float aposX;
float avelX = 1;
float aposY;
float avelY = 0.505;
float bposX = 800;
float bvelX = -1;
float bposY = 800;
float bvelY = -0.505;

//array

float [] posX = new float [hora];
float [] ruidoX = new float [hora];
float [] varX = new float [hora];
float [] posY = new float [hora];
float [] ruidoY = new float [hora];
float [] varY = new float [hora];


float contador;



// - - - - - - - - SETUP

void setup (){
  
  background (255);
  frameRate (24);
  smooth();
  size (800,800); 
  
  inicializarArray ();
}


// - - - - - - - - - - - DRAW

void draw (){
  
rectMode (CENTER);



dieZeitIstWeg ();


}

void mousePressed(){
  
  background (255);
  
}

