

class Circle
{
  PVector pvCentre;
  float radius;

  Circle(float x, float y, float r)
  {
    pvCentre = new PVector(x,y);
    radius = r;
  }

  void draw()
  {
    ellipse(pvCentre.x, pvCentre.y, radius, radius);
  }
  
  Circle get()
  {
    return new Circle(pvCentre.x, pvCentre.y, radius);
  }
  
  void setCentre(float x, float y)
  {
    pvCentre.x = x;
    pvCentre.y = y;
  }
  
};

PVector[] intersect(Circle c1, Circle c2)
{
  CircleIntersector circleIntersector = new CircleIntersector(c1, c2);
  
  float heading = circleIntersector.getHeading();
  PVector2D pv1 = (PVector2D)veryLazyHillClimber(new PVector2D(heading, heading + HALF_PI, 0.02, 0.02), circleIntersector);
  PVector2D pv2 = (PVector2D)veryLazyHillClimber(new PVector2D(heading, heading - HALF_PI, 0.02, 0.02), circleIntersector);
  
  float fitness = circleIntersector.evaluate(pv1);
  
//  println(fitness);
  
  if (fitness <= 16)
  {
    PVector[] arr = new PVector[2];
    arr[0] = circleIntersector.toCartesian1(pv1);
    arr[1] = circleIntersector.toCartesian1(pv2);
    return arr;
  }
  else
  {
    return new PVector[0];
  }
}

class CircleIntersector implements FitnessEvaluator<PVector2D>
{
  CircleIntersector(Circle c1, Circle c2)
  {
    circle1 = c1.get();
    circle2 = c2.get();
  }
  
  float evaluate(PVector2D pvParam)
  {
    PVector pv1 = toCartesian1(pvParam);
    PVector pv2 = toCartesian2(pvParam);
    
    pv2.sub(pv1);
    
    float m = pv2.mag();
    return m*m;
  }

  PVector toCartesian1(PVector pvTarget)
  {
    PVector pv1 = new PVector(circle1.radius * cos(pvTarget.x), circle1.radius * sin(pvTarget.x));
    pv1.add(circle1.pvCentre);
    return pv1;
  }

  PVector toCartesian2(PVector pvTarget)
  {
    PVector pv2 = new PVector(circle2.radius * cos(pvTarget.y), circle2.radius * sin(pvTarget.y));
    pv2.add(circle2.pvCentre);
    return pv2;
  }

  float getHeading()
  {
    PVector pv = PVector.sub(circle1.pvCentre, circle2.pvCentre);
    return atan2(pv.y, pv.x);
  }

  Circle circle1;
  Circle circle2;
};



