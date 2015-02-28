

// dia 17, Huellas

//ssbeltran

// - - - - - - - DECLARO VARIABLES

int Fingerprint = 7;


float [] posX =  new float [Fingerprint];
float [] varX = new float [Fingerprint];
float [] ruiX = new float [Fingerprint];
float [] posY =  new float [Fingerprint];
float [] varY = new float [Fingerprint];
float [] ruiY = new float [Fingerprint];

float [] D =  new float [Fingerprint];
float [] varD = new float [Fingerprint];
float [] ruiD = new float [Fingerprint];

float [] VposX =  new float [Fingerprint];
float [] VvarX = new float [Fingerprint];
float [] VruiX = new float [Fingerprint];





// - - - - - - - - SETUP

void setup (){
  size (800,800);
  smooth ();
  background (255);
  frameRate (60);
noCursor();
  
  inicializarArray ();
}


// - - - - - - - DRAW

void draw (){
  
translate (width/2,height/2);
scale (0.5);

Run ();




}


// - - - - - - INTERACTIVO 


  

