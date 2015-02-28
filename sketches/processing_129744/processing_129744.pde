
/**
 This is a simple fractal tree. We use transformations to move around the tree
 and a recursive function to give the tree its recursive and complex structure.
 
 It uses branching code borrowed from Daniel Shifman's " The Nature of Code".
 
 C. Andrews
 2014-01-23
 **/


Tree tree; // our tree variable
void setup() {
  size(600, 600);

  // create a new Tree
  tree = new Tree();

  // set the height of the trunk of the tree
  tree.treeHeight = 200;
  // set the angle of the branches
  // the radians() function converts from degrees to radians -- we are using it
  // because degrees can be a little easier to picture and change
  tree.theta = radians(22);
}


void draw() {
  background(255);
  // translate to the bottom of the canvas to "plant the tree"
  translate(width/2, height);
  // draw the tree
  tree.paint();
}


class Tree {
  float treeHeight; // the height of the tree's trunk
  float theta; // the angle for all of the branches

  /**
   The constructor.
   
   Nothing in here right now, but you will probably use this later.
   **/
  Tree() {
  }

  /**
   This is the real work horse -- this is the recursive fucntion that draws the tree.
   
   This draws the trunk and then translates to the far end. Then, if we haven't gotten 
   too small, it rotates in one direction and draws a smaller tree, then it rotates in
   the other direction and draws a second one.
   
   Note the use of push and pop to make sure we keep returning the the pointat the top
   of the trunk.
   **/
  void branch(float len) {

    line(0, 0, 0, -len);
    translate(0, -len);

    len *= 0.66;

    if (len > 2) {
      pushMatrix();
      rotate(theta);
      branch(len);
      popMatrix();
      pushMatrix();
      rotate(-theta);
      branch(len);
      popMatrix();
    }
  }

  /**
   Our paint fcuntion just calls our recursive function.
   **/
  void paint() {
    branch(treeHeight);
  }
}



