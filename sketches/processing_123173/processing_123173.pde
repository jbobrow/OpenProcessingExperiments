
class Tile
{
  PVector index;
  PVector dim;
  int xx, yy;

  boolean state = false;
  int patternID = 0;
  
  float scaling = 2;
  color colour;
  int minc = 92;
  int maxc = 216;

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
    shapeMode(CENTER);
    float xpos = (index.x + 0.5) * dim.x;
    float ypos = (index.y + 0.5) * dim.y;
    if (!state)
    { 
      fill(128, 64);
      strokeWeight(1);
      noStroke();
      {
        shape(patterns[patternID], xpos, ypos, dim.x * scaling, dim.y * scaling);
      }
    }
  }

  void display()
  {
    shapeMode(CENTER);
    float xpos = (index.x + 0.5) * dim.x;
    float ypos = (index.y + 0.5) * dim.y;
    if (state)
    { 
      strokeWeight(1.5);
      stroke(colour);
      fill(colour);
      {
        shape(patterns[patternID], xpos, ypos, dim.x * scaling, dim.y * scaling);
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

  color getNewColour()
  {
    float redbit = random(minc, maxc);
    float greenbit = constrain(redbit + random(-16, 16), minc, maxc);
    float bluebit = constrain(redbit + random(-16, 16), minc, maxc);
    if((xx % 2 == 0) && (yy % 2 == 1))
    {
      return color(redbit, greenbit, bluebit);
    }
    else
    {
      return color(redbit - minc, greenbit - minc, bluebit - minc);
    }
  }

  void updateTile()
  {
    if (!state) //off so turn on
    {
      state = true;
      colour = getNewColour();
      updateNeighbours(1);
    }
    else //on so turn off
    {
      state = false;
      updateNeighbours(-1);
    }
  }
}


