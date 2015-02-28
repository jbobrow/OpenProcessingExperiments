
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Jieun
// ID: 201420072

import ddf.minim.*;

Minim minim;
AudioInput input;

float x;
float y;

void setup() {
  size (displayWidth, displayHeight);
  background(0);
  noStroke();
  smooth();
  //noLoop();
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}

void draw() {
  float dia = input.mix.level() * 1000;
  x += input.mix.level() * 100;

  for (int i = 40; i < width-10; i = i + 40) { 
    for (int j = 40; j < height-10; j = j + 40) { 

      stroke(255); 
      strokeWeight(2); 
      noFill(); 
      line(i+30, j+30, i+30, j+30, i+30, j+30); 
      rectMode(CENTER); 
      rect(i, j, dia, dia);
      ellipse(i, j, dia, dia);
    }
  }
}

void keyPressed() {
  background(0);
  redraw();
}

void stop() {
  minim.stop();
  super.stop();
}

