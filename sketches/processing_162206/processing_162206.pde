

//Minim Library
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//G4P Library
import g4p_controls.*;

/* @pjs preload="starryskybg.jpg"; */ 

//------------------------------------------------------------

//Declare the variables.
//Minim Variables
AudioSample windChimes;
Minim minim;

//Other Variables
PImage button;
int butX = 200;
int butY = 500;
int butW = 400;
int butH = 50;

PImage skyBackground;

GImageButton myButton;
String[] myButtonFiles = {"starButton.jpg"};

boolean starsOn = false;

//Noise variables
float nPos1 = 0;
float nPos2 = 0;
float nPos3 = 0;
float inc = 0.005;
PImage star1;
PImage star2;
PImage star3;

//------------------------------------------------------------

void setup() {
  //Set up environment
  size(800,600);
  background(0);
  
  //Load image
  button = loadImage("starButton.jpg");
  skyBackground = loadImage("starryskybg.jpg");
  star1 = loadImage("stars 002.png");
  star2 = loadImage("stars 003.png");

  
  //Minim
  minim = new Minim(this);
  windChimes = minim.loadSample("windchimescopy.mp3"); 
  
  //Call buttons
  myButton = new GImageButton(this, 200, 500, myButtonFiles);
}

void draw() {
 //Set button default
 if (starsOn) {
   background(skyBackground);
   
   //noise1
  float x1 = noise(nPos1)*width;
  float y1 = noise(nPos1+1)*height;
  image(star1, x1,y1,50,50);
  nPos1 = nPos1 + inc;
  
  //noise2
  float x2 = noise(nPos2)*.5*width;
  float y2 = noise(nPos2+1)*height;
  image(star2, x2,y2,50,50);
  nPos2 = nPos2 + inc;
  
  //noise3
  float x3 = noise(nPos3)*.25*width;
  float y3 = noise(nPos3+1)*height;
  image(star1, x3,y3,100,100);
  nPos3 = nPos3 + inc;
  
  //noise4
  float x4 = noise(nPos3)*.75*width;
  float y4 = noise(nPos3+1)*height;
  image(star1, x4,y4,75,75);
  nPos3 = nPos3 + inc;
  
 }
 else {
   background(0);
 }
 

}

void mousePressed () {  

  if (mouseX > butX && mouseX < butX + butW && mouseY > butY && mouseY < butY + butW) {
  starsOn = !starsOn;
  fill(0,0,0);
  
  //Play starry sound every time you click.
  windChimes.trigger();
  

  }
}

void handleButtonEvents (GImageButton button, GEvent event) {
 if (button == myButton) {
    image(skyBackground,0,0);
 }
}



