
void setup ()
{
  size (600, 200);
  smooth();
  frameRate (30);
  colorMode (HSB, 360,100, 100);
}

void draw ()
{
  background (#57385c);
  
  fill (frameCount % 360, 100, 90);
  stroke (0,0,100);
  strokeWeight (3);
  ellipse (width/2, height/2, 100, 100);
}


