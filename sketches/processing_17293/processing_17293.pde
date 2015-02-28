
class Hotel
{
  int orgx = 0;
  int orgy = 0;
  int shift = 30; 
  int posx = 0;
  int posy = 0;
  int radius = 10;
  int curhour = 0;
  int prevhour = 0;
  int[] hactive = {
    10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10
  };

  Hotel(int x, int y)
  {
    orgx = x;
    orgy = y;
  }

  void display()
  {
    //7 days a week
    int s2 = millis() / 1000;
    int m2 = s2 / 60;
    int h2 = m2/ 60;
    s2 -= m2 * 60;
    m2 -= h2 * 60;
    if(m2 <= 7)
    {
      //weekday&weekday
      int s3 = millis() / 1000;
      int m3 = s3 / 60;
      s3 -= m3 * 60;
      float h3 = s3/2.5;
      curhour = int(h3);
      if(int(h3) <= 24)
      {
        //radius = hactive[int(h3)];
        //25% of an event happening from 9am-9pm
        if( int(h3) > 9 && int(h3) < 21) 
        {
          int test = int(random(0,4));
          //println("r1:" + test);
          if( test == 1)
          {
            radius = 20;
            //expansion
            if(orgx<450 && orgy<450)
            {
              posx = orgx - shift;
              posy = orgy - shift;
            }  
            if(orgx==450 && orgy<=450)
            {
              posx = orgx;
              posy = orgy - shift;
            } 
            if(orgx==450 && orgy>=450)
            {
              posx = orgx;
              posy = orgy + shift;
            } 
            if(orgx>450 && orgy<450)
            {
              posx = orgx + shift;
              posy = orgy - shift;
            } 
            if(orgx<=450 && orgy==450)
            {
              posx = orgx - shift;
              posy = orgy;
            } 
            if(orgx>=450 && orgy==450)
            {
              posx = orgx + shift;
              posy = orgy;
            } 
            if(orgx>450 && orgy>450)
            {
              posx = orgx + shift;
              posy = orgy + shift;
            } 
            if(orgx<450 && orgy>450)
            {
              posx = orgx - shift;
              posy = orgy + shift;
            }
          }
          else
          {
            radius = 10;
            posx = orgx;
            posy = orgy;
          }
        }
        else
        {
          radius = 10;
          posx = orgx;
          posy = orgy;
        }          
        fill(#0C52E5);
        noStroke();
        rectMode(RADIUS);
        rect(posx, posy, radius, radius);
      }
    }
  } 
  int getRadius()
  {
    return radius;
  }
  int getX()
  {
    return posx;
  }
  int getY()
  {
    return posy;
  }
}


