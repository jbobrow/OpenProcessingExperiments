
Circle [] circles = new Circle[6];

void setup()
{
  size(300,300);
  smooth();
  for (int i = 0; i < circles.length; i++)
  {
    circles[i] = new Circle();
  }
}

void draw()
{
  background(0);
  for (int i = 0; i < circles.length; i++)
  {
    circles[i].display();
  }
}

void mouseDragged()
{
  for (int i = 0; i < circles.length; i++)
  {
    circles[i].move();
  }
}

class Circle
{
  float r;
  float xpos;
  float ypos;

  Circle()
  {
    xpos = random(width);
    ypos = random(height);
    r = 25;
  }
  void display()
  {
    noStroke();
    fill(255,80);
    ellipse(xpos,ypos,r*2,r*2);
  }

  void move()
  { 
    if(dist(mouseX,mouseY,xpos,ypos)<r)
    { 
      xpos = mouseX;
      ypos = mouseY;
      if (xpos>width || ypos>height) {
        xpos = 0;
        ypos = 0;
      }
    }
  }
}

