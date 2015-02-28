
/* By Marvin Yan
 * Left-click to see fast bubbles
 * Right-click to see slow, big bubbles
 *Press middle mouse button to clear*/
float x, y;
float s,l,a;
void setup ()

{
  size (500, 400);
  smooth();
  noStroke();
  //noFill();
  //strokeWeight(20);
}

void draw ()
{
  background (#3CDCF0);
  if (mouseButton == LEFT)
  {
    s = random (70, 100);
    l = random (10,50);
    //y=height-10;
    //background (#3CDCF0);
    fill (0, 0, 0, 100);
    for (float i =0; i < 350;i += 75)
    { 
      for ( float n=0; n < 350; n += 50)
      { 
        fill (#F2F2F2, 80);
        //delay(4);
        //noFill();
        ellipse (x, y, s, s);
        ellipse (x+random (50, 200), y+random (50,100), l, l);
        //y=height-10;
        y = (random (-100, 420));
        //y = y -300;
        x= (random (5, 450));
        delay(3);
      }
    }
  }
  if (mouseButton == RIGHT)
  {
    a = random (125, 150);
    fill (0, 0, 0, 100);
    for (float i =0; i < 150;i += 75)
    { 
      for ( float n=0; n < 400; n += 50)
      { 
        fill (#F2F2F2, 80);
        //delay(4);
        ellipse (x, y, a, a);
        //y=height-10;
        y = (random (-100, 420));
        //y = y -300;
        x= (random (5, 450));
        delay (100);
      }
    }
  }
}
 

