
Circle Circle;

void setup()
{
  size(300,300);
  smooth();
  Circle = new Circle();
}

void draw()
{
  background(0);

  Circle.display();
}

void mouseDragged()
{
  Circle.move();
}

class Circle
{
  float r;
  float xpos;
  float ypos;

  Circle()
  {
    r = 25;
  }
  void display()
  {
    stroke(0);
    fill(255);
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


