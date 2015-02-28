
class Tile
{
  PVector index;
  PVector dim;
  int xx, yy;

  boolean state = false;
  int patternID = 0;
  int randomSet = (int)random(3);

  Tile(PVector index, PVector dim)
  {
    this.index = index;
    this.dim = dim;

    xx = (int)index.x;
    yy = (int)index.y;
  }
  
  void showPatternID()
  {
    fill(0);
    text(patternID, index.x * dim.x + 20, index.y * dim.y + 30);
  }

  void showNeighbours()
  {
    float xpos = index.x * dim.x;
    float ypos = index.y * dim.y;
    if (!state)
    { 
      fill(255);
      stroke(0);
      {
        if (randomSet == 0) shape(patternsA[patternID], xpos, ypos, dim.x, dim.y);
        if (randomSet == 1) shape(patternsB[patternID], xpos, ypos, dim.x, dim.y);
        if (randomSet == 2) shape(patternsC[patternID], xpos, ypos, dim.x, dim.y);
      }
    }
  }

  void display()
  {
    float xpos = index.x * dim.x;
    float ypos = index.y * dim.y;
    float bluebit = map(xpos, 0, width-dim.x, 0, 255);
    float greenbit = map(ypos, 0, height-dim.y, 0, 255);
    float redbit = 128;
    if (state)
    { 
      noStroke();
      fill(redbit, greenbit, bluebit);
      {
        if (randomSet == 0) shape(patternsA[patternID], xpos, ypos, dim.x, dim.y);
        if (randomSet == 1) shape(patternsB[patternID], xpos, ypos, dim.x, dim.y);
        if (randomSet == 2) shape(patternsC[patternID], xpos, ypos, dim.x, dim.y);
      }
    }
  }

  void updateNeighbours(int updateFactor) //add = 1 for update, -1 for rollback
  {
    //right
    if (index.x < numTiles.x - 1)
    {
      tiles[xx + 1][yy].updatePatternID(4 * updateFactor);
    }
    //down
    if (index.y < numTiles.y - 1)
    {
      tiles[xx][yy + 1].updatePatternID(8 * updateFactor);
    }
    //left
    if (index.x > 0)
    {
      tiles[xx - 1][yy].updatePatternID(1 * updateFactor);
    }
    //up
    if (index.y > 0)
    {
      tiles[xx][yy - 1].updatePatternID(2 * updateFactor);
    }
  }

  void updatePatternID(int addOrSubractNeighbour)
  {
    patternID += addOrSubractNeighbour;
    patternID = constrain(patternID, 0, 15);
  }

  void updateTile()
  {
    if (!state) //off so turn on
    {
      state = true;
      randomSet = (int)random(3);
      updateNeighbours(1);
    }
    else //on so turn off
    {
      state = false;
      updateNeighbours(-1);
    }
  }
}


