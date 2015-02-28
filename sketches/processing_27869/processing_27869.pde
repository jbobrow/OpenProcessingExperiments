
class Circle
{
  float r;
  float xpos;
  float ypos;

  Circle()
  {
    xpos = random(width);
    ypos = random(height);
    r = width/14;
  }
  void display()
  {
    noStroke();
    fill(c);
    ellipse(xpos,ypos,r*2,r*2);
    c = color(0,80);
  }

  void highlight()
  {
    c = color(255,230,0,80);
    r=r+.06;
    if (r>width/4) {
      r= width/15;
    }
  }

  void move()
  {
    if(dist(mouseX,mouseY,xpos,ypos)<r)
    {
      xpos = xpos +  mouseX-pmouseX;
      ypos = ypos + mouseY-pmouseY;
      if (xpos>width+r || ypos>height+r || xpos<0-r || ypos<0-r) {
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


