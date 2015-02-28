
void setup()
{
  size(600, 600);
  background(0);
  smooth();
  noStroke();
}


void draw()
{
int row = 50;
int column = 50;
float side = 20;

  for (int r = 0; r<row; r++)
  {
    for (int c = 0; c<column; c++)
    {

      pushMatrix();
      translate(r*30, c*30);
      /*
      if (dist(r,c,mouseX,mouseY)>10)
      {
        side++;
      } */
      
      rotate(radians(45));
      fill(255);
      rectMode(CENTER);
      rect(r, c, side, side);
      popMatrix();
     
    }
  }
}

