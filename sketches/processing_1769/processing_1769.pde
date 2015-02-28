
// 20090423 KHiO+ workshop, Oslo
// Marius Watz - http://workshop.evolutionzone.com

// Basic image translation from pixel to visual form

import processing.pdf.*;

PImage monalisa;

int col;
float r,g,b,bright;

void setup() {
  size(400,400);
  
  monalisa=loadImage("monalisa.jpg");
  
  noLoop();
  smooth();
// Uncomment to output to PDF  
//  beginRecord(PDF, "Mona Lisa.pdf");
  background(0);
}

void draw() {
  
  stroke(255);
  for(int i=0; i<40; i++) {
    for(int j=0; j<40; j++) {
      col=monalisa.get(i*10,j*10);
      r=red(col);
      g=green(col);
      b=blue(col);
      bright=(brightness(col)/255)*8;
      
      fill(r,g,b);
      strokeWeight(bright/2);
      line(i*10,j*10+10, i*10+10,j*10);
      line(i*10,j*10, i*10+10,j*10+10);
    }
  }
  saveFrame();

  // Uncomment to output to PDF  
  //endRecord();
}

