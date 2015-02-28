
//copyright Erica Gatts
//just messing around
float x, y, num;

void setup()
{
  size(500, 500);
  smooth();
  background(random(256), random (256), random(256), random(50));
  num = 5;
  x = random(500);
  y = 500;
}

void draw()
{
}
void mouseMoved()
{
  strokeWeight(random(29));
  stroke(0, random(100));
  line(pmouseX, pmouseY, mouseX, mouseY);
}
void mousePressed() 
{
  background(random(256), random(256), random(256));
  //saveFrame("draw.jpg");
}



