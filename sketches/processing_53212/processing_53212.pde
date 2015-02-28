
// Constants affecting output
int maxPoints = 30;
int drawsBetweenNewPoints = 5; // after 5 redraws, a new point is added and,
// if maxPoints has been reached, one is deleted.
float pointSize = 7;
color pointColor = color(255, 0, 0);
color lineColor = color(0);

ArrayList<PVector> pointList = new ArrayList<PVector>();
int drawCount=0;

void setup()
{
  size(600, 600);
}

void draw()
{
  background(200);
  drawCount++;
  if (drawCount == drawsBetweenNewPoints)
  {
    if (pointList.size()<maxPoints)
      pointList.add(new PVector(random(width), random(height)));
    else
    {
      pointList.add(new PVector(random(width), random(height)));
      pointList.remove(0);
    }
    drawCount = 0;
  }

  stroke(lineColor);
  for (int i = 0; i < pointList.size(); i++)
  {
    for (int j = 0; j < pointList.size(); j++)
    {
      PVector p1 = pointList.get(i);
      PVector p2 = pointList.get(j);
      line(p1.x, p1.y, p2.x, p2.y);
    }
  }

  for (int i = 0; i < pointList.size(); i++)
  {
    PVector p = pointList.get(i);
    fill(pointColor);
    noStroke();
    ellipse(p.x, p.y, pointSize, pointSize);
  }
}
                                
