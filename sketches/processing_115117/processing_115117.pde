
int radius = 50;
void setup()
{
  colorMode(RGB);
  background(207, 150, 128);
  noStroke(); 
  fill(216, 73, 80);
  size(720, 480);
  for (int i = 0; i < width; i=i+95)
  {
    for (int j = 0; j < height; j = j+84)
    {     
      ellipse(i+25, j+25, radius, radius);
    }
  }
}
void draw()
{
  strokeWeight(random(.5,55));
  strokeCap(SQUARE);
  stroke(0);
  if(mousePressed)
  {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if(keyPressed && key=='s')
  {
    //saveFrame("#####.tif");
  }
}



