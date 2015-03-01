
float delta = 3;
float r = 200;

void setup()
{
  size(600,600, P3D);

}

void draw()
{
    background(255);
  translate(width/2, height/2, 0);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));

  for(float r = -200; r < 200; r += 1)
  {
    for (float deg =0; deg <360; deg += delta)
    {
      float theta = radians(deg);
      float x= r * cos(theta);
      float y= r * sin(theta);
      point(x,y,r);
    }
  }
}
