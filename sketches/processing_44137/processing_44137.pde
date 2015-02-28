
Circle[] circles;
int numCircles = 0;

void setup()
{
  size(400,400);
  background(255);
  circles = new Circle[100];
}

void mousePressed()
{
  circles[numCircles] = new Circle();
  numCircles++;
}

void draw()
{
  background(255);
  for(int i = 0; i<numCircles; i++)
  {
    
    circles[i].direction();
    circles[i].display();
  }

}

class Circle
{
  float x = random(width);
  float y = random(height);
  int speedx = int(random(1,3));
  int speedy = int(random(1,3));
  

  void direction()
  {
  if ((x>width) || x<0)
    {
      speedx=speedx*-1;
    }
  if(y<0 || (y>height))
    {
      speedy=speedy*-1;
    }
    y = y +speedy;
    x = x +speedx;
  }
  
  void display()
  { 
    fill(120,120);
    ellipse(x,y,20,20);
  }
}

