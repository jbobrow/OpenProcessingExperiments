
void setup ()
{
  size (255,255);
  noLoop();
}

void draw()
{
  int x = 255; 
  background(0);
  frameRate(15);
  fill(random(x),random(x),random(x));
  ellipse(random(x),random(x),random(x),random(x));  
}

void mousePressed()
{
  loop();
}

void mouseReleased()
{
  noLoop();
}
