
//dot objects for the 2 by 2 graph

class Dot{
  
  float x;
  float y;
  float diam;
  color col;

  float frame;
  float a; //alpha
  float aFloor; //lowest alpha for fade function
  float increment; //amount alpha fades with each draw
  
  
  Dot(float xtemp, float ytemp, float diamtemp, color ctemp ){
    x = xtemp;
    y = ytemp;
    diam = diamtemp;
    a = 255; 
    aFloor = 45;
    increment = .5;
    col = ctemp;
    frame = frameCount;
  }
  
  void display()
  {
    fill(col, a);
    ellipse (x, y, diam, diam);
  }
  
  void fade()
  {
    a -= increment;
    if (a < aFloor)
    { a = aFloor;}    
  }
  
  void comeBackFade()
  { if (a == 0)
      {a = 255;}
    else  
    {fade();}
  }
    
  void comeBack()
  { a = 255;}
    
  void goAway() 
   { a = 0;}
  
  
 
  
}

