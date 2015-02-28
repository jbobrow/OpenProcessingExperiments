
float angle = radians(135);
float radius = 140;

void setup()
{
  size(300, 300);
}

void draw()
{
  background(128);
  translate(width/2, height/2);

  float current = angle;
  float prev = 0;

  for (int n = 0; n < 1000; ++n)
  {
    line(radius * cos(prev), radius * sin(prev), radius * cos(current), radius * sin(current)); 
    current += angle;
    prev += angle;
  }
}

void setAngle(float f)
{
  angle = radians(f);
}
