
import seltar.motion.*;
class AI
{
  Motion m;
  float X,Y;
  AI(float X, float Y, float x1, float y1)
  {
    m = new Motion(X,Y);
    x1 = m.getX();
    y1 = m.getY();
  }
  
  void move()
  {
    m.followTo(s[0].x,s[0].y);
    m.wrap(0,0,width,height);
    m.move();  
  }
  
  void display()
  {
    move();
    stroke(255,0,0);
    noFill();
    strokeWeight(10);
    ellipse(m.getX(),m.getY(),50,50);
    strokeWeight(1);
  }
}
  
  

