
int rows = 30;
int cols = 30;
int triW = 100;
int triH = 84;

Tri[] tris;

void setup()
{
  size(792,492);
  noStroke();
  tris = new Tri[rows * cols];
  
  for (int i=0; i < cols; i++) {
    for (int j=0; j < rows; j++) {
      Tri t = new Tri(i-1,j,randomColor(), randomColor());
      tris[j+i*cols] = t;
      t.CollapseLeft();
      
    }  
  }  
}

void draw()
{
  for (Tri t : tris)
  {
    t.Draw();
  }
}

color randomColor()
{
  return color(int(random(0,255)),int(random(0,255)),int(random(0,255))); 
}
class Tri {
  public int x;
  public int y;
  public color c;
  public color bgc;
  
  float topRightMod = 1;
  float topLeftMod = 1;
  boolean collapsingLeft = false;
  boolean collapsingRight = false;
  
  
  public Tri (int _x, int _y, color _c, color _bgc)
  {
    x = _x;
    y = _y;
    c = _c;
    bgc = _bgc;
  }
  
  public void Draw()
  {
        
    int sY = y * triH /2;
    int sX;
    
    // Offset each row pair
    if(y % 4 < 2)
    {
      sX = x *triW;
    }
    else
    {
      sX = x *triW + triW/2;      
    }
 
    // even/uneven
    fill(bgc);
    if(y % 2 == 0)
    {
      triangle(sX,sY,sX + triW, sY, sX+triW/2,sY + triH);
      
      fill(c);
      float x1 = sX + (1- topLeftMod) * triW ;
      float y1 = sY;
      float x2 = sX + triW * topRightMod;
      float y2 = sY;
      float x3 = sX + triW/2;
      float y3 = sY + triH;
      triangle(x1,y1,x2,y2,x3,y3);
      
    }
    else
    {
      triangle(sX-triW/2,sY + triH/2,sX + triW/2, sY + triH/2, sX,sY - triH  + triH/2);
      
      fill(c);
      float x1 = sX-triW/2  + (1- topLeftMod) * triW ;
      float y1 = sY + triH/2;
      float x2 = sX + triW/2 - (1- topRightMod) * triW;
      float y2 = sY + triH/2;
      float x3 = sX;
      float y3 = sY - triH  + triH/2;
      triangle(x1,y1,x2,y2,x3,y3);      
    }
    
    // Collapsing modifiers
    if(collapsingLeft && topLeftMod > 0) topLeftMod -=0.001;
    if(collapsingRight && topRightMod > 0) topRightMod -=0.001;
    
    if(topLeftMod<=0)
    {
      c = bgc;
      bgc = randomColor();
      topLeftMod = 1;
    }
    if(topRightMod<=0)
    {
      c = bgc;
      bgc = randomColor();
      topRightMod = 1;
    }    
  }
  
  public void CollapseLeft()
  {
     collapsingLeft = true; 
  }
}
