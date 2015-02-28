
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Jeanie

//Declare variables


 Minim minim;
AudioPlayer song;
AudioInput input;

//scene
PImage bird;
PImage cloud;
PImage hill;
PImage path;
// skaters
PImage skate1;
PImage skate2;
PImage skate3;
PImage skate4;
PImage skate5;
PImage skate6;
PImage skate7;

//PImage blade1;
//PImage blade2;
//PImage blade3;
//PImage blade4;
//PImage blade5;
//PImage blade6;


int skateNum;
  int bladeNum;
String words;

PImage [] skatepics;
PImage [] bladepics;

//bird variables
int bX= 0;
int bY= 100;
//cloud variables
float cX= 600.0;
float cY= 50.0;
int x =0;
int y = 350;
//int u = 0;
//int v = 350;
PFont font;


//Initial Settings

void setup() {
  size (800,600);
  bird = loadImage( "bluebird.png");
  cloud = loadImage( "cloud.png");
  hill = loadImage ("hill.png");
  skate1 = loadImage ("skate1.png");
  skate2 = loadImage ("skate2.png");
  skate3 = loadImage ("skate3.png");
  skate4 = loadImage ("skate4.png");
  skate5 = loadImage ("skate5.png");
  skate6 = loadImage ("skate6.png");
  skate7 = loadImage ("skate7.png");
  path = loadImage ("path.png");
  skateNum=0;
//  blade1=loadImage ("blade0.png"); 
//  blade2=loadImage ("blade2.png"); 
//  blade3=loadImage ("blade3.png"); 
//  blade4=loadImage ("blade4.png"); 
//  blade5=loadImage ("blade5.png"); 
//  blade6=loadImage ("blade6.png");
//  bladeNum=0;

  words = " It is always a good idea to wear knee pads. ";
    font = loadFont ("CenturyGothic-Bold-48.vlw");
  textFont (font, 20);
 //music
 minim = new Minim(this);
  song = minim.loadFile("skatesong.mp3");
  input = minim.getLineIn();
  song.play();
  

skatepics = new PImage [7];
skatepics [0] = skate1;
skatepics [1] = skate2;
skatepics [2] = skate3;
skatepics [3] = skate4;
skatepics [4] = skate5;
skatepics [5] = skate6;
skatepics [6] = skate7;

//bladepics = new PImage [6];
//bladepics [0] =blade1;
//bladepics [1] =blade1;
//bladepics [2] =blade1;
//bladepics [3] =blade1;
//bladepics [4] =blade1;
//bladepics [5] =blade1;

  smooth ();
}

//Repeat

void draw () {
  background (146,216,250);
  image (hill, -20,300);
 image (path, -15,400);
 image (skatepics [skateNum] , x, y);
 //image (bladepics [bladeNum] , u, v);
 
if (mousePressed) {
  
}

if (skateNum == 1) {
  x = 140;
  y= 320;
}

if (skateNum == 2){
x = 200;
y = 360;
}

if (skateNum == 3) {
  x= 250;
 y = 370;
}

if (skateNum == 4) {
 x = 320;
y = 395;  
}

if (skateNum == 5) {
 x = 370;
y= 400; 
}

if (skateNum == 6) {
 x=  395;
 y = 520;
}


  // cloud across screen
  image (cloud,cX,cY);
  cX = cX -0.25;
  
  


  //to make bird appear/flap
  if (keyPressed) {
    image (bird,bX,bY);
    bX = bX + 3;
  }
  
  if (skateNum ==6) {
    fill (0);
   text (words, 15, 50); 

  }

 
}

void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  song.close();
  // the AudioInput you got from Minim.getLineIn()
  input.close();
  minim.stop();
 
  // this calls the stop method that 
  // you are overriding by defining your own
  // it must be called so that your application 
  // can do all the cleanup it would normally do
  super.stop();
}


//Event Handlers
void mousePressed () {
     if (skateNum <6) {  
     
     skateNum ++;
     }
}
//Custom Functions

//Classes


