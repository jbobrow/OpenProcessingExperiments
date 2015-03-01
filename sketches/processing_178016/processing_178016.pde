

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


//Global Variables
PImage highland;
Minim minim;
AudioSample bunny;


//setup()
void setup(){
minim = new Minim(this);
 bunny = minim.loadSample("bunnyW.mp3");
  size(800, 600);
 background(#9AADBD);
 highland = loadImage ("highlandEditBold2.jpg");
 noLoop();
}



//draw()
void draw(){
 image(highland, 200, 150, 400, 300);
   }


void keyPressed(){
  if (key == 'b') bunny.trigger();
  if (key == 'b') println("sample triggered");
}







