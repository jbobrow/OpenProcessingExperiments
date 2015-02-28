


/*

IxD interactive logo

This is a logo for the course of Interaction Design in Venice.
This is an interactive logo, so you can move your mouse, on left and right, 
and see how it reveals the X element.

Mariasole Piva
19/10/2012

Version 1

*/


void draw() {
 
  println(mouseX + " " + mouseY);
  noStroke();
  
/*
  //i
  fill(255);
  rect(60, 97, 17, 186);
   

  //d
  textSize(256);
  text("D", 277, 282);
*/

image(img, 0, 0, 515, 375);

  //x

  translate(0, -7);
  fill(255, 0, 0, 220);    

  pushMatrix();
  beginShape();
  vertex(ax, ay);
  vertex(bx + mouseX/8, by);
  vertex(cx, cy);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(147, 270);
  beginShape();
  rotate(-2);
  vertex(a2x, a2y);
  vertex(b2x - mouseX/8, b2y);
  vertex(c2x, c2y);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(175, 185);
  rotate(-3.15);
  beginShape();
  vertex(a1x, a1y);
  vertex(b1x + mouseX/8, b1y);
  vertex(c1x, c1y);
  endShape(CLOSE); 
  popMatrix();


  pushMatrix();
  translate(280, 57);
  rotate(1.17);
  beginShape();
  vertex(a1x, a1y);
  vertex(b1x + mouseX/8, b1y);
  vertex(c1x, c1y);
  endShape(CLOSE); 
  popMatrix();



  

}



int ax = 160;
int ay = 175;
int bx = 225;
int by = 313;
int cx = 225;
int cy = 313;

int a1x = -15;
int a1y = -10;
int b1x = 50;
int b1y = 128;
int c1x = 50;
int c1y = 128;

int a2x = -49;
int a2y = -95;
int b2x = 78;
int b2y = 43;
int c2x = 78;
int c2y = 43;

PImage img;



void setup() {
   background(255);
  size(515, 375);
  
  img = loadImage("ixd.jpg");

 
}



