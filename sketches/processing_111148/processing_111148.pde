
//Kairavi Chahal | kchahal
//Homework 5 | September 17, 2013
 
//Copyright Kairavi Chahal | 2013 | Carnegie Mellon University
//All rights reserved.

//Move mouse to draw.
//Up arrow to increase size; down arrow to decrease size.
//Click to clear.

float xpos, ypos, w, h;
color col;
float scaleBy = 1;

void setup() {
  size(400, 400);
  background(#cccccc);
}

void draw() {
  xpos = mouseX;
  ypos = mouseY;
  
  drawInitials(xpos, ypos);
  
  boolean scaleUp = true;
  if (mousePressed) {
    background(#cccccc);
  }
  if (keyPressed && keyCode == UP && scaleBy < 7) {
    scaleBy = scaleBy + 0.1;
  } else if (keyPressed && keyCode == DOWN && scaleBy > 0.1) {
    scaleBy = scaleBy - 0.1;
  }
}

void drawInitials(float x, float y) { 
  float w = 10*scaleBy;
  col = color(random(x, y), random(y, x), random(x, y));
  fill(col);
  stroke(#FFFFFF);
  
  //K
  rect(x, y, w, w*5);
  rect(x+(w*3), y, w, w);
  rect(x+(w*2), y+w, w, w);
  rect(x+w, y+(w*2), w, w);
  rect(x+(w*2), y+(w*3), w, w);
  rect(x+(w*3), y+(w*4), w, w);
  
  //C
  rect(x+(w*5), y+w, w, w*3);
  rect(x+(w*6), y, w*2, w);
  rect(x+(w*6), y+(w*4), w*2, w);
  rect(x+(w*8), y+w, w, w);
  rect(x+(w*8), y+(w*3), w, w);
}


