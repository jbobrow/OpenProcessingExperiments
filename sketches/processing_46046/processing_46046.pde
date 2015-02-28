
import processing.pdf.*;

// dia 13, Swarm

//ssbeltran

// - - - - - - - DECLARO VARIABLES

int swarm = 199;
float [] posX = new float [swarm];
float [] ruidoPosX = new float [swarm];
float [] varPosX = new float [swarm];
float [] velX = new float [swarm];
float [] ruidoVelX = new float [swarm];
float [] varVelX = new float [swarm];

float [] posY = new float [swarm];
float [] ruidoPosY = new float [swarm];
float [] varPosY = new float [swarm];
float [] velY = new float [swarm];
float [] ruidoVelY = new float [swarm];
float [] varVelY = new float [swarm];

float [] tamano = new float [swarm];
float [] ruidoTam = new float [swarm];
float [] varTam = new float [swarm];


float rot = 0;

float rojo = random (130,180);
int grun = 255;
float blau = random (100);


// - - - - - - - - SETUP

void setup (){
  size (800,800);
  smooth ();
  background (210,255,100);
  noCursor();
  inicializarArray ();
}


// - - - - - - - DRAW

void draw (){

  rectMode(CENTER);
stroke (0,0);
fill (rojo,grun,blau,2);
rect (mouseX,mouseY,width*10,height*10);

translate (mouseX,mouseY);
scale (.10);
rotate (radians (rot));
rot += 181;


contagion ();


}



  
  

