
PVector grid;
PVector tempr;
float x;
float y;
float easing = 0.05;


void setup()
{
  size(1000, 500);
  background(0);
  stroke(255);
  noSmooth();
}

void magnet()
{
  fill(255, 0, 0);
  ellipse(x, y, 25, 25);
}

void draw()
{
  background(0);
  stroke(255);

  float targetX = mouseX;
  float dx = targetX - x;
  if (abs(dx) > 1) {
    x = x + dx * easing;
  }

  float targetY = mouseY;
  float dy = targetY - y;
  if (abs(dy) > 1) {
    y = y + dy * easing;
  }

  for (int i=0;i<41;i++)
  {
    for (int j=0;j<21;j++)
    {
      //initiate new X,Y vector
      tempr = new PVector(x, y);

      grid = new PVector(25*i, 25*j);

      //subtracts the PVector temp
      tempr.sub(grid);

      tempr.limit(12);
      
      line(grid.x, grid.y, grid.x+tempr.x, grid.y+tempr.y);
/*
      pushMatrix();
      translate(grid.x, grid.y);

      line(0, 0, tempr.x, tempr.y);
      popMatrix();
      */

      if (mousePressed) {
        //lalala do nothing
        //all dashes jump to cursor
      }
    }
  }
  stroke(255, 0, 0);
  magnet();
}






