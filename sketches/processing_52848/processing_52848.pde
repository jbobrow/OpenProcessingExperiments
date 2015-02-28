
class unit
{
  float xpos;
  float ypos;
  float dx;
  float dy;
  float uSize;
  int col;
  
  unit(float _xpos, float _ypos, float _uSize, float _dx, float _dy)
  {
    col = 180;
    xpos = _xpos;
    ypos = _ypos;
    uSize = _uSize;
    dx = _dx;
    dy = _dy;
  }
  
  void update()
  {
    //Move, check bounds collision
    if(xpos > width - uSize || xpos < 0 + uSize)
      dx = -dx;
    xpos += dx;
    if(ypos > height - uSize || ypos < 0 + uSize)
      dy = -dy;
    ypos += dy;
    
    
    //draw
    ellipseMode(RADIUS);
    fill(col);
    ellipse(xpos, ypos, uSize, uSize);
    col = 180;
    
  }
  
  boolean isBumped(unit _unit)
  {
    if((sqrt(sq(xpos - _unit.xpos) + sq(ypos - _unit.ypos))) < uSize*2+1)
      return true;
    else
      return false;
  }
}

//================================================================
int uNum = 50;
unit[] units = new unit[uNum];

void setup()
{
  size(600, 600);
  background(30);
  noStroke();
  smooth();
  
  
  //Unit array initializtion
  for(int i=0; i<uNum;++i)
  {
    units[i] = new unit(random(width-10), random(height-10), random(13,24), random(-0.8, 0.8), random(-1.4, 1.4));
    for(int j=0;j<i;++j)
    {
      if(units[i].isBumped(units[j]))
        units[i].xpos += units[i].uSize*5;
    }
  }
}

void draw()
{
  background(30);
  
  
  for(int i=0;i<uNum-1;++i)
  {
    for(int j=i+1;j<uNum;++j)
    {
      if(units[i].isBumped(units[j]))
      {
        units[i].col = 255;
        
      
      float tmpdx = units[i].dx;
      float tmpdy = units[i].dy;
      units[i].dx = units[j].dx;
      units[j].dx = tmpdx;
      units[i].dy = units[j].dy;
      units[j].dy = tmpdy;
      units[i].uSize += random(-0.2, 0.2);
      units[j].uSize += random(-0.2, 0.2);
      
      /*if(units[i].xpos > units[j].xpos)
        units[i].xpos += 2;
      else 
        units[i].xpos -= 2;
      if(units[i].ypos > units[j].ypos)
        units[i].ypos += 2;
      else 
        units[i].ypos -= 2;
        */
          
      
      }
    }
  }
  
  
  for(int i=0; i<uNum;++i)
  {
    units[i].update();
  }
}




















