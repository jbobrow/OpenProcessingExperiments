

// dia 18, Some Kind of Dream

//ssbeltran

// - - - - - - - DECLARO VARIABLES

int Monsters = 5;


float [] posX =  new float [Monsters];
float [] varX = new float [Monsters];
float [] ruiX = new float [Monsters];
float [] posY =  new float [Monsters];
float [] varY = new float [Monsters];
float [] ruiY = new float [Monsters];

float [] D =  new float [Monsters];
float [] varD = new float [Monsters];
float [] ruiD = new float [Monsters];

float [] VposX =  new float [Monsters];
float [] VvarX = new float [Monsters];
float [] VruiX = new float [Monsters];



float rot;

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
  
translate (width/2,height/2);
rotate (radians(rot));
rot += 48;
scale (0.5);

rectMode(CENTER);
fill(255,10);
stroke(0,0);
rect(0,0,width*2,height*2);


Run ();



}


// - - - - - - INTERACTIVO 


  

