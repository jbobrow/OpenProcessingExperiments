
class Tree {
  /* Tree object used in dendrite */
  /* Declare float variables to hold x and y coordinates of tree 
   */
  float xPos;
  float yPos;
  /* Declare ArrayList to hold the branches float array (coordinates for 
  each line drawn in the tree), this is the DNA for each tree 
   */
  ArrayList branches;
  /* Declare variable to hold current colour of the tree
   */
  int colour; 

  /* Tree constructor
   */
  public Tree(float _xPos, float _yPos, ArrayList _branches, int _colour) {
    xPos = _xPos;
    yPos = _yPos;
    branches = _branches;
    colour = _colour;
  }

  /* Accessor to get x coordinate for tree 
   */
  public float getX() {
    return xPos;
  }
  
  /* Accessor to get y coordinate for tree 
   */
  public float getY() {
    return yPos;
  }
  
  /* Accessor to get current colour of tree 
   */
  public int getColour() {
    return colour;
  }

  /* Method to set the x and y coordinates for the tree
   */
  public void setCoords(float _xPos,float _yPos) {
    xPos = _xPos;
    yPos = _yPos;
  }

  /* Method to set the colour of the tree
   */
  public void setColour(int _colour) {
    colour = _colour;
  }

  /* Draw method to draw tree based on the branches ArrayList
   */
  void draw() {
    stroke(0);
    for (int i = branches.size()-1; i >= 0; i--) { 
      float[] branch = (float[]) branches.get(i);
      strokeWeight(2 * branch[4]);
      switch(colourbg) {
      case 0: 
        stroke(0, 204, 0);
        break;
      case 1: 
        stroke(255, 102, 0);
        break;
      case 2: 
        stroke(102, 0, 102);
        break;
      }
      line(branch[0], branch[1], branch[2], branch[3]);
    }
  }
}


