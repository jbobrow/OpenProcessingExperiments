
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: PARK Eunjin
// ID: 201420079


import ddf.minim.*;
Minim minim;
AudioInput input;

float P;

void setup() {

  size(600, 600, P3D);
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}
void draw() {
 background(#eeeeee);
  lights();
  float mic = input.mix.level() * 1000;
 
  P = P*0.95 + mic*0.9;

  for (int i = 100; i<width; i+=100){
    for (int j = 100; j<height; j+=100) {
      for (int k = 90; k<width; k+=110) {
        for (int h = 150; h<height; h+=100) {
      
  pushMatrix();
  translate(k, h, -100);
  rotateY(-radians(P));
  fill(255);
  box(30, 30, 50);
  popMatrix();
  
  pushMatrix();
  translate(i, j, -100);
  rotateX(radians(P));
  box(80, 50, 50);
  popMatrix();
title();
}
  }
}
  }
}
void title() { 
  fill(0);
  textAlign(RIGHT);
  text("PARK Eunjin, Untitled, Dynamic Media, 2014", width-50, height-20);
}
