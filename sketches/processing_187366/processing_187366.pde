
int x = 0;
int y = 0;
int shapeSize = 9;

float delay = 10f;

void draw()
{
  int gridSize = 40;
  background(0); 
  noStroke(); 
  for (int x = gridSize; x <= width - gridSize; x += gridSize) 
  {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) 
    {
      noStroke();
      fill(255);
      //rect(x-1, y-1, 3, 3);
      stroke(255, 50);
      //line(x, y, width/2, height/2);
      
      drawShape(x, y, shapeSize);
    }
}

}

void  drawShape(int x, int y, int theSize)
{
  fill(255);
  noStroke();
  triangle(x-12,y,x,y-6,x,y+6);
  triangle(x,y-6,x+12,y,x,y+6);
  fill((float)x / 640f * 255f, random(255), (float)y / 360f * 255f);
  ellipse(x, y, 8, 8);
  fill((float)x / 640f * 255f, random(255), (float)y / 360f * 255f);
  ellipse(x, y, 5, 5);
}

void setup() 
{
  size (640, 360);
}





