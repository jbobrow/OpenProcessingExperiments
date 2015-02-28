
/**
 * DragonFeet by Ben Chun.
 *
 * An iterated function system for exploring something like the feetparts of a dragon.
 */


DragonFoot d;
float offsetX, offsetY, scaleFactor;

void setup()
{
  size(600,600);
  stroke(160);
  strokeWeight(0);
  smooth();
  d = new DragonFoot();
  scaleFactor = 1.0;
  frameRate(150); // faster is better
}

void draw()
{
  background(64);
  pushMatrix();
  scale(scaleFactor);
  translate(-offsetX, -offsetY);
  d.drawSelf();
  popMatrix();
  d.alterNextSegment();
}


class DragonFoot
{
  ArrayList points;
  int currentPoint;

  public DragonFoot()
  {
    points = new ArrayList();
    float sideLength = 3f*min(height,width)/7f;
    PVector top = new PVector(10+width/2f,  sideLength - (sqrt(3)/2*sideLength) + 140);
    points.add(top);
    points.add(endPoint(top, sideLength, radians(120)));
    points.add(endPoint(top, sideLength, radians(60)));
    currentPoint = 0;
  }

  void drawSelf()
  {
    for(int i=points.size()-1; i>0; i--)
    {
      int next = points.size();
      if (i>0) next = i-1;
      PVector here = (PVector)points.get(i);
      PVector there = (PVector)points.get(next);
      int recent = abs(i-currentPoint);
      if (recent<64) recent=64;
      if (recent>207) recent=207;
      stroke(recent);
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

  PVector[] elaboratePoints(PVector p1, PVector p2)
  {
    PVector[] newStuff = new PVector[3];
    PVector l = PVector.sub(p2, p1);
    float dis = l.mag();
    float d = dis/3f;
    float a = PVector.angleBetween(l, new PVector(width,0));
    if (l.y < 0) a = 2*PI - a; // fixup angles > 180
    newStuff[0] = endPoint(p1, d, a);
    newStuff[2] = endPoint(p2, d, a-PI/6);
    newStuff[1] = endPoint(newStuff[2], d, a+2*PI/3);  
    return newStuff; 
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
  // translation takes place inside the scaled world,
  // so account for that in adjusting the offsets
  offsetX += (mouseX - (width/2)) / scaleFactor;
  offsetY += (mouseY - (height/2)) / scaleFactor;
  if (offsetX < 0) offsetX = 0;
  if (offsetY < 0) offsetY = 0;
  if (offsetX > width-(width/scaleFactor)) offsetX = width-(width/scaleFactor);
  if (offsetY > height-(height/scaleFactor)) offsetY = height-(height/scaleFactor);

  if (keyPressed && keyCode==ALT) scaleFactor -= 0.1;
  else scaleFactor += 0.1;
  if (scaleFactor < 1.0) scaleFactor = 1.0;
}







