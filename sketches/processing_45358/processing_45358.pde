
// Dia 7 hackpact por ssbeltran, hora de jugar con array

// 70 veces 7, las veces que hay que perdonar


//declaro variables

int forgive = 489;
float [] posX = new float [forgive];
float [] noiseX = new float [forgive];
float [] varX = new float [forgive];
float [] posY = new float [forgive];
float [] noiseY = new float [forgive];
float [] varY = new float [forgive];
float temporalX ;
float temporalY ;
float contador ;

// - - -  - - - - - - - SETUP

void setup (){
  
  size (800,800);
  smooth ();
  background (0);
  
  inicializarArray ();
  
}

// - - - - - - - - - - - - DRAW

void draw () {
  
  background (0);
contador ++;


  firstForgiveness ();
  
  
  if (key == '7') {
    lastForgiveness ();
  }
  
}

