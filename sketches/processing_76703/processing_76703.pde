
/*****************************************
 * Assignment 04
 * Name: Stephanie Bredbenner
 * E-mail: sbredbenne@brynmawr.edu
 * Course:  CS 110 - Section 01
 * Submitted: 10/24/2012
 * This file contains  my sketch 
 * for assignment 4, for which I coded a tree
 * in autumn.  Each time the mouse is clicked,
 * a leaf appears and falls to the ground.
***********************************************/

//variables declared
int leafNum = 0;
int leafMax = 20;
Leaf[] myLeaf = new Leaf [leafMax];

void setup() {
  size(500, 500);
  smooth ();
}
void draw() {
  background(112, 182, 206);
  drawTree ();
  //loop to display and move leaves
  for (int i = 0; i < leafMax; i++) {
    if (myLeaf[i] != null) {
      myLeaf[i].display();
      myLeaf[i].step();
    }
  }
} 

void mousePressed() {
  myLeaf[leafNum]= new Leaf ();
  leafNum = (leafNum + 1) % leafMax;
}

class Leaf {
  //variables declared
  int leafX;
  int leafY;
  int speedY;
  // constructor
  Leaf () {
    leafX = mouseX;
    leafY = mouseY;
    speedY = 1;
  }
  //fucntion to display leaf
  void display() {
    fill (232, 53, 26);
    ellipse (leafX, leafY, 40, 20);
  }
  //function to make the leaves fall 
  void step() {
      leafY = leafY + speedY;
  }
}

//function to draw a tree
void drawTree () {
  fill (116, 21, 21);
  rect (230, 200, 50, 300);
  fill (232, 53, 26);
  ellipse (255, 150, 200, 200);
  fill (1);
  ellipse (256, 350, 45, 45);
}
