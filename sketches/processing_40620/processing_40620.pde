
/*
 Organized Chaos #1
 Copyright Engin Ayaz
 Student at NYU ITP program, Class of 2013
 ICM Class
 Week 4 Homework
 Oct 2011
 */
 
 // A set of rectangles that respond to
 // user interaction and set themselves to order
 // in certain mouse locations

float mouseLoc;
float rotateAngle;

void setup() {
  size(900, 600);
  smooth();
  rectMode(CENTER);
  frameRate(20);
}

void draw() {
  background(52, 52, 52);

  // use push and pop-matrix to ensure
  // that coordinate system is not shifted
  // over time, and the dots/triangle remains static

  pushMatrix();
  translate((width/2)-250, (height/2)-50);
  noStroke();
  noFill();
  
  // this part of the code can be modified
  // for other visual effects
  
  drawRect(0, 0, width, height, 1.1, 8);
  drawRect(0, 0, width, height, 1.2, 16);
  drawRect(50, 50, width, height, 1.3, 24);
  drawRect(-50, -50, width, height, 1.4, 36);
  drawRect(100, 100, width, height, 1.4, 36);
  popMatrix();
  
  // for debugging
  //println(mouseX + " " +mouseY);

  // a function that shows the user
  // which locations create order out of chaos
  
  drawMousePoints();
}

// A recursive function to draw multiple rectangles
// that shift their location based on the mouse location

void drawRect(float x, float y, float w, float h, float proximity, float angle) {
  smooth();
  mouseLoc = (mouseX+mouseY) / 2 + width/2;
  stroke (random(150, 255), 67, 67, random(140, 170));
  rect(x, y, w, h, 2);
  rotateAngle = map(mouseLoc, 0, max(width, height), 0, 180);
  rotate(radians(rotateAngle));
  translate(-width/4, -height/4);
  stroke (random(150, 255), 80, 80, random(140, 170));
  if (w >= 1 && h >= 1) {
    drawRect(0, 0, w/proximity, h/proximity, proximity, angle);
  }
}

// This is to highlight a few interesting spots where order emerges. 
void drawMousePoints() {
  fill(26, 153, 255, 180);
  noStroke();
  ellipse(99, 201, 8, 8);
  ellipse(516, 25, 8, 8);
  ellipse(360, 541, 8, 8);
  stroke(26, 153, 255, 150);
  noFill();
  fill(26, 153, 255, 5);
  triangle(99, 201, 516, 25, 360, 541);
}


