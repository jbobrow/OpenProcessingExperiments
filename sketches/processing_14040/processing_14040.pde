
/* Alone In A Crowd
 * Ben Chun
 * 18 October 2010
 */

Loner[] dudeList;

void setup()
{
  size(600,600);
  noStroke();
  rectMode(CENTER);
  dudeList = new Loner[400];
  for(int i=0; i<dudeList.length; i++)
  {
    dudeList[i] = new Loner();
  }
}

void draw()
{
  background(208);
  for(Loner d : dudeList)
  {
    d.showYourself();
    d.getComfortable( dudeList );
    d.stayOnScreen();
  }
}

class Loner
{
  float x, y, s;
  color c;
  
  Loner()
  {
    x = random(width);
    y = random(height);
    s = random(12,15);
    c = color(random(92),80);
  }
  
  void getComfortable(Loner[] others)
  {
    for(Loner o : others)
    {
      if( o != this )
      {
        if( dist( x,y, o.x,o.y ) < s*1.5 ) moveRandomly();
        if( dist( x,y, mouseX,mouseY ) < s*3 ) moveRandomly();
      }
    }
  }
  
  void moveRandomly()
  {
     x += random( -s/2, s/2 );
     y += random( -s/2, s/2 );
  }
  
  void showYourself()
  {
    fill( c );
    rect( x,y, s,s );
  }
  
  void stayOnScreen()
  {
    if( x > width ) x = x-width;
    if( y > height ) y = y-height;
    if( x < 0 ) x = x+width;
    if( y < 0 ) y = y+height;
  }
}

