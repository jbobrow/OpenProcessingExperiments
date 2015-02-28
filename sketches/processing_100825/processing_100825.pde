
Point[] p = new Point[4];

ArrayList b = new ArrayList();

void setup()
{
  size(400, 400);
  for (int i = 0; i < p.length; i++)
  {
    p[i] = new Point();
  }
  colorMode(HSB);
}

void draw()
{
  background(120);
  
/*
    makeDesign(
      # of lines+1
      point 1, point 2, point 3, point 4
      range of color of connecting lines (up to 255)
      starting color of connecting lines
            (HSB, 0 = red and up based on range)
      color of lines (HSB)
      color of points (HSB)
    )
*/
  makeDesign(10, 0, 1, 2, 3, 80, 80, 230, 160);
  //makeDesign(10, 0, 0, 2, 3, 80, 80, 230, 160);

  for ( int i = 0; i < p.length; i++)
  {
    p[i].move();
  }
  
  bounce();
}

void makeDesign
  (
    int amt,
    int p1, int p2, int p3, int p4,
    int colRan, int col,
    int linCol,
    int poiCol
  )
{
  for (int i = 0; i <= amt; i++)
  {
    float a1 = atan2(p[p1].ypos-p[p3].ypos, p[p1].xpos-p[p3].xpos)-PI;
    float d1 = dist(p[p1].xpos, p[p1].ypos, p[p3].xpos, p[p3].ypos)/amt;
    float a2 = atan2(p[p2].ypos-p[p4].ypos, p[p2].xpos-p[p4].xpos)-PI;
    float d2 = dist(p[p2].xpos, p[p2].ypos, p[p4].xpos, p[p4].ypos)/amt;

    strokeWeight(2);
    stroke(i*colRan/amt+col, 255, 255, 200);
    line(p[p1].xpos+cos(a1)*i*d1, p[p1].ypos+sin(a1)*i*d1, 
    p[p2].xpos+cos(a2)*i*d2, p[p2].ypos+sin(a2)*i*d2);

    strokeWeight(4);
    stroke(linCol, 150, 100, 200);
    line(p[p1].xpos, p[p1].ypos, p[p3].xpos, p[p3].ypos);
    line(p[p2].xpos, p[p2].ypos, p[p4].xpos, p[p4].ypos);
    
    strokeWeight(12);
    stroke(poiCol, 255, 60, 200);
    point(p[p1].xpos, p[p1].ypos);
    point(p[p2].xpos, p[p2].ypos);
    point(p[p3].xpos, p[p3].ypos);
    point(p[p4].xpos, p[p4].ypos);
  }
}

void bounce()
{
  for (int i = 0; i < b.size(); i++)
  {
    Bounce currB = (Bounce)b.get(i);
    if (currB.alive())
    {
      currB.make();
    }
    else 
    {
      b.remove(i);
    }  
  }
}

void newBounce(float _x, float _y)
{
  b.add(new Bounce(_x, _y));
}

class Bounce
{

  float xpos, ypos, siz, lifeTime;

  Bounce(float _x, float _y)
  {
    xpos = _x;
    ypos = _y;
    lifeTime = 255;
  }

  void make()
  {
    noFill();
    siz+=2;
    strokeWeight(siz/2);
    stroke(0, 127-siz);
    ellipse(xpos, ypos, siz*2, siz*2);
  }

  boolean alive()
  {
    if (lifeTime <= 0)
    {
      return false;
    }
    else
    {
      lifeTime--;
      return true;
    }
  }
}

class Point
{
  
  float xpos, ypos, xvel, yvel;
  Point()
  {
    xpos = random(50, width-50);
    ypos = random(50, height-50);
    xvel = random(-5, 5);
    yvel = random(-5, 5);
  }
  
  void move()
  {
    xpos+=xvel;
    ypos+=yvel;
    if (xpos>=width || xpos<=0)
    {
      xvel*=-1;
      newBounce(xpos, ypos);
    }
    if (ypos>=height || ypos<=0)
    {
      yvel*=-1;
      newBounce(xpos, ypos);
    }
  }
}


