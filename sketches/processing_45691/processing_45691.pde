
class Fly
{
  float x, y;
  float xSpeed, ySpeed;
  
  color c = color(255, 245, 134);
  
  //constructor
  Fly(int _x, int _y, float _xSpeed, float _ySpeed)
  {
    x = _x;
    y = _y;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
  }
  
  void drawFly()
  {
    fill(c);
    ellipse(x, y, 8, 16);
    fill(255, 255, 255, 127);
    ellipse(x+4, y-8, 16, 6);
    ellipse(x-4, y-8, 16, 6);
    fill(0);
    ellipse(x, y-8, 8, 8);
  }
  
  void moveFly()
  {
    x += xSpeed;
    y += ySpeed;
    
    //println(frameCount + " " + xSpeed);
    
    if(x > width || x < 0)
    {
      xSpeed *= -1;
    }
    
    if(y > 3*height/4 || y < 50)
    {
      ySpeed *= -1;
    }
    
  }
  
  void dimFly()
  {
    if (dist(x, y, mouseX, mouseY) <=50)
    {
      c = color(126, 120, 3);
    }
    else
    {
      c = color(255, 245, 134); 
    } 
  }
  
}

