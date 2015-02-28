
CIRCLE myCircle = new CIRCLE();

int MAXSIZE = 300, MINSIZE = 100;
boolean makeFlag = false;

void setup()
{
  size(450,450);
  noStroke();
  background(255);  
}

void draw()
{
  int x,y,r,g,b;
  
  if(makeFlag == true)
  {
    myCircle.drawCircle();
  }
  
  if(mousePressed == true)
  {
    if(makeFlag == false)
    {
      myCircle.newCircle(mouseX,mouseY);
      makeFlag = true;
    }
  }
  else
  {
    makeFlag = false;
  }
}

class CIRCLE
{
  int x, y, r, g, b;
  int maxHigh, maxWid, high, wid;
  int step = 20, opp = 10;
  float ratio = 1.5;
  
  void CIRCLE()
  {
    x = 0; y = 0; r = 0; g = 0; b = 0;
    maxHigh = 0; maxWid = 0; high = 0; wid = 0;    
  }
  
  void newCircle(int cx, int cy)
  {
    r = (int)random(255);
    g = (int)random(255);
    b = (int)random(255);
    maxHigh = (int)random(MAXSIZE-MINSIZE) + MINSIZE;
    maxWid = (int)(maxHigh * ratio);

    x = cx;
    y = cy;
    high = 0;
    wid = 0;    
  }
  
  void drawCircle()
  {
    if( wid < maxWid && high < maxHigh )
    {
      fill( r, g, b, opp );
      ellipse( x, y, wid, high );
    
      wid += maxWid / step;
      high += maxHigh / step;
    
//      delay(10);
    }
  }
}
