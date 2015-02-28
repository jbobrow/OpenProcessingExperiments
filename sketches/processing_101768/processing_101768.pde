
float time= 0;
void setup()
{
  size(1028, 640);
  background(0);
  colorMode(HSB);
}
void draw()
{
 background(0);
  //stroke(mouseY-mouseX, mouseX, 300);
  stroke(mouseX*255/width, 255*mouseY/height, 255);
  //fill(255, 255, 0);
  time=time + 0.01;
  translate(width/2, height/2);
  for (int i=0; i<20; i++)
  {
    rotate(time);

    triangle(i, i+40, i+mouseY/2);
  }
}

void triangle(float x1, float x2, float y1)
{
  float base = abs(x1 - x2);

  float y2= y1;
  float x3= x1+(base/2);
  float y3= y1-(sqrt(3) * (x2-x1) * 0.5);
  line(x1, y1, x2, y2);
  line(x3, y3, x2, y2);
  line(x1, y1, x3, y3);
}
