
/**
 * Pull the ring to pull down the curtain; when you
 * move the mouse outside the ring, the curtain rolls up.
 */

int minHeight = 10;  // minimum "height" of curtain
int r = 12;  // radius of the ring
int cord = 10; // length of cord
int cx = 150; // center x
int cy = minHeight + r + cord;

// how fast should curtain move up when released?
float startDelta = 1;
float deltaY = 1;
float acceleration = 1.1;

void setup( )
{
  size(300, 300);
}

void draw()
{
  background(255);
  
  /*
    if mouse is in the circle, then center the circle
    on the current mouseY.
  */
  if ((cx - mouseX)*(cx - mouseX) + (cy - mouseY)*(cy - mouseY)
    <= (r + 5) * (r + 5))
  {
    cy = mouseY;
    deltaY = startDelta;
  }
  else
  {
    cy = int(cy - deltaY);    // move curtain up
    deltaY *= acceleration;  // make next change greater.
  }
  
  // make sure that part of the curtain is always visible
  if (cy < minHeight + r + cord)
  {
    cy = minHeight + r + cord;
  }
  
  // draw the curtain cord, and ring
  fill(192);
  noStroke();
  rect(0, 0, 300, cy - (r + cord));
  stroke(0);
  line(0, cy - (r + cord), 300, cy - (r + cord));
  fill(255);
  line(cx, cy - (r + cord), cx, cy);
  ellipse(cx, cy, r, r);
  ellipse(cx, cy, r - 2, r - 2);
}


