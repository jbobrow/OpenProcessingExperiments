
/*

IxD interactive logo

This is a logo for the course of Interaction Design in Venice.
This is an interactive logo, so you can move your mouse, on left and right, 
and see how it changes the logo elements, 
that recompose them in a ever new composition.

Mariasole Piva
19/10/2012

Version 1

*/

import processing.pdf.*;


int ax = 23;
int ay = -80;
int bx = -13;
int by = -20;
int cx = -40;
int cy = 158;
int dx = 23;
int dy = 170;

int ex = -65;
int ey = -70;
int fx = -20;
int fy = 25;
int gx = 20;
int gy = 45;

int e1x = -65;
int e1y = -70;
int g1x = 20;
int g1y = 45;
int ox = 50;
int oy = 45;

int hx = 55;
int hy = -60;
int ix = -75;
int iy = 55;
int lx = -40;
int ly = 55;

int h1x = 55;
int h1y = -60;
int mx = 75;
int my = -60;
int nx = 5;
int ny = 0;

int px = -60;
int py = -85;
int qx = -60;
int qy = 140;
int rx = 45;
int ry = 165;
int sx = 75;
int sy = 70;

boolean makePDF = false;

void setup(){
  size(500, 330, P3D);


  smooth(4);
  
  
}

void mousePressed(){
  makePDF = true;
}


void draw() {
  if (makePDF) {
    beginRecord(PDF, "file.pdf");
  }
  background(0);
  noStroke();

  translate(55, -50);
  scale(0.8);

  fill(255, 0, 0, 190);    
  /*
beginShape();
   vertex(ax - mouseX/10, ay - mouseY/10);
   vertex(bx, by - mouseY/3);
   vertex(cx + mouseX/5, cy - mouseY/3);
   vertex(dx, dy - mouseY/2);
   endShape(CLOSE);  
   */


  // i

  // opens a new layer
  pushMatrix();

  // moving the layer
  translate(102, 205);

  // rotate the layer to it center
  rotate(mouseX * 0.0109);


  // scale the element
  scale(1 - mouseX * 0.001);

  beginShape();
  vertex(ax, ay);
  vertex(bx, by);
  vertex(cx, cy);
  vertex(dx, dy);
  endShape(CLOSE);
  popMatrix();



  // x

    fill(255, 0, 0, 200);
  pushMatrix();
  translate(210, 255);
  rotate(mouseX * 0.0062);
  scale(1 + mouseX * 0.003);
  beginShape();
  vertex(ex, ey);
  vertex(fx, fy);
  vertex(gx, gy);
  endShape(CLOSE);  
  popMatrix();



  fill(255, 0, 0, 140);  
  pushMatrix();
  translate(210, 255);
  rotate(-mouseX * 0.006393);
  scale(1 + mouseX * 0.003);
  beginShape();
  vertex(e1x, e1y);
  vertex(ox, oy);
  vertex(g1x, g1y);
  endShape(CLOSE);  
  popMatrix();



  fill(255, 0, 0, 140);  
  pushMatrix();
  translate(210, 255);
  rotate(-mouseX * 0.0062);
  scale(1 + mouseX * 0.0025);
  beginShape();
  vertex(hx, hy);
  vertex(ix, iy);
  vertex(lx, ly);
  endShape(CLOSE);
  popMatrix();



  fill(255, 0, 0, 190);    
  pushMatrix();
  translate(210, 255);
  rotate(+mouseX * 0.00639);
  scale(1 + mouseX * 0.0025);
  beginShape();
  vertex(h1x, h1y);
  vertex(mx, my);
  vertex(nx, ny);
  endShape(CLOSE);  
  popMatrix();



  // d

  fill(255, 0, 0, 190);    

  pushMatrix();
  translate(370, 210);
  rotate(-mouseX * 0.0109);
  scale(1 - mouseX * 0.001);
  beginShape();
  vertex(px, py);
  vertex(qx, qy);
  vertex(rx, ry);
  vertex(sx, sy);
  endShape(CLOSE);  
  popMatrix();
  
  if(makePDF){
    endRecord();
    makePDF = false;
  }
  
}
