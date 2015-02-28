
class Board
{
  /* terrain (walls) */
  
  private MazeNode nodes[][];
  
  public Board(MazeNode nodes[][])
  {
    this.nodes = nodes;
  }
  
  
  public void rotateTerrain(float rotAmt)
  {
    mazeAng -= rotAmt;
    mazeAng = mazeAng % (2*PI);
    
    // linear transformation with matrix T = [[cos, -sin],[sin, cos]]
    // Matrix Theory was a helpful class, yay!
    PVector transX = new PVector(cos(rotAmt), -sin(rotAmt));
    PVector transY = new PVector(sin(rotAmt), cos(rotAmt));
    
    for (FBody fb : rotateUs)
    {
      fb.adjustRotation(rotAmt);
      PVector v = new PVector(fb.getX() - width/2, fb.getY() - height/2);
      fb.setPosition(v.dot(transX) + width/2, v.dot(transY) + height/2);
    }
  }
  public void initTerrain()
  {
    int row,col;
    // fill in north and west walls for every node
    for (row = 0; row < ROWS; ++row)
    {
      for (col = 0; col < COLS; ++col)
      {
        if (nodes[row][col].walls[0] == 1)  // north wall exists
        {
          FBox fb = new FBox(GAP, 2);
          fb.setPosition(col * GAP + offsetX, row * GAP - (GAP/2) + offsetY);
          fb.setStatic(true);
          //fb.setGrabbable(false);    // <-- THIS COULD PROVIDE INTERESTING OPPORTUNITIES
          rotateUs.add(fb);
          world.add(fb);
        }
        if (nodes[row][col].walls[3] == 1)  // west wall exists
        {
          FBox fb = new FBox(2, GAP);
          fb.setPosition(col * GAP - (GAP/2) + offsetX, row * GAP + offsetY);
          fb.setStatic(true);
          //fb.setGrabbable(false);    // <-- THIS COULD PROVIDE INTERESTING OPPORTUNITIES
          rotateUs.add(fb);
          world.add(fb);
        }
      }
    }
    // fill in the east walls for the last column
    col = COLS - 1;
    for (row = 0; row < ROWS; ++row)
    {
      if (nodes[row][col].walls[1] == 1)  // east wall exists
      {
        FBox fb = new FBox(2, GAP);
        fb.setPosition(col * GAP + (GAP/2) + offsetX, row * GAP + offsetY);
        fb.setStatic(true);
        //fb.setGrabbable(false);    // <-- THIS COULD PROVIDE INTERESTING OPPORTUNITIES
        rotateUs.add(fb);
        world.add(fb);
      }
    }
    // fill in the south walls for the last row
    row = ROWS - 1;
    for (col = 0; col < COLS; ++col)
    {
      if (nodes[row][col].walls[2] == 1)  // south wall exists
      {
        FBox fb = new FBox(GAP, 2);
        fb.setPosition(col * GAP + offsetX, row * GAP + (GAP/2) + offsetY);
        fb.setStatic(true);
        //fb.setGrabbable(false);    // <-- THIS COULD PROVIDE INTERESTING OPPORTUNITIES
        rotateUs.add(fb);
        world.add(fb);
      }
    }
  }
}

