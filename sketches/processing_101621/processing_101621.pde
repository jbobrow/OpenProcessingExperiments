
// Simple star-system simulation.
// Written by Jakob Thomsen.

// gravitational constant
float G;

// planet 0
float x0;
float y0;
float vx0;
float vy0;
float m0;
float r0;

// planet 1
float x1;
float y1;
float vx1;
float vy1;
float m1;
float r1;

// position [-1,+1] -> [0, width]
float toScrX(float x)
{
  return float(width) * (x + 1.0) / 2.0;
}

// position [-1,+1] -> [0, height]
float toScrY(float y)
{
  return float(height) * (y + 1.0) / 2.0;
}

// scale
float toScrSX(float vx)
{
  return float(width) * vx / 2.0;
}

// scale
float toScrSY(float vy)
{
  return float(height) * vy / 2.0;
}

void setup()
{
  size(512, 512);
  colorMode(RGB, 1);
  background(0);
  
  G = 1.0; // in reality: 6.67384 * pow(10, -11);

  x0 = -0.5;
  y0 = 0;
  vx0 = 0;
  vy0 = 0.5;
  m0 = 1;
  r0 = 0.01;
  
  x1 = 0.5;
  y1 = 0;
  vx1 = 0;
  vy1 = -0.5;
  m1 = 1;
  r1 = 0.01;
}

void draw()
{
  // background(0);
  fill(0, 0, 0, 0.05);
  rect(0, 0, width, height);
  
  noStroke();
  fill(0.5, 0.5, 1, 1.0);
  ellipse(toScrX(x0), height - toScrY(y0), 2.0 * toScrSX(r0), 2.0 * toScrSY(r0));
  fill(1, 1, 0.5, 1.0);
  ellipse(toScrX(x1), height - toScrY(y1), 2.0 * toScrSX(r1), 2.0 * toScrSY(r1));

  // background(1);
  float dt = 0.01; //  / frameRate;
  
  // direction from planet 0 to planet 1
  float dx = x1 - x0;
  float dy = y1 - y0;
  // line(x0, y0, x0 + dx, y0 + dy);
  
  // distance of planets
  float d = sqrt(dx * dx + dy * dy);
  // normalize distance-vector
  dx /= d;
  dy /= d;
  
  // line(x0, y0, x0 + dx * 50.0 , y0 + dy * 50.0);
  // line(x1, y1, x1 - dx * 50.0 , y1 - dy * 50.0);
  
  // force
  float F = G * m0 * m1 / (d * d);
  
  // acceleration
  float a0 =  F / m0;
  float a1 = -F / m1;

  // update velocities  
  vx0 += a0 * dx * dt;
  vy0 += a0 * dy * dt;

  vx1 += a1 * dx * dt;
  vy1 += a1 * dy * dt;

  // update positions
  x0 += vx0 * dt;
  y0 += vy0 * dt;

  x1 += vx1 * dt;
  y1 += vy1 * dt;
  
  // line(x0, y0, x0 + dx * 50.0 , y0 + dy * 50.0);
  // line(x1, y1, x1 - dx * 50.0 , y1 - dy * 50.0);
}
