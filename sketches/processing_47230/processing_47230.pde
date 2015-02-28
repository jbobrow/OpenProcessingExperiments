
//Code Modified from Victor L.
//http://www.openprocessing.org/visuals/?visualID=43322
 //"Honk" sound clip from soundjay.com
 // slurping sound from http://soundbible.com

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
AudioPlayer aSound;
AudioPlayer hSound;

 PImage img;
  PImage img0;
  
  int x, y;
float r = 550; // radius
 
float angle, angle2, theta;
float speed = 0.007; // amout to increase each redraw (in radians)
int rayNum = 6; // number of rays
int rayAngle = 20; // angle of each ray
 


 
 
 
 void setup(){
  size(700,509);
  smooth();
   noStroke();
 
    x = height/2;
    y = height/2;
     
    fill(#FF9966);

  noStroke();
  img = loadImage("five.png");
  img0 = loadImage("speechbubble.png");

minim = new Minim(this);
  mySound = minim.loadFile("honk.mp3");
  mySound.play();
  

minim = new Minim(this);
  aSound = minim.loadFile("drive.mp3");
  aSound.play();
  aSound.loop();
  
 }

 
 void draw(){
background(#FFFF66);

 for(int i = 0; i <= rayNum; i++) {
        angle = i * radians(360/(rayNum+1)) + theta;
        angle2 = angle + radians(rayAngle);
 
        float x2 = x + r * cos(angle);
        float y2 = y + r * sin(angle);
         
        float x3 = x + r * cos(angle2);
        float y3 = x + r * sin(angle2);
         
        triangle(x, y, x2, y2, x3, y3);
    }
 
    theta += speed;
    
    image(img,0,0);
}


void mouseDragged(){
    if (mouseX < 225 && mouseX >50){
  image (img0, 210, -20, 282, 148);
  }
}
void mousePressed(){
  if (mouseButton == LEFT && mouseX < 225 && mouseX > 50){
    minim = new Minim(this);
  mySound = minim.loadFile("scream.mp3");
  mySound.play();
}
}

void stop(){

  minim.stop();
  super.stop();
}



