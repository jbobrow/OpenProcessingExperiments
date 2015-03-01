
void setup()
{
  size(720, 720);
  smooth();
}

void draw()
{
  background(255);

  colorMode(HSB, 360, 100, 100);
  //x = 0 : h = 0, x = 500 : h = 360
  fill(mouseX / 2, 100, 100);
  rectMode(CENTER);
  rect(width/2, height/2, 720, 720);
}



