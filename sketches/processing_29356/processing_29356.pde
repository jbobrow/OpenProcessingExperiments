
class Circle {
  public PVector centre = new PVector();
  public float r;

  public Circle() {
  }

  public Circle(PVector _c, float _r)
  {
    centre = _c;
    r = _r;
  }

  public Circle(int _x, int _y, float _r)
  {
    centre.x = (float)_x;
    centre.y = (float)_y;
    r = _r;
  }

  public Circle(float _x, float _y, float _r) {
    centre.x = _x;
    centre.y = _y;
    r = _r;
  }

  public void draw()
  {
    ellipseMode(RADIUS);
    ellipse(centre.x, centre.y, r, r);
  }

  PVector[] circleIntersect(Circle c2)
  {
    // Calculate distance between centres of circle
    float d = PVector.dist(c2.centre, centre);

    float m = r + c2.r;
    float n = r - c2.r;

    if (n < 0)
      n = n * -1;

    //No solns
    if ( d > m )
      return null;

    //Circle are contained within each other
    if ( d < n )
      return null;

    //Circles are the same
    if ( d == 0 && r == c2.r )
      return null;

    //Solve for a
    float a = ( r * r - c2.r * c2.r + d * d ) / (2 * d);

    //Solve for h
    float h = sqrt( r * r - a * a );

    //Calculate point p, where the line through the circle intersection points crosses the line between the circle centers.
    PVector p = new PVector ( centre.x + ( a / d ) * ( c2.centre.x -centre.x ), centre.y + ( a / d ) * ( c2.centre.y -centre.y ) );

    //1 solution, circles are touching
    if ( d == r + c2.r ) {
      return new PVector[] {
        p, p
      };
    }

    return new PVector[] {
      new PVector ( p.x + ( h / d ) * ( c2.centre.y - centre.y ), p.y - ( h / d ) * ( c2.centre.x - centre.x ) ), 
      new PVector ( p.x - ( h / d ) * ( c2.centre.y - centre.y ), p.y + ( h / d ) * ( c2.centre.x - centre.x ) )
      };
    }

    PVector[] lineIntersect(PVLine ln) {

      float dx = ln.p2.x - ln.p1.x;
      float dy = ln.p2.y - ln.p1.y;
      float a = dx * dx + dy * dy;
      float b = 2 * (dx * (ln.p1.x - centre.x) + dy * (ln.p1.y - centre.y));
      float c = centre.x * centre.x + centre.y * centre.y;
      c += ln.p1.x * ln.p1.x + ln.p1.y * ln.p1.y;
      c -= 2 * (centre.x * ln.p1.x + centre.y * ln.p1.y);
      c -= r * r;
      float bb4ac = b * b - 4 * a * c;

      if (bb4ac < 0) // no intersection
      {
        return null;
      }
      else
      {
        float mu = (-b + sqrt( b*b - 4*a*c )) / (2*a);
        float ix1 = ln.p1.x + mu*(dx);
        float iy1 = ln.p1.y + mu*(dy);
        mu = (-b - sqrt(b*b - 4*a*c )) / (2*a);
        float ix2 = ln.p1.x + mu*(dx);
        float iy2 = ln.p1.y + mu*(dy);

        PVector ip1 = new PVector(ix1, iy1);
        PVector ip2 = new PVector(ix2, iy2);

        // Figure out which point is closer to the circle
        PVector test;
        test = (PVector.dist(ln.p1, centre) < PVector.dist(ln.p2, centre)) ?  ln.p2 : ln.p1;

        if (PVector.dist(test, ip1) < PVector.dist(ln.p1, ln.p2) || PVector.dist(test, ip2) < PVector.dist(ln.p1, ln.p2))
        return new PVector[] {
          ip1, ip2
        };
        else
          return null;
      }
    }
}


