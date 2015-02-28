
// I've tried to put the more general stuff in this file so that the other .pde is more focused on
// setting up the desired specific instance of a spriograph, in the hope that the output can be
// more readily customised without the distraction of these bits.

class Slider
{
  RPath path;
  int currentSegment;
  float segmentLength;
  float segmentPosition;
  float segmentCount;

  void setPath(RPath p)
  {
    path = p;
    currentSegment = 0;
    segmentLength = path.commands[0].getCurveLength();
    segmentPosition = 0;
    segmentCount = path.commands.length;
  }
  
  void slide(float amount)
  {
    segmentPosition += amount;
    
    while (segmentPosition > segmentLength)
    {
      ++currentSegment;
      if (currentSegment >= segmentCount)
        currentSegment = 0;
      
      segmentPosition -= segmentLength;
      segmentLength = path.commands[currentSegment].getCurveLength();
    }

    while (segmentPosition < 0)
    {
      --currentSegment;
      if (currentSegment < 0)
       currentSegment += segmentCount;
      
      segmentLength = path.commands[currentSegment].getCurveLength();
      segmentPosition += segmentLength; 
    }
  }
  
  float withinSegment()
  {
    return map(segmentPosition, 0, segmentLength, 0, 1);
  }
  
  RPoint getPoint()
  {
    return path.commands[currentSegment].getPoint(withinSegment());
  }

  RPoint getTangent()
  {
    return path.commands[currentSegment].getTangent(withinSegment());
  }
};

void draw()
{
  image(myGraphics, 0, 0);

  myGraphics.beginDraw();
  
  sliderStatic.slide(slideAmount);
  sliderDynamic.slide(slideAmount);

  sliderStatic.path.draw(this);

  RPoint rp1, rp2, rp3, rp4;

  rp1 = sliderStatic.getPoint();
  rp2 = sliderStatic.getTangent();
  rp3 = sliderDynamic.getPoint();
  rp4 = sliderDynamic.getTangent();

  // Draw the pivot point
  ellipse(rp1.x, rp1.y, 10, 10);
  
  // Draw a tangent
//  line(rp1.x, rp1.y, rp1.x + rp2.x, rp1.y + rp2.y);

  translate(rp1.x, rp1.y);

  float angle = atan2(rp2.y, rp2.x) - atan2(rp4.y, rp4.x);
  rotate(angle);

  translate(-rp3.x, -rp3.y);

  sliderDynamic.path.draw(this);

  PGraphicsJava2D pg = (PGraphicsJava2D)g;
  Point2D ptOut = new Point2D.Float();
  
  pg.g2.getTransform().transform(new Point2D.Float(ptPenBase.x, ptPenBase.y), ptOut);

  myGraphics.stroke(150, 0, 150);
  
  PVector pt = new PVector((float)ptOut.getX(), (float)ptOut.getY());

  if (ptPrevious != null)
  {
    myGraphics.line(ptPrevious.x, ptPrevious.y, pt.x, pt.y);
  }

  ptPrevious = pt;
  
  myGraphics.endDraw();
}



