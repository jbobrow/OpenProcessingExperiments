
//Some code borrowed and modified by 
//Cassandra C.
//http://www.openprocessing.org/visuals/?visualID=44103
// Code used/Modified from Lu YU
//http://www.openprocessing.org/visuals/?visualID=21085
//Sound clip from Soundjay.com

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
Rain[] rain = new Rain[500];
boolean stopRain = false;
int n=0;
 PImage img;
 PImage img0;

void setup(){
  size(800,600);
  img0 = loadImage("IMG_2110.jpg");
  img = loadImage("IMG_2110_1.jpg");
  for(int i = 0; i < rain.length; i++) {
    rain[i] = new Rain(random(width), random(height),random(2, 5));
  }
minim = new Minim(this);
  mySound = minim.loadFile("rain.mp3");
  mySound.play();
  mySound.loop();
}
void draw(){
 image(img,0,0);
  fill(255);
  for(int i = 0; i < rain.length; i++) {
    rain[i].move();
    rain[i].display();
  }
}
void mouseMoved(){
  image(img0,0,0);
  fill(255);
  for(int i = 0; i < rain.length; i++) {
    rain[i].move();
    rain[i].display();
  }

}

class Rain {
  float x, y, s;

  
  Rain(float _x, float _y, float _s) {
    x = _x;
    y = _y;
    s = _s;
  }


 void move() {
    y += s;
    if (y > height){
      if (stopRain == false)
        y = 0;
      else if (stopRain == true)
        y = height;
    }
  }
 
  void display() {
    stroke(#CAE1FF,random(200,255));
    line(x,y,x,y + random(20)); //amount of rain
   
 }

 }




 
void stop(){

  minim.stop();
  super.stop();
}




