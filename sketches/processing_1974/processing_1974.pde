
import java.util.*;

ArrayList squares = new ArrayList();
int wideness = 600;
int tallness = 1000;

void setup()
{
    size( wideness, tallness );
    colorMode(HSB, 100);
    frameRate(35);
}

public class Square
{
  int farbe;
  float x;
  float y;
  
  float xspeed;
  float yspeed;
  float magthewhat = 2;
  boolean moving = true;
  boolean explodeTime = false;
  
  public Square ( float x, float y, int farbe)
  {
      this.farbe = farbe;
      this.x = x;
      this.y = y;
      float richtung = random(0, (float)Math.PI*2);
      float magthwht = random(0, magthewhat);
      xspeed = cos(0);
      yspeed = sin(0);
  }     
  
  
  
  public void updateinfo()
  {
    yspeed += .08;
    y+= yspeed;
    stroke(farbe, 200, 100);
    ellipse(x, y, 3, 3);
    
    if(y == tallness/2)
    {
      explodeTime = false;
    }
   
    if (y > tallness)
    {
      moving = false;
    }
  }
}
  

int time = 0;
void draw()
{
  time++;
  if( time % 1 == 0)
  {
    float x = random(0, wideness);
    float y = 0;
    int farbe = (int)(Math.random()*100);
    
      squares.add(new Square(x, y, farbe));
  }
  
  
  
  
  background( 0 );
  for (int i =0; i< squares.size(); i++)
  {
    Square s = (Square)squares.get(i);
    s.updateinfo();
  }
  
  for (int i = 0; i< squares.size(); i++)
  {
    Square s = (Square)squares.get(i);
    if( !s.moving )
      {
        squares.remove( s );
      }
   
}
}


