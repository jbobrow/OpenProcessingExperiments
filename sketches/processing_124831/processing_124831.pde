
// Written by Jose Pertierra
// jpertier@andrew.cmu.edu
// Copyright Jose Periterra (November 15, 2013) All Rights Reserved

final int MAX = 25;

int [] xCoords;
int [] yCoords;
int [] xDelta;
int [] boxSize;
float x, y, z, z2;

void setup()
{
  size(displayWidth, displayHeight, P3D);
  
  xCoords = new int[MAX];
  yCoords = new int[MAX];
  xDelta = new int[MAX];
  boxSize = new int[MAX];
  
  initCoords(xCoords, 0, width);
  initCoords(yCoords, 0, height);
  initCoords(xDelta, 1, 5);
  initCoords(boxSize, 5, 50);
  
  x = 0;
  y = 0;
  z = 0;
  z2 = -100; 
}

void draw()
{
  background(0);
  drawFigures();
  moveFigures();
  drawShip();
  moveShip();
}

void initCoords(int [] coords, int min, int max)
{
  for(int i = 0; i < coords.length; i++)
  {
    coords[i] = int(random(min, max));
  }
}

void drawFigures()
{
  for (int i = 0; i < MAX; i++)
  {
    pushMatrix();
      translate(xCoords[i], yCoords[i], z2);
      noFill();
      stroke(0, 255, 0);
      box(boxSize[i]);
    popMatrix();
  }
}

void moveFigures()
{
  for (int i = 0; i < MAX; i++)
  {
    xCoords[i] += xDelta[i];
    if (xCoords[i] >= 2000)
    {
      xCoords[i] = -2000;
    }
    else if (xCoords[i] < -2000)
    {
      xCoords[i] = 2000;
    }
  }
}

void drawShip()
{
  fill(255, 0, 0);
  pushMatrix();
    translate(width*0.5, height*0.5, -5000);
    beginShape();
    vertex(0 + x, 0 + y, 0 + z);
    vertex(20 + x, -20 + y, -20 + z);
    vertex(20 + x, 20 + y, -20 + z);
    vertex(0 + x, 0 + y, 0 + z);
    endShape();
    beginShape();
    vertex(0 + x, 0 + y, 0 + z);
    vertex(-20 + x, -20 + y, -20 + z);
    vertex(20 + x, -20 + y, -20 + z);
    vertex(0 + x, 0 + y, 0 + z);
    endShape();
    beginShape();
    vertex(0 + x, 0 + y, 0 + z);
    vertex(-20 + x, -20 + y, -20 + z);
    vertex(-20 + x, 20 + y, -20 + z);
    vertex(0 + x, 0 + y, 0 + z);
    endShape();
    beginShape();
    vertex(0 + x, 0 + y, 0 + z);
    vertex(-20 + x, 20 + y, -20 + z);
    vertex(20 + x, 20 + y, -20 + z);
    vertex(0 + x, 0 + y, 0 + z);
    endShape();
  popMatrix();
}

void moveShip()
{
  z += 10;
  
  if (z >= 6000)
  {
    z = -5000;
  }
  else if (keyCode == UP)
  {
    y--;
  }
  else if (keyCode == DOWN)
  {
    y++;
  }
  else if (keyCode == RIGHT)
  {
    x++;
  }
  else if (keyCode == LEFT)
  {
    x--;
  }
}
    


