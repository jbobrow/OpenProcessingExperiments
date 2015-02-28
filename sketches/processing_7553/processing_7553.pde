
/**
 * spxlEllipseBoundary
 * 2010-02-10 by subpixel
 * http://subpixels.com
 *
 * Determine intersection of line through ellipse centre
 * and arbitrary point with ellipse boundary.
 *
 * Determine whether an arbitrary point is inside or outside
 * the ellipse, or on the ellipse boundary.
 *
 * Click and drag to relocate and resize the ellipse.
 */

boolean drawBox = false;

// Ellipse centre
float Xc;
float Yc;

// Ellipse radii (a along x-axis, b along y-axis)
float a = 280;
float b = 90;

void setup()
{
  size(600, 400, P2D);
  Xc = width / 2;
  Yc = height / 2;
  
  ellipseMode(RADIUS);
  rectMode(CORNERS);

  textFont(createFont("", 20));
}

void draw()
{
  background(0);

  // Turn mouse coordinates into ellipse-centre coordinates
  float x = mouseX - Xc;
  float y = mouseY - Yc;
  
  translate(Xc, Yc); // Centre drawing at centre of ellipse
  
  // Inside or outside?
  
  float x_a = x / a;
  float y_b = y / b;
  float inout = x_a * x_a + y_b * y_b - 1;
  
  boolean onBoundary = (abs(inout) < 0.02); // Allow tolerance
  boolean inside = !onBoundary && (inout < 0);

  // Draw the bounding box (while resizing)
  if (drawBox)
  {
    stroke(255, 0, 0);
    strokeWeight(1);
    noFill();
    rect(-a, -b, a, b);
  }

  // Draw filled ellipse if point is inside
  if (inside)
  {
    noStroke();
    fill(0, 0, 255);
    ellipse(0, 0, a, b);
  }

  // Determine intersection of ellipse bondary and
  // ray from ellipse centre toward mouse location
  float Px, Py;

  String desc;
  
  if (x == 0 && y == 0)
  {
    // No direction
    Px = 0;
    Py = 0;
    desc = "Centre (no line)";
  }
  else if (x == 0)
  {
    // Vertical line
    Px = 0;
    Py = (y < 0) ? -b : b;
    desc = "Vertical line";
  }
  else if (y == 0)
  {
    // Horizontal line
    Px = (x < 0) ? -a : a;
    Py = 0;
    desc = "Horizontal line";
  }
  else
  {
    // Line at some gradient
    float m = y / x;
    
    desc = "Gradient: " + y + " / " + x + " = " + m;

    // Line: y = mx + c (and c==0 since line through origin)
    // Ellipse: (x/a)^2 + (y/b)^2 = 1
    // Solve for x:
    // x = +- (b/m) * sqrt( 1 / (1 + (b/am)^2) )
    // ..then substitute back into line equation for y
    // y = mx + c (again, c == 0)

    float n1 = b / (a * m);
    float n2 = n1 * n1;
    
    // Two possible solutions; find the +ve solution
    Px = (b/m) * sqrt( 1 / (1 + n2) );

    // Make that the -ve solution if we have a -ve y value
    if (y < 0) Px = -Px;

    // Get the y value from the line equation
    Py = m * Px;
  }

  // Line from centre to mouse location
  stroke(255, 0, 0);
  strokeWeight(7);
  line(0, 0, x, y);

  // The ellipse boundary
  stroke(255);
  strokeWeight(onBoundary ? 2 : 1);
  noFill();
  ellipse(0, 0, a, b);

  // Line from centre to point on boundary
  stroke(0);
  strokeWeight(1);
  line(0, 0, Px, Py);
  
  // Target point on boundary with a circle
  stroke(255);
  noFill();
  ellipse(Px, Py, 10, 10);
  
  // Display information
  resetMatrix();
  fill(255, 255, 0);
  text("(x, y) = (" + x + ", " + y + ")\n" +
         desc + "\n" +
         "Inside: " + inside + "\n" +
         "On boundary: " + onBoundary,
       textWidth("M"), textAscent() * 2);
}

void mousePressed()
{
  // Relocate ellipse
  Xc = mouseX;
  Yc = mouseY;
  
  // Size zero (resize on mouse drag)
  a = b = 0;
  drawBox = true;
}

void mouseDragged()
{
  // Resize ellipse
  a = abs(mouseX - Xc);
  b = abs(mouseY - Yc);
}

void mouseReleased()
{
  // Disallow zero radii
  if (a == 0) a = 100;
  if (b == 0) b = 100;
  drawBox = false;
}


