
// A program that draws a bunch of random points,
// and colors each based on the distance from the
// mouse to the point.  Points near the mouse are
// yellow, others are red.
// This is meant to demonstrate the importance of
// arrays.  How would this even be possible if 
// it weren't for arrays?
final int MAX_RADIUS = 8;
final int POINT_COUNT = 3500;
final int TRIGGER_DISTANCE = 185;
final float JIGGLE_FACTOR = 8;

float[] x;
float[] y;
float[] rad;

void setup() {
  size(600, 600);
  background(0);
  strokeWeight(2 * RADIUS);
  stroke(255, 255, 0); // yellow
  x = new float[POINT_COUNT];
  y = new float[POINT_COUNT];
  rad = new float[POINT_COUNT];

  for (int i = 0; i < POINT_COUNT; i++) {
    x[i] = random(width);
    y[i] = random(height);
    rad[i] = random(2 * MAX_RADIUS);
  }
}

void draw() {
  background(0); 

  for (int i = 0; i < POINT_COUNT; i++) {

    // See if mouse is inside the point
    float dis = dist(mouseX, mouseY, x[i], y[i]);

    float redShade = dis > TRIGGER_DISTANCE ? 
    255 : 
    150 + (TRIGGER_DISTANCE - dis)/TRIGGER_DISTANCE * 105;
    float greenShade = dis > TRIGGER_DISTANCE ? 
    0 : 
    redShade;

    stroke(redShade, greenShade, 0, 100);

    strokeWeight(2 * rad[i]);
    point(x[i], y[i]);

    // This was an afterthought...if the mouse is near
    // a circle, move it a little.
    if (dis < TRIGGER_DISTANCE) {
      x[i] += random(-JIGGLE_FACTOR, JIGGLE_FACTOR);
      y[i] += random(-JIGGLE_FACTOR, JIGGLE_FACTOR);
    }
  }
}
