
//Code from Kevin Yien 
//http://www.openprocessing.org/visuals/?visualID=29934

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
int n=0;
PImage img;
float inc = 0.0;
float[] xArray;
float[] unitArray;
int numBlades = 300;

void setup() {
  size(800, 600);
  img = loadImage("IMG_2238.jpg");
   stroke(#7a9637,random(100,200));
   smooth();
  frameRate(80);
  xArray = new float[numBlades];
  unitArray = new float[numBlades];
  for (int i = 0; i < numBlades; i++) {
    xArray[i] = random(0,800);
    unitArray[i] = random (5,50);
  }
minim = new Minim(this);
  mySound = minim.loadFile("wind.mp3");
  mySound.play();
  mySound.loop();
}

 
 
void draw() {
  background(img);

  float angle = sin((mouseX-320)/(960/PI))/4; 
  for(int i = 0; i < numBlades; i++) {
    tail(xArray[i], unitArray[i]-(mouseY/8), angle/5);
  }
if (mousePressed &&(mouseButton == LEFT)){
stroke(#55ff6d,random(100,200));
}
else if (mousePressed && (mouseButton == RIGHT)){
stroke(#ff9536,random(100,200));
 }
 else{
 stroke(#7a9637,random(100,200));
}


}
 
void tail(float x, float units, float angle) {
  pushMatrix();
  translate(x, height);
  for (float i = units; i > 0; i--) {
    strokeWeight(i/8);
    line(0, 0, 0, -8);
    translate(0, -8);
    rotate(angle);
  }
  popMatrix();
}



void stop(){

  minim.stop();
  super.stop();
}



