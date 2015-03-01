
int aika;
PGraphics pg;

void setup() 
{
  size(800, 600, P2D);
  frameRate(60);
  background(0);
  colorMode(RGB);
  pg = createGraphics(800, 600, P2D);
  pg.colorMode(RGB);
  pg.background(0);
  
}

void draw() 
{ 
  
  background(pg);
  
  pg.beginDraw();
  
  pg.background(0);
  
  //pg.smooth();
  
  aika++;
    
    for (int x = 1; x < 60; x++)
    {
        
        for (int y = 1; y < 50; y++)
        {
            pg.stroke (cos(aika+y*2.5+x*2.5)*127+127,sin(aika+y*5)*127+127,sin(aika+x*5)*127+127);
            pg.line (x*10+sin(aika+y*5)*20,y*10+sin(aika+x*5)*20,x*10+sin(aika+y*5)*20+sin(aika+x*5)*10,y*10+sin(aika+x*5)*20+sin(aika+y*5)*10);
            
        
       
        }
    }
    
  pg.endDraw();

  image(pg,0,0); 
    
}
