
/**
 * Koch Island drawing without recursion (click to restart)
 * by Ben Chun
 */


Snowflake s;

void setup()
{
  size(600,600);
  stroke(160);
  smooth();
  s = new Snowflake();
}

void draw()
{
  background(64);
  s.drawSelf();
  // go slow at first
  if (s.points.size() > 192) {
    s.alterNextSegment();
  }  
  else if(s.points.size() > 48)  {
    if (frameCount % 8 == 0) s.alterNextSegment();
  }  
  else if(s.points.size() > 12)  {
    if (frameCount % 16 == 0) s.alterNextSegment();
  }  
  else  {
    if (frameCount % 32 == 0) s.alterNextSegment();
  }
}

class Snowflake
{
  ArrayList points;
  int currentPoint;

  public Snowflake()
  {
    initialize();
  }

  void initialize()
  {
    points = new ArrayList();
    float sideLength = 3f*min(height,width)/4f;
    PVector top = new PVector(width/2f,  sideLength - (sqrt(3)/2*sideLength) );
    points.add(top);
    points.add(endPoint(top, sideLength, radians(120)));
    points.add(endPoint(top, sideLength, radians(60)));
    currentPoint = 0;
  }

  void drawSelf()
  {
    for(int i=0; i<points.size(); i++)
    {
      int next = 0;
      if (i<points.size()-1) next = i+1;
      PVector here = (PVector)points.get(i);
      PVector there = (PVector)points.get(next);
      line(here.x, here.y, there.x, there.y);
    }
  }

  void alterNextSegment()
  {
    int nextPoint = currentPoint+1;
    if (nextPoint>=points.size()) nextPoint = 0;
    PVector[] p = elaboratePoints((PVector)points.get(currentPoint), (PVector)points.get(nextPoint));
    points.add(nextPoint, p[2]);
    points.add(nextPoint, p[1]);
    points.add(nextPoint, p[0]);
    currentPoint += 4;
    if (currentPoint >= points.size()) currentPoint = 0;
  }

  // take the endpoints of a line and elaborate upon them by finding the two points that divide the line into thirds.
  // then find a third point such that it is the same distance from both new points as they are from the endpoints.
  // of the two possible solutions, pick the one that's outside the figure.
  // returns an array of the three new points.
  PVector[] elaboratePoints(PVector p1, PVector p2)
  {
    PVector[] newPoints = new PVector[3];
    PVector l = PVector.sub(p2, p1);
    float dis = l.mag();
    float d = dis/3f;
    float a = PVector.angleBetween(l, new PVector(width,0));
    if (l.y < 0) a = 2*PI - a; // fixup angles > 180
    newPoints[0] = endPoint(p1, d, a);
    newPoints[2] = endPoint(p2, d, a+PI);
    newPoints[1] = endPoint(newPoints[2], d, a+2*PI/3);  
    return newPoints; 
  }

  // takes a PVector start point, a length len, and an angle a.
  // returns the PVector representing a point len away from start at angle a
  PVector endPoint(PVector start, float len, float a)
  {
    float dx = len * cos(a);
    float dy = len * sin(a);
    PVector p = new PVector(start.x+dx, start.y+dy);
    return p;
  }

}

void mousePressed()
{
  s.initialize();
}








