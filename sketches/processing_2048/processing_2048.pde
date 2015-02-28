
import java.util.*;

ArrayList thingies = new ArrayList();
int width = 600;
int height = 500;

void setup()
{
  size(width, height);
  colorMode(RGB);
  frameRate(35);
}

public class Thingy
{
  int col;
  float x;
  float y;
  float big;
  float big2;
  
  float xspeed;
  float yspeed;
  float mag = 1;
  boolean moving = true;
  boolean explodeTime = false;
  
  public Thingy ( float x, float y, float big, int col, float big2)
  {
    this.col = col;
    this.big = big;
    this.big2 = big2;
    this.x = x;
    this.y = y;
    float dir = random( 0,(float)Math.PI*2);
    float magnitude = random(0, mag);
    xspeed = cos(0);
    yspeed = sin(0);
  }
  


public void updateframe()
{
 
  x+= xspeed;
  stroke(249, 247, 249);
  fill(243, 240, 242);
  ellipse(x, y, big, big2);
  
  
  
  if(y > height)
  {
      moving = false;
    }
    
    
   
  }
}

int time = 0;
void draw()
{
  time++;
  if( time % 20 == 0)
  {
    float x = 0;
    float y = random(50, 120);
    float big = random( 20, 50);
    float big2 = random( big+=15, big-= 15);
    int col = (int)(Math.random()*100);
    
      thingies.add( new Thingy(x, y, big, col, big));
  }
  
   if( time % 60 == 0)
  {
    float x = 0;
    float y = random(100, 120);
    int big = (int)(Math.random()*200);
    float big2 = random(big+= 10, big-= 30);
    int col = (int)(Math.random()*100);
    
      thingies.add( new Thingy(x, y, big, col, big));
  }
  
   if( time % 40 == 0)
  {
    float x = 0;
    float y = random(50, width/3);
    int big = (int)(Math.random()*200);
    float big2 = random(big+= 10, big-=10);
    int col = (int)(Math.random()*100);
    
      thingies.add( new Thingy(x, y, big, col, big2));
  }
  
  
  
  background( 155, 236, 250 );
  for (int i = 0; i < thingies.size(); i++)
  {
    Thingy th = (Thingy)thingies.get(i);
    th.updateframe();
  }
    
    for (int i = 0; i < thingies.size(); i++)
    {
        Thingy th = (Thingy)thingies.get(i);
        if( !th.moving)
          {
              thingies.remove( th );
            }
  }
  

  
}



