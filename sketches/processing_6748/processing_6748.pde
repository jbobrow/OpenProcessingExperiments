
import processing.opengl.*;

float x1, y1, x2, y2;
float cx1, cy1, cx2, cy2;
float vx1, vy1, vx2, vy2;
float px, py, pt;
int h, steps;

void setup() {
  size(420, 420);
  colorMode(HSB);

  smooth();
  noFill();
  background(0);

  x1 = random(0, width);
  x2 = random(0, width);
  y1 = random(0, height);
  y2 = random(0, height);
  vx1 = random(-1.0, 1.0);
  vx2 = random(-1.0, 1.0);
  vy1 = random(-1.0, 1.0);
  vy2 = random(-1.0, 1.0);
  steps = 32;
}

void draw() {
  // Calculate Hue
  h = (int) map(sin(x1/width)/cos(y1/height), -1, 1, 64, 255);

  // Bezier curves and control points
  x1 = x1 + (1 * vx1);
  x2 = x2 + (1 * vx2);
  y1 = y1 + (1 * vy1);
  y2 = y2 + (1 * vy2);
  cx1 = sin(8*x1/width) * width;
  cx2 = cos(8*x2/width) * width;
  cy1 = cos(8*y1/height) * height;
  cy2 = sin(8*y2/height) * height;

  // Velocity of each curve point
  if ((x1 < 0) || (x1 > width)) vx1 = -vx1;
  if ((x2 < 0) || (x2 > width)) vx2 = -vx2;
  if ((y1 < 0) || (y1 > height)) vy1 = -vy1;
  if ((y2 < 0) || (y2 > height)) vy2 = -vy2;

  // Simple (and slow) solution for fading :)
  fill(0, 8);
  rect(-1, -1, width+1, height+1);
  noFill();
  
  // Draw curves
  stroke(h, 255, 255, 64);
  bezier(x1, y1, cx1, cx2, cy1, cy2, x2, y2);
  
  // Draw points
  stroke(h, 128, 255, 4);
  for (int i = 0; i <= steps; i++) {
    pt = i / float(steps);
    px = bezierPoint(x1, cx1, cy1, x2, pt);
    py = bezierPoint(y1, cx2, cy2, y2, pt);
    ellipse(px, py, cx1, cy1);
    ellipse(px, py, cx2, cy2);
  }
}

