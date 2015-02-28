

// dia 14,  Police Brutality

//ssbeltran

// - - - - - - - DECLARO VARIABLES

int laChota = 14;
float [] velX = new float [laChota];
float [] ruidoVelX = new float [laChota];
float [] varVelX = new float [laChota];


float posX;
float contador;

PFont font;




// - - - - - - - - SETUP

void setup (){
  size (550,550);
  smooth ();
  background (255);
  noCursor();
  
  font = createFont ("04B_03__.TTF", 300);
  
  
  inicializarArray ();
}


// - - - - - - - DRAW

void draw (){


adiosOccupyWallStreet ();

if (posX > width) {
  
  GameOver ();
  

}

  
}





void mousePressed (){
  
  Resist ();
  
}
  
  

