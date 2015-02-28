
// eyeball


float centerx;
float centery;
float eyeballRad = 49.0 / 2;
float circRadius = 4.5;
float zDist = 200;

void setup() {
  size(320, 240);
  centerx = width/2;
  centery = height/2;
}

// Think of the eyeball as a sphere.
// The iris is a point on the eyeball.
// The mouse resides on a plane which is z units away
//   from the center of the eyeball.
// We trace a line from the center of the eye to the mouse,
//   then get the intersection between the center and the
//   eyesphere.
// We project that intersection back to the plane.

// ======================================================
// Alternate approach.
// Assume a 3D cartesian coordinate system with the origin
//   at the eye origin.
// Trace a line from eyeOrigin to mouseLoc.
// We can use the dot product (|a|*|b|*cos theta)
//   with the y and z projections of the traced line
//   to determine the theta and phi needed to rotate an
//   eyeball pointing (1, 0, 0) towards the mouseLoc.
// This approach seems more natural than the current one.

// Alt approach 2: Polar coordinates
// x = r cos theta
// y = r sin theta
// r = sqrt(x^2 + y^2)
// find theta, adjust r
// irisR = min(mouseR, eyeballR)
// ======================================================

// Future considerations
// How do we tween a path from the previous sight line to
//   the next?
// We can then animate the eye shifting its attention
//   from place to place.

// THE INTERSECTION
// 2D example:
// 1: x^2 + y^2 - R^2 = 0
// 2: (x0, y0) + t(mx, my) = (x0 + mx*t, y0 + mx*y)
// Plug in the line eqn to the circle eqn
// (x0 + mx*t)^2 + (y0 + mx*y)^2 - R^2 = 0
// Expand
// x0^2 + 2*x0*mx*t + mx^2*t^2 + ... - R^2 = 0
// Then we get a quadratic equation w.r.t. t
// A*t^2 + B*t + C = 0
// Solve using quadratic equations.

// Generalizing to 3D:
// (x-xs0)^2 + (y-ys0)^2 + (z-zs0)^2 - R^2 = 0
// (x0 + mx*t, y0 + my*t, z0 + mz*t)
// (x0 + mx*t - xs0)^2 + ... + ... - R^2 = 0
// Or, using the sphere origin as the line's
//   point of origin:
// (xs0 + mx*t)^2 + ... + ... - R^2 = 0
// Expand
// Solve

// Now, we can simplify further since the ray is
//   guaranteed to pass through the center of the sphere
// But I don't know how.

// Sphere equation: x^2 + y^2 + z^2 = radius (1)
// Line equation: ???
// Parametrize line
// Solve line(t) = radius to get x,y,z coords
// Dump the z coord and draw.

void draw() {
  background(127);
  
  // So we have a line going from the center of the circle
  //   (0,0,0)
  //   to the cursor position.
  float x0 = 0;
  float y0 = 0;
  float z0 = 0;
  float mx = (mouseX - (width/2)) - x0;
  float my = (mouseY - (height/2)) - y0;
  float mz = zDist - z0;
  // Now we have all the info we need for the line equation.
  
  // (xs0 + mx*t)^2 + ... + ... - R^2 = 0
  // xs0*xs0 + 2*xs0*mx*t + mx^2*t^2
  // Rearrange
  // mx^2*t^2 + 2*xs0*mx*t + xs0*xs0 + ... + ...
  // Combine like terms w.r.t. the variable 't'
  // (mx^2+my^2+mz^2)*t^2 + 2*(xs0+ys0+zs0)*t + 
  //   (xs0^2+ys0^2+zs0^2 - R^2) = 0
  // a = (mx^2+my^2+mz^2)
  float a = mx*mx + my*my + mz*mz;
  // b = 2*(xs0*mx+ys0*my+zs0*mz)
  float b = 2*(x0*mx + y0*my + z0*mz);
  // c = (xs0^2+ys0^2+zs0^2 - R^2)
  float c = (x0*x0 + y0*y0 + z0*z0 - (eyeballRad * eyeballRad));
  // quadratic formula: (-b +- sqrt(b^2 - 4*a*c)) / (2*a)
  float disc = b*b - 4*a*c;
  float sqrtDisc = sqrt(b*b - 4*a*c);
  // Get the roots. t = ?,?
  float tPlus = (-b + sqrtDisc) / (2*a);
  float tMinus = (-b - sqrtDisc) / (2*a);
  // Determine the greatest real t, use it
  // Reasoning:
  //  1. The origin is the circle origin,
  //  2. The endpoint of the line is at the mouse
  //  3. Higher t will be closer to the endpoint
  // (all roots here should be real, only if the line has
  //   no intersection with the sphere will it have Im roots)
  float t = max(tPlus, tMinus);
  float irisX = x0 + mx*t;
  float irisY = y0 + my*t;
  // drop the Z in order to project
  //println(mouseX + ", " + mouseY);
  //println((mouseX - (width/2)) + ", " + (mouseY - (height/2)));
  //println(disc + ", " + sqrtDisc);
  //println(tPlus + ", " + tMinus);
  println(zDist);
  translate(width/2, height/2);

  fill(255);
  ellipse(x0, y0, eyeballRad*2, eyeballRad*2);
  fill(0);
  ellipse(irisX, irisY, circRadius*2, circRadius*2);
}

void keyPressed() {
  if (key == 'w') {
    zDist += 1;
  }
  if (key == 's') {
    zDist -= 1;
  }
}

