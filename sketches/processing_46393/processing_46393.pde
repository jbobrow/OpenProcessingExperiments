

// dia 15, die Wolken

//ssbeltran

// - - - - - - - DECLARO VARIABLES

int CloudSeeds = 100;


float posX;
float posY;


float tamano = random (2,5);


// - - - - - - - - SETUP

void setup (){
  size (800,800);
  smooth ();
  background (255);
  frameRate (60);
  translate (width/2, height/2);
noCursor();
  
  
}


// - - - - - - - DRAW

void draw (){

Cloud ();

BlackStarr ();

stroke(0,0);
fill(255);
ellipse (width/2,height/2,400,400);



}


// - - - - - - INTERACTIVO 


  

