
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
    for (int j = 0; j < circles.length; j++)
    {
      
  
      if(i != j && (circles[i]).intersect(circles[j])) {
        println("intersectinglines");
      }
    }
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
      xpos = xpos +  mouseX-pmouseX;
      ypos = ypos + mouseY-pmouseY;
      if (xpos>width || ypos>height) {
        xpos = 0;
        ypos = 0;
      }
    }
  }

boolean intersect (Circle c){
    float distance = dist(xpos,ypos,c.xpos,c.ypos);
    if(distance < r+c.r)
    {
      return true;
    } 
    else {
      return false;
    }
}
}


