

import ddf.minim.*;
import peasy.*;
PeasyCam cam;

Minim minim;
AudioPlayer mp3;

float lineWidth = 2;
float rotateaa  = 0;


void setup() {


  frameRate(30);
  size(400,400,P3D);
  minim = new Minim(this);

  cam = new PeasyCam(this, 0,0, 0, 500);

  mp3 = minim.loadFile("AtRest.mp3");
  mp3.loop();
}

void draw() {


   background(255);
  strokeWeight(2);
  stroke(0,100);
  audioWave();
  
}


void audioWave() {
  for(int y = 0; y < height ; y+=20) {
    noFill();
    beginShape();
    for(int i = 0; i <=width; i++) {

      vertex(i,y,mp3.right.get(i)*500);
    }
    endShape();
  }
}


