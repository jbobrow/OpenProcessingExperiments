
//Kairavi Chahal | kchahal
//Homework 2 | September 5, 2013

//Copyright Kairavi Chahal | 2013 | Carnegie Mellon University
//All rights reserved.

void setup() {
  size(400, 400);
  background(#FF6F6F);
  rectMode(CENTER);
};

//change x and y to change position
float x = 200;
float y = 200;
//change wd and ht to change size
float wd = 150;
float ht = 200;

void draw() {
//  x = mouseX;
//  y = mouseY;
//  wd = 2*x;
//  ht = 2*y;
  
  //face
  strokeWeight(3);
  stroke(#000000);
  fill(#FFEE9B);
  ellipse(x, y, wd, ht);
  
  //hair
  stroke(#B9B9B9);
  fill(#B9B9B9);
  beginShape();
    curveVertex(x - 0.5*wd, y); //ref pt
    curveVertex(x - 0.6*wd, y - 0.1*ht);
    curveVertex(x - 0.6*wd, y - 0.25*ht);
    curveVertex(x - 0.5*wd, y - 0.48*ht);
    curveVertex(x, y - 0.54*ht);
    curveVertex(x + 0.5*wd, y - 0.48*ht);
    curveVertex(x + 0.6*wd, y - 0.25*ht);
    curveVertex(x + 0.6*wd, y - 0.1*ht);
    curveVertex(x + 0.4*wd, y - 0.1*ht);
    curveVertex(x + 0.35*wd, y - 0.25*ht);
    curveVertex(x + 0.2*wd, y - 0.4*ht);
    curveVertex(x, y - 0.45*ht);
    curveVertex(x - 0.2*wd, y - 0.4*ht);
    curveVertex(x - 0.35*wd, y - 0.25*ht);    
    curveVertex(x - 0.4*wd, y - 0.1*ht);
    curveVertex(x - 0.5*wd, y); //ref pt
  endShape();
  arc(x, y - 0.54*ht, ht/1.5, wd/1.5, radians(40), radians(140));
  
  //eyes
  strokeWeight(5);
  stroke(#000000);
  point(x - 0.2*wd, y - 0.1*ht);
  point(x + 0.2*wd, y - 0.1*ht);
  
  //glasses (K)
  fill(#FFFFFF, 0);
  strokeWeight(3);
  stroke(#34EA69);
  line(x - 0.3*wd, y - 0.15*ht, x + 0.3*wd, y - 0.15*ht);
  line(x, y - 0.15*ht, x + 0.1*wd, y);
  line(x, y - 0.15*ht, x - 0.1*wd, y);
  line(x - 0.1*wd, y, x - 0.3*wd, y);
  line(x + 0.1*wd, y, x + 0.3*wd, y);
  stroke(#000000);
  
  //nose (A)
  stroke(#34EAE9);
  triangle(x, y + 0.05*ht, x + 0.05*wd, y + 0.1*ht, x - 0.05*wd, y + 0.1*ht);
  stroke(#000000);
  
  //mustache (C)
  fill(#B9B9B9);
  stroke(#EA34C9);
  beginShape();
    curveVertex(x, y + 0.25*ht); //ref pt
    curveVertex(x - 0.25*wd, y + 0.25*ht);
    curveVertex(x - 0.2*wd, y + 0.15*ht);
    curveVertex(x + 0.2*wd, y + 0.15*ht);
    curveVertex(x + 0.25*wd, y + 0.25*ht);
    curveVertex(x, y + 0.25*ht); //ref pt
  endShape();
  stroke(#000000);
  //mustache lines 
  strokeWeight(1);
};


