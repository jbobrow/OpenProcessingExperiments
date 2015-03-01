
/*
 * Creative Coding
 * Week 1, 03 - Draw your name! (part 3)
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image.
 * Press 'r' to erase all your drawing and start with a blank screen
 * 
 */

int pointsLinkColor;
ArrayList <PVector>points;

// setup function
void setup() {
  size(500, 500);
  background(255);
  smooth();
  points=new ArrayList <PVector>();
  pointsLinkColor=0xAAFF8822;
}

// draw function
void draw() {

  /* draw a rectangle on your mouse point while you pressing 
   the left mouse button*/

  int style; 

  if (mousePressed) {

    stroke(0); 
    fill(0);
      
      points.add(new PVector(mouseX, mouseY));
      noFill();
      stroke(pointsLinkColor);
      strokeWeight(.1);
        for (int i=max(0,points.size()-12); i<points.size(); i++) {
          line(mouseX, mouseY, points.get(i).x, points.get(i).y);
      }
  }

  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    setup();
  }
}
void mouseReleased() {
  points=new ArrayList <PVector>();
}
