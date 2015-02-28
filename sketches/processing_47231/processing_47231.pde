
//Code Modified from Roya Ramezani
 //"Honk" sound clip from soundjay.com
 // Skid sound from http://www.findsounds.com
 // Code modified from 
 //http://digital-locker.design.yorku.ca/2005Mw10/Lab1/skhan/project2/website/index.html

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
AudioPlayer aSound;



 PImage img;
  PImage img0;

Zoog zoog;
 
 void setup(){
  size(700,509);
  smooth();

  noStroke();
  img = loadImage("crash.jpg");
  zoog = new Zoog(10,10,10,0,11);
  img0 = loadImage("speechbubble.png");


  

minim = new Minim(this);
  aSound = minim.loadFile("skid.mp3");
  aSound.play();
  

 }

 


 void draw(){
background(0);
 float factor = constrain(mouseX/10,0,5);
  zoog.jiggle(factor);
  zoog.display();
  


}

void mouseDragged(){
    
  image (img0, 350, 250, 282, 148);
  }


void mousePressed(){
  if (mouseButton == LEFT){
   minim = new Minim(this);
  mySound = minim.loadFile("honk.mp3");
  mySound.play();

}
}

class Zoog {
  // Zoog's variables
  float x,y,w,h,eyeSize;
  
  // Zoog constructor
  Zoog(float tempX, float tempY, float tempW, 
  float tempH, float tempEyeSize) {


  }
  
  // Move Zoog
  void jiggle(float speed) {
    // Change the location of Zoog randomly
    x = x + random(-1,1)*speed;
    y = y + random(-1,1)*speed;
    // Constrain Zoog to window
    x = constrain(x,0,10);
    y = constrain(y,0,10);
  }
  
  // Display Zoog
  void display() {
    image(img,x,y);
  }
}


void stop(){

  minim.stop();
  super.stop();
}



