
/*
 * Creative Coding
 * Week 1, 01 - Draw your name!
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 * This adaptaion by R Knight (@dukidog)
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image to the file "yourName.jpg"
 * Press 'r' to erase your drawing and start with a blank screen
 * 
 */


// setup function -- called once when the program begins
void setup() {
  size(500, 500);
  background(255);
}


void draw() {
  if (mousePressed) {
    noStroke(); //(170); // set the stroke colour to a light grey
    fill(0,0,128, 64); // set the fill colour to black with transparency

    float r = map(mouseX,0,width,1,20);

    ellipse(mouseX, mouseY, r, r);
    ellipse(width-mouseX, mouseY, r, r);
    ellipse(mouseX, height-mouseY, r, r);
    ellipse(width-mouseX, height-mouseY, r, r);
    // swap mouseX and mouseY
    ellipse(mouseY, mouseX, r, r);
    ellipse(width-mouseY, mouseX, r, r);
    ellipse(mouseY, height-mouseX, r, r);
    ellipse(width-mouseY, height-mouseX, r, r);
  }

  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(255);
  }
}



