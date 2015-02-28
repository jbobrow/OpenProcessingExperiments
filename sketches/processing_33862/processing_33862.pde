
/**
 * A hack of the basic branching algorithm  from "Recursive Tree"  by Daniel Shiffman
 * 
 */

int number = 5;

float theta;

void setup() {
  size(720, 360);
  smooth();
  stroke(0);
  noLoop();
}

void draw() {
  background(255);
  for (int i =0;i<number;i++) {
    pushMatrix();
    translate(i*width/(float)number+random(0,width/number),0);
    rotate(random(-PI/12,PI/12));
    tree(180*random(0.25,0.75));
    popMatrix();
  }
}

void tree(float angle) {
  theta = radians(angle);  

  // Start the tree from the bottom of the screen
  translate(0,height);
  // Draw a line 120 pixels
  int start = (int)random(80,120);
  strokeWeight(start/4);
  line(0,0,0,-start);
  // Move to the end of that line
  translate(0,-start);
  // Start the recursive branching!
  branch(start);
}

void branch(float h) {

  h *= random(0.5, 0.85);

  if (h > 2) {
    float a = random(0,theta);
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(a);   // Rotate by theta
    strokeWeight(h/4);
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    a = random(0,theta);
    pushMatrix();
    rotate(-a);
    strokeWeight(h/4);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  } 
  else {
    // put a flower at the end of branch
    ellipse(0,0,4,6);
  }
}


void mouseClicked() {
  redraw();
}





