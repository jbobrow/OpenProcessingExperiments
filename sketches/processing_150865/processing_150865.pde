
int counter;
/*
KU Dynamic media
201420086 Shim Sang Joon
*/


//import ddf.minim.*;
//Minim minim;
//AudioInput input;

float a;
float xoff;

void setup() {
  size(600, 600, P3D);
  minim = new Minim(this);
  input = minim.getLineIn(Minim.MONO, 512);
}
void draw() {

  rectMode(CENTER);
  float mic = input.mix.level()*1000;
  a = a*1 + mic*0.95;

  background(#5189E0);
  lights();

import ddf.minim.*;
Minim minim;
AudioInput input;

float a;
float xoff;

void setup() {
  size(600, 600, P3D);
  minim = new Minim(this);
  input = minim.getLineIn(Minim.MONO, 512);
}
void draw() {

  rectMode(CENTER);
  float mic = input.mix.level()*1000;
  a = a*1 + mic*0.95;

  background(#5189E0);
  lights();

  for (int i=20; i<width; i+=100) {
    for (int j=20; j<height; j+=100) {

      float n = noise(xoff)*500;

      pushMatrix();
      translate(width/2, height/2, -200);
      rotateX(radians(mic*2));
      rotateY(radians(a*2));
      noStroke();
      stroke(#D52A3F);
      sphere(100);
      noFill();
      stroke(#2D2F4E);
      sphere(250);
      popMatrix();


      pushMatrix();
      translate(width/2, height/2, -200); 
      rotateX(radians(mic));
      rotateY(radians(a));
      noFill();
      stroke(255);
      sphere(320);
      popMatrix();
    }
  }
  title();
}
void title() { 
  textAlign(RIGHT);
  text("Shim Sang Joon, Untitled, Dynamic Media, 2014", width-50, height-20);
}

