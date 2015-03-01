
void setup()
{
size(640, 360); 
noStroke(); 
background(0); 
}

void draw() {
  makeMickeys(150, 50, 200);

}

void makeMickeys(int r, int g, int b)
{
  
  int gridSize = 60;


  for (int x = gridSize; x <= width - gridSize; x += gridSize)
  {
    for (int y = gridSize; y <= height - gridSize; y += gridSize)
    {
      fill(r, g, b);
      ellipse (x,y,16, 16);
      ellipse (x+24,y,16, 16);
      ellipse(x+12, y+10, 20, 20);
    }
  }
  
}



