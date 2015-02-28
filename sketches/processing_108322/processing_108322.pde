
//Kairavi Chahal | kchahal
//Homework 3 | September 10, 2013

//Copyright Kairavi Chahal | 2013 | Carnegie Mellon University
//All rights reserved.

float x, y, wd, ht;
int count = 0;
color col;
int trail;

void setup() {
  size(400, 400);
  fill(0, 0, 255);
  stroke(3);

  x = 0;
  y = height*0.6;
  wd = width*0.35;
  ht = height*0.43;
  trail = 5; //if trail is too big compared to frameRate, the animation will be jumpy.

  frameRate(40);
  rectMode(CENTER);
};

void draw() {
  //  background(0, 200, 0);
  //  fill(0, 200, 0, 20);
  //  rect(0, 0, width, height);
  
  if (mousePressed) {
    col = color(0, mouseX, mouseX-mouseY);
    fill(col, random(100));
    stroke(3);
    rect(mouseX, mouseY, random(40), random(40));
    
    //this either leaves all drawings on the canvas or makes a new background every trail frames
//    count++;
//    if (count % trail == 0) {
//      noStroke();
//      fill(200);
//      rect(0, 0, width, height);
//    }
  }

//  fill(255, 0, 0);
//  triangle(mouseX, mouseY, width, width, width, 0);
//
//  fill(0, 0, 255);
//  triangle(mouseX, mouseY, 0, width, 0, 0);
//
//  fill(255, 255, 0);
//  triangle(mouseX, mouseY, 0, height, width, height);
//  x = x + 1;
};


