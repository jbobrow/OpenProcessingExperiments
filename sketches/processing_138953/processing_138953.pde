
void setup()
{
  size(640, 360); 
}
 
void draw()
{
    background(255,96,48); 
    noStroke(); 
 
    int gridSize = 40;
 
    for (int x = gridSize; x <= width - gridSize; x += gridSize) 
    {
      for (int y = gridSize; y <= height - gridSize; y += gridSize) 
      {
        noStroke();
        fill(255);
        rect(x-1, y-1, 3, 3);
        stroke(255, 50);
        line(x, y, mouseX,mouseY);
  }
}
}
