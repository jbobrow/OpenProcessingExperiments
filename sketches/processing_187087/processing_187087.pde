
// Visualization of barycentric coordinates
// written by Jakob Thomsen

// (see http://en.wikipedia.org/wiki/Barycentric_coordinates_(mathematics))

class barycentric
{
  float alpha;
  float beta;
  float gamma;

  barycentric()
  {
    alpha = 0.0;
    beta = 0.0;
    gamma = 0.0;
  }

  barycentric(float A, float B, float C)
  {
    alpha = A;
    beta = B;
    gamma = C;
  }

  // Wikipedia
  barycentric(float ax, float ay, float bx, float by, float cx, float cy, float x, float y)
  {
    float d = (by - cy) * (ax - cx) + (cx - bx) * (ay - cy);
    alpha = ((by-cy)*(x-cx)+(cx-bx)*(y-cy)) / d;
    beta = ((cy-ay)*(x-cx)+(ax-cx)*(y-cy)) / d;
    gamma = 1.0 - alpha - beta;
  }

  /*
  // Alternative, from Christer Ericson's Real-Time Collision Detection
  // Compute barycentric coordinates (u, v, w) for
  // point p with respect to triangle (a, b, c)
  barycentric(float ax, float ay, float bx, float by, float cx, float cy, float px, float py)
  {
    float v0x = bx - ax, v1x = cx - ax, v2x = px - ax;
    float v0y = by - ay, v1y = cy - ay, v2y = py - ay;
    float d00 = v0x * v0x + v0y * v0y;
    float d01 = v0x * v1x + v0y * v1y;
    float d11 = v1x * v1x + v1y * v1y;
    float d20 = v2x * v0x + v2y * v0y;
    float d21 = v2x * v1x + v2y * v1y;
    float denom = d00 * d11 - d01 * d01;
    
    gamma = (d00 * d21 - d01 * d20) / denom;
    beta = (d11 * d20 - d01 * d21) / denom;
    alpha = 1.0 - beta - gamma;
  }
  */

  float interpolate(float a, float b, float c)
  {
    return a * alpha + b * beta + c * gamma;
  }
}

boolean inside_triangle(float ax, float ay, float bx, float by, float cx, float cy, float x, float y)
{
  float d = (by - cy) * (ax - cx) + (cx - bx) * (ay - cy);
  float alpha = ((by-cy)*(x-cx)+(cx-bx)*(y-cy)) / d;
  float beta = ((cy-ay)*(x-cx)+(ax-cx)*(y-cy)) / d;
  float gamma = 1.0 - alpha - beta;

  return !(alpha < 0 || alpha > 1 || beta < 0 || beta > 1 || gamma < 0 || gamma > 1);
}

float ax;
float ay;
float bx;
float by;
float cx;
float cy;

void setup()
{
  size(512, 512);
  colorMode(RGB, 1);

  ax = 10;
  ay = 10;
  bx = width - 11;
  by = 10;
  cx = width / 2;
  cy = height - 11;
}

void draw()
{
  background(0);

  strokeWeight(1);
  stroke(0);
  fill(1);
  triangle(ax, ay, bx, by, cx, cy);

  barycentric abc = new barycentric(ax, ay, bx, by, cx, cy, mouseX, mouseY);

  textSize(20);
  textAlign(LEFT);
  fill(1, 0, 0);
  text("alpha: " + Float.toString(abc.alpha), 0, 20);
  fill(0, 1, 0);
  text("beta: " + Float.toString(abc.beta), 0, 40);
  fill(0, 0, 1);
  text("gamma: " + Float.toString(abc.gamma), 0, 60);
  fill(1, 0, 1);
  text("x: " + Float.toString(abc.interpolate(ax, bx, cx)), 0, 80);
  fill(1, 1, 0);
  text("y: " + Float.toString(abc.interpolate(ay, by, cy)), 0, 100);

  strokeWeight(10);
  if (inside_triangle(ax, ay, bx, by, cx, cy, mouseX, mouseY))
  {
    stroke(0, 1, 0);
  }
  else
  {
    stroke(1, 0, 0);
  }
  point(mouseX, mouseY);

  if (mousePressed)
  {
    if (mouseButton == LEFT)
    {
      ax = mouseX;
      ay = mouseY;
    }

    if (mouseButton == RIGHT)
    {
      bx = mouseX;
      by = mouseY;
    }

    if (mouseButton == CENTER)
    {
      cx = mouseX;
      cy = mouseY;
    }
  }
}

