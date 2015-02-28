
PVector grid;
PVector temp;

void setup()
{
  size(800,500);
  stroke(0,0,255);
}

void draw()
{
  background(230); 
  for(int i=0;i<100;i++)
  {
    for(int j=0;j<100;j++)
    {
      temp = new PVector(mouseX,mouseY);
      grid = new PVector(10*i,10*j);
      temp.sub(grid);
      temp.limit(7);
      pushMatrix();
      translate(grid.x,grid.y);
      line(0,0,temp.x,temp.y);
      popMatrix();
    }
  } 
}

