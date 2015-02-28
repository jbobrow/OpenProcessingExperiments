
PImage img;


void setup() 
{
  // Images must be in the "data" directory to load correctly
  img = loadImage("prat.jpg");
  size(800,600);
}

void draw()
{
  noStroke();
  color c;
  for (int i=0; i<width; i=i+10)
  {
    for (int j=0; j<height; j=j+10)
    {
      c=img.get(i,j);
      fill(c);
      rect(i,j, 10,10);
    }
  }
}
