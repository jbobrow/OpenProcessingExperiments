
PImage img = null;

 /* @pjs preload="fuzzyFarbe.jpg"; */ 
  
void setup()
{
  size (600, 600);
  smooth();
  img = loadImage ("fuzzyFarbe.jpg");
}
  
void draw ()
{
  background (#57385c);
  
  int steps = 20;
  
  if (mousePressed == true) {
    steps = (int) map (mouseX, 0, width, 2, 40);
  }
  
  int x = 0;
  while (x < width)
  {
    int y = 0;
    while (y < height)
    {
  
      color c = img.get (x, y);
      float helligkeit = brightness (c);
  
      float d = map (helligkeit, 0, 255, 1, steps);
  
      fill (c);
      noStroke();
  
      ellipse (x+steps/2, y+steps/2, d, d);
      y = y+ steps;
    }
    x = x+steps;
  }
  
  //if (frameCount == 10) saveFrame ("car.png");
}


