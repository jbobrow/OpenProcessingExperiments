
PImage painting;
void setup()
{
  painting = loadImage("friedrich.jpeg");
  size(400, 400); 
  noStroke();
  rectMode(CENTER);
}
void draw()
{
  for (int i=20; i<width; i+=40)
  {
    for (int j=20; j<height; j+=40)
    {
      color tmp = painting.get(i,j);
      fill(tmp);
      rect(i,j, 40,40);
    }
  }
}


