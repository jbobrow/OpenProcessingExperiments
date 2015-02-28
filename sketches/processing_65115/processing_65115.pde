
/*
ACCD Summer 2012
ID02
Midterm1
Charlene Chen
07/06/2012

Instructor: Michael Kontopoulos
TA: Kit Cheong

Reference Code:
 * Simulate: Particles
 * from Form+Code in Design, Art, and Architecture 
 * by Casey Reas, Chandler McWilliams, and LUST
 * http://www.processing.org/download

*/


import processing.opengl.*;

PImage june5;
PImage H2;
PImage H4;

int xpos1;
int xpos2 = 200;
int xpos3 = 400;
int ypos = height/2;
int particleCount_1 = 200;
int particleCount_2 = 400;
int particleCount_3 = 100;

color juneColor1;
color juneColor2;
color juneColor3;

Particle[] particles1 = new Particle[particleCount_1];
Particle[] particles2 = new Particle[particleCount_2];
Particle[] particles3 = new Particle[particleCount_3];
boolean saving = false;

void setup() {
  size(500, 500, OPENGL);
  smooth();
  
  june5 = loadImage("june5.png");
  H2 = loadImage("H2.png");
  H4 = loadImage("H4.png");
  
  // create particles
  for (int i = 0; i < particles1.length; i++) {
    particles1[i] = new Particle(new PVector(width/2, height/2));
  }
  
  for (int i = 0; i < particles2.length; i++) {
    particles2[i] = new Particle(new PVector(width-10, 100));
  }
  
  for (int i = 0; i < particles3.length; i++) {
    particles3[i] = new Particle(new PVector(10, height-100));
  }
}

void draw() {
  background(255);
  
  
  xpos1 = xpos1 + 1;
  point (xpos1, ypos);
  xpos2 = xpos2 + 1;
  point (xpos2, ypos);
  xpos3 = xpos3 + 1;
  point (xpos3, ypos);
    
  if(xpos1 >= 500) {
    xpos1 = 0; 
  }
  
  if(xpos2 >= 500) {
    xpos2 = 0; 
  }
  
  if(xpos3 >= 500) {
    xpos3 = 0; 
  }
    
  juneColor1 = june5.get(xpos1, ypos);
  juneColor2 = june5.get(xpos2, ypos);
  juneColor3 = june5.get(xpos3, ypos);
  
  
  // draw the particles
  stroke(255, 50);
  fill(juneColor1,10);
  for (int i = 0; i < particles1.length; i++) {
    particles1[i].update();
    particles1[i].draw();
  }
  
  //stroke(255, 100);
  noStroke();
  fill(juneColor2,10);
  for (int i = 0; i < particles2.length; i++) {
    particles2[i].update();
    particles2[i].draw();
  }
  
  //stroke(255, 50);
  fill(juneColor3,10);
  for (int i = 0; i < particles3.length; i++) {
    particles3[i].update();
    particles3[i].draw();
  }
  
  
  //tint(juneColor);
  tint(255);
  //image(H, 0, 0);
  //scale(1.4);
  image(H2, 0, 0);
  //image(H4, 0, 0);
}

