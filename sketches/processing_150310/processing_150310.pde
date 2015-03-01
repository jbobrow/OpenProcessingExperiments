
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

// variables to store the delay and target counts
int delayCount;
int targetCount;
int circlesLinkColor,pointsLinkColor,trianglesLinkColor,squaresLinkColor;
ArrayList <PVector>triangles, squares, circles,points;

// setup function
void setup() {
  size(500, 500);
  background(255);
  smooth();
  triangles=new ArrayList <PVector>();
  squares=new ArrayList <PVector>();
  circles=new ArrayList <PVector>();
  points=new ArrayList <PVector>();
  circlesLinkColor=0xFFFF0000;
  squaresLinkColor=0xFF00AAEE;
  trianglesLinkColor=0xFF8822AA;
  pointsLinkColor=0x51AA8822;
  delayCount = 0;
  targetCount = (int) random(3, 10); // set target count to a random integer between 10 and 50
}

// draw function
void draw() {

  /* draw a rectangle on your mouse point while you pressing 
   the left mouse button*/

  int style; 

  delayCount++; // increment delay count (shorthand for delayCount = delayCount + 1)

  if (delayCount == targetCount) {
    style = (int) random(4);
    targetCount = (int) random(3, 10) ;
    delayCount = 0;
  } else {
    style = 0;
  }


  if (mousePressed) {

    stroke(0); 
    fill(0);

    // switch statement
    switch(style) {
    case 0:
      // draw a point
      strokeWeight(1);
      point(mouseX, mouseY);
      points.add(new PVector(mouseX, mouseY));
      noFill();
      stroke(pointsLinkColor);
      strokeWeight(.1);
        for (int i=max(0,points.size()-12); i<points.size(); i++) {
          line(mouseX, mouseY, points.get(i).x, points.get(i).y);
      }
      break;

    case 1:
      // draw a circle with random radius
      float esize = random(1, 20);
      ellipse(mouseX, mouseY, esize, esize);
      circles.add(new PVector(mouseX, mouseY));
      noFill();
      stroke(circlesLinkColor);
      strokeWeight(esize/10);
      if (circles.size()>1) {
        for (int i=circles.size ()-2; i<circles.size(); i++) {
          line(mouseX, mouseY, circles.get(i).x, circles.get(i).y);
        }
      }
      break;

    case 2:
      // draw a random sized rectangle
      float qsize = random(1, 10);
      quad(mouseX-qsize, mouseY, mouseX, mouseY-qsize, mouseX+qsize, mouseY, mouseX, mouseY+qsize   );
      squares.add(new PVector(mouseX, mouseY));
      noFill();
      stroke(squaresLinkColor);
      strokeWeight(qsize/10);
      if (squares.size()>1) {
        for (int i=squares.size ()-2; i<squares.size(); i++) {
          line(mouseX, mouseY, squares.get(i).x, squares.get(i).y);
        }
      }
      break;

    case 3:
      // draw a triangle with random size
      float tsize = random(1, 10);
      triangle(mouseX-tsize, mouseY+tsize, mouseX, mouseY-tsize, mouseX+tsize, mouseY+tsize); 
      triangles.add(new PVector(mouseX, mouseY));
      noFill();
      stroke(trianglesLinkColor);
      strokeWeight(tsize/10);
      if (triangles.size()>1) {
        for (int i=triangles.size ()-2; i<triangles.size(); i++) {
          line(mouseX, mouseY, triangles.get(i).x, triangles.get(i).y);
        }
      }
      break;
    } // end of switch statement
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
  triangles=new ArrayList <PVector>();
  squares=new ArrayList <PVector>();
  circles=new ArrayList <PVector>();
  points=new ArrayList <PVector>();
}
