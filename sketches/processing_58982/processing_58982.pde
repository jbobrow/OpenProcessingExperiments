
float easeIn = 0.9;
 
class Sina
{
  float x;
  float y;
   
  float xPos;
  float yPos;
   
  color col;
  int rad;
   
  Sina(float X, float Y, int redValue) //Constructor
  {
    x = X;
    y = Y;
     
    xPos = x;
    yPos = y;
     
    col = color(redValue,0,0);
    rad = int(random(5,20));
  }
   
  void moveAndDraw(int side, boolean dir)
  {
//    reset(side);
    xPos = xPos*easeIn+x*(1-easeIn);
    yPos = yPos*easeIn+y*(1-easeIn);
     
    stroke(col);
    strokeWeight(rad);
    point(xPos,yPos);
    
    if(dir)
    {
      stroke(0);
      strokeWeight(1);
      line(xPos, yPos, x, y);
    }
     
    return;
  }
   
  void SetPosition(float X, float Y)
  {
    x = X;
    y = Y;
     
    return;
  }
   
  float GetX()
  {
     return x;   
  }
   
  float GetY()
  {
    return y;
  }
   
  void reset(int side)
  {
    if((x < 0 || x > side) || (y < 0 || y > side))
    {
      x = random(0,side);
      y = random(0,side);
    }
  }
   
  void disturb(int range, int side)
  {
    int direction;
    if(x < 0)          direction = 1;
    else if(x > side)  direction = -1;
    else               direction = int(random(-2,2));   
    x += direction*random(0,range);
         
    if(y < 0)          direction = 1;
    else if(y > side)  direction = -1;
    else               direction = int(random(-2,2));   
    y += direction*random(0,range);    
  }
   
  boolean anlamsizlik()
  {
    boolean toCastleWolfenstein = true;
    return toCastleWolfenstein;
  }
}


