
/**
 * Deep Bay Animation 
 * By Chris Q.ZHANG, HKU
 * Nov 22, 2011
*/

PImage bg;
import processing.pdf.*;
float angle = 0;

float rotation_speed = 0.1;    // Speed
float rotation_color_1 = 200;  // 
float rotation_color_2 = 200;  // 
float r_s = 3;    // r=150m
float r_m = 6;   // r=250m
float r_b = 8;  // r=350m
 
void setup() {
  size(800,800);
  bg = loadImage("In1.jpg");
//  bg.loadPixels();
//  loadPixels();
    background(bg);
  smooth();
}
 
void draw () {
  background(bg);

  noStroke();
  fill(rotation_color_1,rotation_color_1,rotation_color_1);
  ellipse(296,414,r_s,r_s);
  ellipse(305,625,r_s,r_s);
  ellipse(284,678,r_s,r_s);
  ellipse(428,601,r_s,r_s);
  ellipse(590,635,r_s,r_s);
  ellipse(620,552,r_s,r_s);
  ellipse(642,463,r_s,r_s);
  
  ellipse(131,409,r_m,r_m);
  ellipse(175,439,r_m,r_m);
  ellipse(219,343,r_m,r_m);
  ellipse(292,252,r_m,r_m);
  ellipse(257,431,r_m,r_m);
  ellipse(235,614,r_m,r_m);
  ellipse(423,529,r_m,r_m);
  ellipse(560,604,r_m,r_m);
  
  ellipse(587,165,r_b,r_b);
  ellipse(333,452,r_b,r_b);
  ellipse(323,528,r_b,r_b);
  ellipse(543,543,r_b,r_b);



//  rotate(angle);
  strokeWeight(3);
  stroke(rotation_color_2,rotation_color_2,rotation_color_2);
  angle += rotation_speed;

// Small Size.

  pushMatrix();
  translate(296,414);
  rotate(angle);
  line(0,0,-4.5*r_s,0);
  popMatrix();

  pushMatrix();
  translate(305,625);
  rotate(angle);
  line(0,0,-4.5*r_s,0);
  popMatrix();

  pushMatrix();
  translate(284,678);
  rotate(angle);
  line(0,0,0,-4.5*r_s);
  popMatrix();

  pushMatrix();
  translate(428,601);
  rotate(angle);
  line(0,0,0,-4.5*r_s);
  popMatrix();

  pushMatrix();
  translate(590,635);
  rotate(angle);
  line(0,0,4.5*r_s,0);
  popMatrix();

  pushMatrix();
  translate(620,552);
  rotate(angle);
  line(0,0,0,-4.5*r_s);
  popMatrix();

  pushMatrix();
  translate(642,463);
  rotate(angle);
  line(0,0,0,4.5*r_s);
  popMatrix();

// Middle Size.

  pushMatrix();
  translate(131,409);
  rotate(angle);
  line(0,0,4.5*r_m,0);
  popMatrix();

  pushMatrix();
  translate(175,439);
  rotate(angle);
  line(0,0,-4.5*r_m,0);
  popMatrix();

  pushMatrix();
  translate(219,343);
  rotate(angle);
  line(0,0,0,-4.5*r_m);
  popMatrix();

  pushMatrix();
  translate(292,252);
  rotate(angle);
  line(0,0,4.5*r_m,0);
  popMatrix();

  pushMatrix();
  translate(257,431);
  rotate(angle);
  line(0,0,4.5*r_m,0);
  popMatrix();

  pushMatrix();
  translate(235,614);
  rotate(angle);
  line(0,0,-4.5*r_m,0);
  popMatrix();

  pushMatrix();
  translate(423,529);
  rotate(angle);
  line(0,0,0,4.5*r_m);
  popMatrix();

  pushMatrix();
  translate(560,604);
  rotate(angle);
  line(0,0,0,-4.5*r_m);
  popMatrix();


// Big Size.

  pushMatrix();
  translate(587,165);
  rotate(angle);
  line(0,0,4.5*r_b,0);
  popMatrix();

  pushMatrix();
  translate(333,452);
  rotate(angle);
  line(0,0,-4.5*r_b,0);
  popMatrix();

  pushMatrix();
  translate(323,528);
  rotate(angle);
  line(0,0,0,4.5*r_b);
  popMatrix();

  pushMatrix();
  translate(543,543);
  rotate(angle);
  line(0,0,4.5*r_b,0);
  popMatrix();
 
}


