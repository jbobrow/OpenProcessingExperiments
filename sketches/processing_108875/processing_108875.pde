
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
  
  rectMode(CORNER);
  noStroke();
  fill(255);
  rect(0, 0, width, height);

  trail = 5; //if trail is too big compared to frameRate, the animation will be jumpy.

  frameRate(40);
  rectMode(CENTER);
};

void draw() {
//  background(0, 200, 0);
//  fill(0, 200, 0, 20);
//  rect(0, 0, width, height);
  
  if (mousePressed) {
    col = color(0, mouseX, mouseY);
    fill(col, random(100));
    stroke(3);
    rect(mouseX, mouseY, random(40), random(40));
    
//    //this either leaves all drawings on the canvas or makes a new background every trail frames
//    count++;
//    if (count % trail == 0) {
//      noStroke();
//      fill(200);
//      rect(0, 0, width, height);
//    }
  }
  
  //clears canvas when spacebar is pressed
  if (keyPressed && key == ' ') {
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(0, 0, width, height);
    rectMode(CENTER);
  }
};


