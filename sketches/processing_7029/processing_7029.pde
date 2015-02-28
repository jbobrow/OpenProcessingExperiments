
/*
 * Draw arrow heads at the ends of a line. 
 */
void setup( )
{
  float theta;
  
  size(200, 200);
  background(255);
  smooth();
  // horizontal line; narrower arrow at left
  arrowLine(10, 100, 90, 100, radians(30), radians(45), false);
  
  // vertical line with solid arrows; narrower arrow at top
  arrowLine(100, 10, 100, 150, radians(30), radians(60), true);
  
  // test line with arrow at start only
  // should appear to point up and left
  stroke(255, 0, 0);
  arrowLine(30, 40, 80, 80, radians(30), 0, false);
  
  // test line with arrow at end only
  // should appear to point down and left
  stroke(0, 128, 0);
  arrowLine(170, 20, 140, 60, 0, 45, true);
  
  // you can call the arrowhead method to 
  // add arrows to arcs
  stroke(0, 0, 128);
  theta = radians(45);
  arc(150, 100, 50, 50, theta, theta + HALF_PI);
  arrowhead(150 + 25 * cos(theta),
    100 + 25 * sin(theta), theta + HALF_PI, radians(30), false);
}

/*
 * Draws a lines with arrows of the given angles at the ends.
 * x0 - starting x-coordinate of line
 * y0 - starting y-coordinate of line
 * x1 - ending x-coordinate of line
 * y1 - ending y-coordinate of line
 * startAngle - angle of arrow at start of line (in radians)
 * endAngle - angle of arrow at end of line (in radians)
 * solid - true for a solid arrow; false for an "open" arrow
 */
void arrowLine(float x0, float y0, float x1, float y1,
  float startAngle, float endAngle, boolean solid)
{
  line(x0, y0, x1, y1);
  if (startAngle != 0)
  {
    arrowhead(x0, y0, atan2(y1 - y0, x1 - x0), startAngle, solid);
  }
  if (endAngle != 0)
  {
    arrowhead(x1, y1, atan2(y0 - y1, x0 - x1), endAngle, solid);
  }
}

/*
 * Draws an arrow head at given location
 * x0 - arrow vertex x-coordinate
 * y0 - arrow vertex y-coordinate
 * lineAngle - angle of line leading to vertex (radians)
 * arrowAngle - angle between arrow and line (radians)
 * solid - true for a solid arrow, false for an "open" arrow
 */
void arrowhead(float x0, float y0, float lineAngle,
  float arrowAngle, boolean solid)
{
  float phi;
  float x2;
  float y2;
  float x3;
  float y3;
  final float SIZE = 8;
  
  x2 = x0 + SIZE * cos(lineAngle + arrowAngle);
  y2 = y0 + SIZE * sin(lineAngle + arrowAngle);
  x3 = x0 + SIZE * cos(lineAngle - arrowAngle);
  y3 = y0 + SIZE * sin(lineAngle - arrowAngle);
  if (solid)
  {
    triangle(x0, y0, x2, y2, x3, y3);
  }
  else
  {
    line(x0, y0, x2, y2);
    line(x0, y0, x3, y3);
  }  
}


