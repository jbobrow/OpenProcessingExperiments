
/**
 * @author Alex Kindel
 * @date Dec 31, 2014
 */

/**
 * Finds the intersections of two circles, if they exist.
 *
 * Given two circle equations:
 *   Cirlce 1: r1^2 = (x - x1)^2 + (y - y1)^2
 *   Circle 2: r2^2 = (x - x2)^2 + (y - y2)^2
 *
 * Returns coordinates (2 sets of 2 doubles) or else returns null if intersections do not exist.
 *
 * Rarely this function may return null if the circles are tangental or very close to tangental.
 */
public double[] circleCircleIntersects(double x1, double y1, double x2, double y2, double r1, double r2)
{
  // Use change of coordinates to get:
  //   Cirlce 1: r1^2 = x^2 + y^2
  //   Circle 2: r2^2 = (x - a)^2 + (y - b)^2
  double a = x2 - x1;
  double b = y2 - y1;
  
  // Find distance between circles.
  double ds = a*a + b*b;
  double d = Math.sqrt( ds );
  
  // Ensure that the combined radii lengths are longer than the distance between the circles,
  // i.e. tha the circles are close enough to intersect.
  if (r1 + r2 <= d)
    return null;
  
  // Ensure that one circle is not inside the other.
  if (d <= Math.abs( r1 - r2 ))
    return null;
  
  // Find the intersections (formula derivations not shown here).
  double t = Math.sqrt( (d + r1 + r2) * (d + r1 - r2) * (d - r1 + r2) * (-d + r1 + r2) );

  double sx1 = 0.5 * (a + (a*(r1*r1 - r2*r2) + b*t)/ds);
  double sx2 = 0.5 * (a + (a*(r1*r1 - r2*r2) - b*t)/ds);
  
  double sy1 = 0.5 * (b + (b*(r1*r1 - r2*r2) - a*t)/ds);
  double sy2 = 0.5 * (b + (b*(r1*r1 - r2*r2) + a*t)/ds);
  
  // Translate to get the intersections in the original reference frame.
  sx1 += x1;
  sy1 += y1;
  
  sx2 += x1;
  sy2 += y1;
  
  double[] r = new double[4];
  r[0] = sx1;
  r[1] = sy1;
  r[2] = sx2;
  r[3] = sy2;
  
  return r;
}

public void setup()
{
  size(700, 500);
}

float x1 = 400, y1 = 700;  // Position of first circle.

public void draw()
{
  float x2 = mouseX;
  float y2 = mouseY;
  
  float r1 = 350;
  float r2 = 200;
  
  if (mousePressed) {
    x1 = mouseX;
    y1 = mouseY;
  }
  
  pushMatrix();
  
    ellipseMode(RADIUS);
    
    background( #FFFFFF );
    noFill();
    stroke( #8888FF );
    strokeWeight( 3.f );
    ellipse( x1, y1, r1, r1 );
    ellipse( x2, y2, r2, r2 );
    
    double[] sd = circleCircleIntersects( x1, y1, x2, y2, r1, r2 );
    
    if (sd != null) {
      float[] s = new float[4];
      
      for (int i = 0; i < 4; i++)
        s[i] = (float)sd[i];
      
      fill( #FF0000 );
      noStroke();
      ellipse( s[0], s[1], 8, 8 );
      ellipse( s[2], s[3], 8, 8 );
    }
  
  popMatrix();
}

