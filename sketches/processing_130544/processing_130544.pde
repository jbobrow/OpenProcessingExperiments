
/**
 This is the same modulated Lissajous code, but we are changing how we go about
 rendering it using a technique I got from "Generative Design", who in turn apparently
 got from Keith Peters.
 
 Rather than drawing a line by connecting each point to its immediate predecessor,
 we instead connect every point to every other point. In order to actually see
 anything, of course, we need to render the lines with transparency. In this
 technique, we adjust the transparency of the lines based on the distance to the
 other points. Close points create nearly black lines, while distant points are
 connected with gossamer threads that can barely be seen. The function is not
 linear, so there is a stepp fall off in the transparency, creating an openness
 to the structure. The result is a lattice work that looks very structural, and 
 can be used just about any time we have a collection of points to render.
 
 C. Andrews
 2014-01-27
 **/

float phi =  PI/2;
int numPoints = 500;
int amplitude = 300;
float a = 2;
float b = 1;

float aM = 6;
float bM = 8;

// this is the maximum distance apart we want to draw lines
int connectionDistance = 200;

// we will be storing a list of all of the points we generate in this array
PVector[] points;
void setup() {
  size(600, 600); 
  noFill();
  noLoop();
  smooth();

  // create the array of points
  points = new PVector[numPoints];

  float x = 0;
  float y = 0;
  // walk through the curve, adding the points to an array instead of drawing them
  for (int i = 0; i < numPoints; i++) {
    float angle = map(i, 0, numPoints, 0, TWO_PI);
    x = sin(a * angle + phi)*cos(aM*angle + phi)*amplitude;
    y = sin(b * angle)*cos(bM*angle + phi)*amplitude;
    points[i] = new PVector(x, y);
  }
}


void draw() {
  background(255);

  translate(width/2, height/2);

  // iterate through all of our points
  for (int i = 0; i < points.length; i++) {

    // for each point, iterate through all points
    for (int j = 0; j < points.length; j++) {
      PVector p0 = points[i];
      PVector p1 = points[j];
      // figure out the distance between the two points
      float distance = dist(p0.x, p0.y, p1.x, p1.y);
      if (distance < connectionDistance) { // don't draw lines that are too long
        // calculate what alpha should be based on the distance
        // the main formula is a number between 0 and 1, so we multiply by 90
        // to darken it
        float alpha = pow(1/ ((distance/connectionDistance) + 1), 6) * 90;

        stroke(0, alpha);
        line(p0.x, p0.y, p1.x, p1.y);
      }
    }
  }
}



