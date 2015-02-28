

// dia 20 Vórtice

//ssbeltran

// - - - - - - - DECLARO VARIABLES

float rot;

int worms = 50;

float [] posX =  new float [worms];
float [] varX = new float [worms];
float [] ruiX = new float [worms];
float [] posY =  new float [worms];
float [] varY = new float [worms];
float [] ruiY = new float [worms];

float [] AposX =  new float [worms];
float [] AvarX = new float [worms];
float [] AruiX = new float [worms];
float [] AposY =  new float [worms];
float [] AvarY = new float [worms];
float [] AruiY = new float [worms];

float [] rojo = new float [worms];
float [] grun = new float [worms];
float [] blau = new float [worms];


// - - - -  - - -  -- - - - - - SETUP - - - - - - - - - - - -


void setup (){
  
  
 size (800,800);
 smooth();
 background (255);
 frameRate (40);
 
 inicializarArray ();
}


// - - - - - - - - -  - - -DRAW - - - - - - - - - - - 


void draw (){
  
  translate (400,400);
  rotate (radians (rot/10));
  scale (0.25);
  rot ++;
  
  background (255);
wormHole ();
  
  

  
}



// - - - - - - -  - - INTERACTIVO  - - - - - - - - - 

  

