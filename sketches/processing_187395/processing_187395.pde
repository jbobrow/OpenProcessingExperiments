
void setup()
{
size(640, 360); 
noStroke(); 
background(0); 
}

void draw() {
  makeMickeys(30);

}

void makeMickeys(int opacity)
{
  
  int gridSize = 60;


  for (int x = gridSize; x <= width - gridSize; x += gridSize)
  {
    for (int y = gridSize; y <= height - gridSize; y += gridSize)
    {
      fill(random(255),random(255),random(255),opacity);
      ellipse (x,y,16, 16);
      ellipse (x+24,y,16, 16);
      ellipse(x+12, y+10, 20, 20);
    }
  }
  
}



