
int nbTilesW = 30, nbTilesH = 30;
float gapW = 4, gapH = 4;
final static float TILE_WIDTH = 35;
float tileW = TILE_WIDTH, tileH = TILE_WIDTH;
float totalW, totalH;
Tile[][] tiles;
Boolean enabled = true;

char myKey;

void setup()
{
  size(800, 500, P3D);
  rectMode(CENTER);
  strokeWeight(2);
  stroke(0);
  fill(60);

  initialize();
}

void initialize()
{
  totalW = (tileW + gapW) * nbTilesW - gapW;
  totalH = (tileH + gapH) * nbTilesH - gapH;
  tiles = new Tile[nbTilesW][nbTilesH];
  for (int i = 0; i < nbTilesW; i++)
  {
    for (int j = 0; j < nbTilesH; j++)
    {
      tiles[i][j] = new Tile(i*(tileW + gapW)-totalW/2, map(j, 0, nbTilesH, 0, totalH)-totalH/2, i, j);
    }
  }
}

void draw()
{
  lights();
  if (myKey == CODED)
  {
    switch(keyCode)
    {
    case UP:
      tileH+=2;
      initialize();
      break;
    case DOWN:
      tileH-=2;
      initialize();
      break;
    case RIGHT:
      tileW+=2;
      initialize();
      break;
    case LEFT:
      tileW-=2;
      initialize();
      break;
    case SHIFT:
      enabled = !enabled;
      break;
    }
    tileW = constrain(tileW, 15, width/2);
    tileH = constrain(tileH, 15, height/2);
  } else if (myKey == ENTER || myKey == RETURN) 
  {
    tileW = tileH = TILE_WIDTH;
    initialize();
  } 
  myKey = char(0);

  background(160);
  translate(width/2, height/2);
  PVector strength = new PVector(mouseX-pmouseX, mouseY-pmouseY);
  for (int i = 0; i < nbTilesW; i++)
  {
    for (int j = 0; j < nbTilesH; j++)
    {
      tiles[i][j].process(mouseX, mouseY, strength);
    }
  }
  for (int i = 0; i < nbTilesW; i++)
  {
    for (int j = 0; j < nbTilesH; j++)
    {
      tiles[i][j].display();
    }
  }
}

void keyPressed()
{
  //make sure that keys are taken into account BEFORE a loop starts
  myKey = key;
}


class Tile
{
  float x, y;//position
  PVector dr;//delta rotation
  PVector othersImpact = new PVector(0, 0);
  PVector r = new PVector(0, 0);//rotation
  //position on screen
  PVector minXY, maxXY;
  Boolean mouseImpacted = false;
  int i, j;

  Tile(float p_x, float p_y, int p_i, int p_j)
  {
    x = p_x;
    y = p_y;
    i = p_i;
    j = p_j;
    float X = x + width/2 - tileW/2;
    float Y = y + height/2 - tileH/2;
    minXY = new PVector(screenX(X, Y, 0), screenY(X, Y, 0));
    maxXY = new PVector(screenX(X + tileW, Y + tileH, 0), screenY(X + tileW, Y + tileH, 0));
  }

  void process(int p_mX, int p_mY, PVector p_strength)
  {
    dr = new PVector(0, 0);//delta rotation
    if (minXY.x < p_mX && p_mX < maxXY.x && minXY.y < p_mY && p_mY < maxXY.y)
    {
      dr.x = map(p_strength.y, -15, 15, PI/4, -PI/4);
      dr.y = map(p_strength.x, -15, 15, -PI/4, PI/4);
      if(enabled)
      {
        mouseImpacted = true;
        processNeighbors(dr.get());
      }
    }
  }
  
  void processNeighbors(PVector p_strength)
  {
    PVector l_strength = p_strength.get();
    if (!mouseImpacted) othersImpact.add(l_strength);
    if (l_strength.mag() > .1)
    {
      l_strength.mult(.12);
      if (i > 0) tiles[i-1][j].processNeighbors(l_strength);//left tile
      if (i < nbTilesW-1) tiles[i+1][j].processNeighbors(l_strength);//right tile
      if (j > 0) tiles[i][j-1].processNeighbors(l_strength);//top tile
      if (j < nbTilesH-1) tiles[i][j+1].processNeighbors(l_strength);//bottom tile
      l_strength.mult(.6);
      if (i > 0 && j > 0) tiles[i-1][j-1].processNeighbors(l_strength);//corner top left tile
      if (i < nbTilesW-1 && j > 0) tiles[i+1][j-1].processNeighbors(l_strength);//corner top right tile
      if (i > 0 && j < nbTilesH-1) tiles[i-1][j+1].processNeighbors(l_strength);//corner bottom left tile
      if (i < nbTilesW-1 && j < nbTilesH-1) tiles[i+1][j+1].processNeighbors(l_strength);//corner bottom right tile
    }
  }

  void display()
  {
    dr.add(othersImpact);
    r.add(dr);
    r.mult(.9);

    fill(color(map(r.x, 0, PI/4, 210, 0), map(r.y, 0, PI/4, 210, 0), 210));

    pushMatrix();
    translate(x, y);
    rotateX(r.x);
    rotateY(r.y);
    box(tileW, tileH, min(tileW, tileH)/2);
    popMatrix();

    othersImpact = new PVector(0, 0);
    mouseImpacted = false;
  }
}

