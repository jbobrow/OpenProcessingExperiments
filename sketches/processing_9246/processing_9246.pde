
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import ddf.minim.*;

Minim minim;
AudioPlayer song;

float r= 200;
float c= 10;
float g= 250;
float b= 300;
float a= 300;

float diam = 20;
float x= 100;
float y= 100;

void setup() {
  minim = new Minim(this);
  
  song = minim.loadFile("STE-012.mp3");
  song.play();
  
  size(500,500);
  background(255);
  smooth();
  frameRate(20);
}
void draw() {

  r = random(255);
  
  if (!mousePressed) {
    stroke(0);
    fill(r,g,b,a);
    rect (mouseX+pmouseY,mouseY+pmouseX,mouseX,c);
    noFill();
    stroke(0);
    fill(r,g,b,a);
    rect (mouseX,mouseY-pmouseX,c,mouseY);
    noFill();
  } else {
      stroke(0);
      fill(r,g,b,a);
      ellipse (mouseX+pmouseY,mouseY+pmouseX,mouseX,mouseY);
      noFill();
      
  }
  for(int i = 0; i<song.bufferSize() - 1; i++) {
    ellipse(i, 50+ song.left.get(i)*50, i+1, 50 + song.left.get(i+1)*50);
    line(i, 150+ song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }
}


void stop() {
  song.close();
  minim.stop();
  
  super.stop();
}

