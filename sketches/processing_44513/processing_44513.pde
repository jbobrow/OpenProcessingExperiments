
// Code used/Modified from Lu YU
//http://www.openprocessing.org/visuals/?visualID=21085
//Sound clip from Soundjay.com

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
PImage img;
PImage img0;
PImage img1;
float x = 0.0;

void setup(){
  size(800, 600);
  noStroke();
  img = loadImage("IMG_2117.jpg");
  img0 = loadImage("car.png");
  img1 = loadImage("truck.png");
  minim = new Minim(this);
  mySound = minim.loadFile("truck-passing-1.mp3");
  mySound.play();
  mySound.loop();
}
int n=0;
void draw(){
 background(img);
  fill(255);
image (img0,mouseX, 320, 465, 375);
// x position determined by mouse position
  println(mouseX);

frameRate(60);
  image(img1,x, 320, 640, 480); 
  x -= 11;
if (x < -800){   // if position is more than 150
    x = 5000;    // set it to -50
  }  
  
for(int i = 0; i < mySound.bufferSize() - 1; i++)  {
  }
  n++;
}
 

 
void stop(){

  minim.stop();
  super.stop();
}


