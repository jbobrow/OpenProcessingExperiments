
float easeIn = 0.9;
  
class Bug
{
  float x;
  float y;
    
  float xPos;
  float yPos;
    
  color col;
  int rad;
    
  Bug(float X, float Y, int redValue) //Constructor
  {
    x = X;
    y = Y;
      
    xPos = x;
    yPos = y;
      
    col = color(redValue,0,0);
    rad = int(random(5,20));
  }
    
  void moveAndDraw(PImage p)
  {
    xPos = xPos*easeIn+x*(1-easeIn);
    yPos = yPos*easeIn+y*(1-easeIn);
    
    image(p, xPos, yPos);

    return;
  }
    
  void call(int range, int mx,int my)
  {
    if(x < mx)
        x+= random(0,range);

    else if(x > mx)
        x-=random(0,range);
      
    if(y < my)  
        y += random(0,range);
        
    else if(y > my)
        y -= random(0,range);
  }
}


