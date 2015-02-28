
/*
 * Pythagoras tree
 */

/**
 * Main program file
 *
 * @author Tomas de Camino
 * @author Paula Chavarría
 * @version 0.2
 *
 */
 
//================================================================================
// Global Variables
//================================================================================

float iniSize, angle;

//================================================================================
// Program's methods override
//================================================================================

/**
 * @see http://www.processing.org/reference/setup_.html
 */
void setup()
{
  size(600, 600);
  iniSize = 50;
  background(0);
  noStroke();
  smooth();
  ellipseMode(CORNER);
}

/**
 * @see http://www.processing.org/reference/draw_.html
 */
void draw()
{
  background(50);
  fill(255,200);
  
  // Sets an angle based on the mouse in order to
  // modify the tree's nodes proximity
  angle = radians((mouseY / (float) height) * 90);
  
  // Moves starting point to center the tree
  translate(width/2, height-200);

  // Starts drawing the tree through a recursive methos
  drawLeftRightNode(iniSize);
}

//================================================================================
// Drawing operations
//================================================================================

/**
 * Method which draws the left and right node of a subtree
 * @param nodeSize The node' size
 */
void drawLeftRightNode(float nodeSize)
{
  // Gets the node distance
  float newNodeSize = (nodeSize*sqrt(3))/2;
  
  // Checks if the new node distance is greater than 15 px
  if (newNodeSize > 15)
  {
    // Sets the fill color (green) with a dynamic trasnsparency
    fill(154,205,50,nodeSize*255/100);
    
    // Pushes a matrix for the left node
    pushMatrix();
    
    // Draws the node
    rotate(-angle);
    ellipse(0,0,newNodeSize, -newNodeSize);
    translate(0, -newNodeSize);
    
    // Draws the node's childrean through a recursive call
    drawLeftRightNode(newNodeSize);
    popMatrix();
    
    // Pushes a matrix for the right node
    pushMatrix();
    
    // Draws the node
    rotate(angle);
    ellipse(0,0, newNodeSize, newNodeSize);
    translate(0, -newNodeSize);
    
    // Draws the node's childrean through a recursive call
    drawLeftRightNode(newNodeSize);
    popMatrix();
  }
}

