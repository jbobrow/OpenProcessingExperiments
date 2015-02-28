
/*
 * Click the mouse to have it move to a new position.
 */

float beginX = 20.0;  // Initial x-coordinate
float beginY = 10.0;  // Initial y-coordinate
float endX = 570.0;   // Final x-coordinate
float endY = 320.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 4;   // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 2;    // Size of each step along the path
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)
long counter = 0;
float prev_x = 0.0;   // Current x-coordinate
float prev_y = 0.0;   // Current y-coordinate
float freq, amplitude, t;
float xnorot=0;
float ynorot;
float angle;
float saiz;
float trail;
float hue;

void setup() 
{
  size(640, 360);
  distX = endX - beginX;
  distY = endY - beginY;
  frameRate(1000);
  background(0);
  smooth();
  saiz = 2;
  strokeWeight(saiz*2);
  freq = 0.5;
  amplitude = 20;
  trail = 20;
  hue = 30;
  colorMode(HSB, 100);
}

void draw() 
{
  prev_x = x;
  prev_y = y;
  noStroke();
  fill(0, trail);
  rect(0, 0, width, height);
  if (distX > 0) pct += step; 
  if (distX < 0) pct -= step;
  if (abs(pct) < sqrt(pow(distY,2) + pow(distY,2)))  {
    angle = atan(distY/distX);
    // sinusoid along X
    xnorot = pct;
    ynorot = amplitude*sin(xnorot*freq/TWO_PI);
    // sinusoid along a given direction
    x = beginX + cos(angle)*xnorot - sin(angle)*ynorot;
    y = beginY + sin(angle)*xnorot + cos(angle)*ynorot;
  } else {
    beginX = x;
    beginY = y;
    endX = random(640);
    endY = random(360);
    distX = endX - beginX;
    distY = endY - beginY;
    pct = 0.;
  }
  stroke(100-hue, 100, 100);
  line(prev_x, prev_y, x, y);
  counter++;
  if ((counter % 1000) == 0) mousePressed();
}

void mousePressed() {
  pct = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
  amplitude = 2 + random(10);
  saiz = 1 + random(10);
  freq = random(5) + 0.1;
  trail = 1. + random(10);
  hue = map(freq, 0, 5, 1, 100); 
  stroke(hue, 100, 100);
}


