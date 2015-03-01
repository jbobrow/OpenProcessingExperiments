
float R;
float Rsize;
void setup()
{
  size(640, 360);
  smooth();
  Rsize = 40;
}
void draw()
{
  background(51);
  
  for(float i = 0; i <= width; i=i+Rsize)
  {
    for(float j = 0; j <= height; j=j+Rsize)
    {
      
      R = random(0, Rsize);
      circleGen(i, j);
    }
  }
  
}

void circleGen(float a , float b)
{
  for(int i = 0; i<R;i=i+3)
  {
    noFill();
    stroke(random(255), random(255),random(255));
    strokeWeight(3);
    ellipse(a, b, i, i);
  }
}



