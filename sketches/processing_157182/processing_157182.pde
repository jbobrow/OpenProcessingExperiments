
//learning processing

float angle = 0;

void setup()
{
  size(200, 200);
}

void draw()
{
  background(100);
  stroke(255);
  
  translate(width/2, height/2);
  
  for(float i = 0; i < TWO_PI; i += 0.2)
  {
    pushMatrix();
    rotate(angle + i);
    line(0, 0, 100, 0);
    
    for(float j = 0; j < TWO_PI; j += 0.5)
    {
      pushMatrix();
      translate(100, 0);
      rotate(-angle - j);
      line(0, 0, 50, 0);
      popMatrix();
    }
    popMatrix();
  }
  
  angle += 0.01;
}
