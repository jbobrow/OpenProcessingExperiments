
//Kairavi Chahal | kchahal
//Homework 4 | September 12, 2013
 
//Copyright Kairavi Chahal | 2013 | Carnegie Mellon University
//All rights reserved.

//press spacebar to switch from horizontal to vertical
//hold spacebar to go diagonally
//hit enter to clear
//hold enter to "make it rain" (in vertical mode)
//hit 'c' to change background colour
//click to pause

float x, y, wd, ht;
boolean pause = false;
String mode = "horizontal";
color c;

void setup() {
  size(400, 400);
  c = color(random(255), random(255), random(255));
//  frameRate(40);
  
  wd = 20;
  ht = 40;
  x = 0;
  y = ht/2;
}

void draw() {
  if (mousePressed) {
    if (pause == true) {
      pause = false;
    } else {
      pause = true;
    }
  }
  
  if (keyPressed && key == ' ') {
    if (mode == "horizontal") {
      mode = "vertical";
    } else {
      mode = "horizontal";
    }
  }
  
  if (keyPressed && key == ENTER) {
    fill(c);
    rect(0, 0, width, height);
  }
  
  if (keyPressed && (key == 'c' || key == 'C')) {
    c = color(random(255), random(255), random(255));
    fill(c);
    rect(0, 0, width, height);
  }
  
  if (!pause) {
    if (mode == "horizontal") {
      fill(random(255), 80);
      ellipse(x, y, wd, ht);
      x = x + 10;
      if (x >= width+10) {
        x = 0;
        y = random(height);
      }
    } else if (mode == "vertical") {
      fill(random(255), 80);
      ellipse(x, y, wd, ht);
      y = y + 20;
      if (y >= height+20) {
        y = 0;
        x = random(width);
      }
    }
  }
}

//IDEA: if you click, it splits into 4 smaller ellipses
//IDEA: press 's' to change shape

//BUG: hold space and then press 'c' once to get strobe-rain


