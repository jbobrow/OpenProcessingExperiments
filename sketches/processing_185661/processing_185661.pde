
// This sketch dives into two frustrations I had:
// 1. If there is no draw(), nothing will be drawn in any other function, even if draw() is empty
// 2. Having separate variables for X and Y components is really tedious
int resolution = 400;
int colorCycles = 4;
float depth = 30;
float rotations = 6;
float radius = 12;
float thickness = 5;


void setup() {
  size(500, 500, P3D);
}

void draw() {
  lights();
}

void mousePressed() {
  PVector startingPoint = new PVector(mouseX, mouseY, 0);
  PVector endPoint = new PVector(width / 2, height / 2, -1  * depth);
  PVector pointDelta = PVector.div(PVector.sub(endPoint, startingPoint), resolution);
  float startingHue = random(255);
  float hueDelta = colorCycles * 255 / resolution;
  float rotationDelta = PI * 2 * rotations / resolution;
  float radiusDelta = radius / resolution;
  float thicknessDelta = thickness / resolution;
  
  colorMode(RGB);
  background(0, 6, 50);
  colorMode(HSB);
  
  PVector previousPoint = startingPoint.get();
  float previousRotation;
  float hue = startingHue;
  
  translate(0, 0, 0);
  // Draws backwards because of occlusion
  for (int i = 0; i < resolution; i ++) {
    PVector nextPoint = rotatePointAroundAxis(previousPoint, pointDelta, rotationDelta);
    
    strokeWeight(thickness - thicknessDelta * i);
    stroke(hue, 255, 255);
    line(
      previousPoint.x,
      previousPoint.y,
      previousPoint.z,
      nextPoint.x,
      nextPoint.y,
      nextPoint.z
    );
    
    hue += hueDelta;
    while (hue > 255) hue -= 255;
    previousPoint = nextPoint;
  }
}

// Translated from Processing 1.0 code found here: processing.org/discourse/beta/num_1228387702.html
PVector rotatePointAroundAxis(PVector point, PVector axis, float radianRotation) {
  // Okay, now THIS is my new frustration.
  // There's no static normalize method? I need to manually copy my vector
  // so that I can nondestructively normalize it? Pardon my French, but fuck that.
  PVector axisNormalized = axis.get();
  axisNormalized.normalize();
  PVector pointNormalized = point.get();
  pointNormalized.normalize();
  float _parallel = PVector.dot(axis, point);
  PVector parallel = PVector.mult(axis, _parallel);
  PVector perp = PVector.sub(parallel, point);
  // Here we go again... A little consistency would be nice!
  PVector cross = point.get();
  cross.cross(axis);
  return PVector.add(
    parallel,
    PVector.add(
      PVector.mult(cross, sin(radianRotation)),
      PVector.mult(perp, cos(-radianRotation))
    )
  );
}
