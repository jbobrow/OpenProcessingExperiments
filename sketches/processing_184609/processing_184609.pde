

import processing.video.*;

Movie imagineJustice;

void setup() {
  size(720,480);
  imagineJustice = new Movie(this, "imaginemp4.mp4");
  imagineJustice.loop(); 
  size(400,200);
  f = createFont("Georgia",24,true);  
  // Initialize headline offscreen to the right 
  x = width; 
}

// Headline at Bottom
String[] headlines = {
  "No Justice, No Peace!",
  };

PFont f;  //font variable
float x;  // horizontal location of headline
int index = 0;


void draw() {
  background(255);
  fill(0);
  
  //particles
  ParticleSystem ps;

setup() 
  size(300, 180, P3D);
  noStroke();
  colorMode(RGB, 1);
  fill(0.4);
}

