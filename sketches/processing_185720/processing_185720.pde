
// This sketch dives into two frustrations I had:
// 1. If there is no draw(), nothing will be drawn in any other function, even if draw() is empty
// 2. Having separate variables for X and Y components is really tedious
int resolution = 400;
int colorCycles = 4;
float depth = 30;
float rotations = 8;
float radius = 18;
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
  
  float hue = startingHue;
  // Go backwards because of occlusion
  PVector previousPoint = endPoint.get();
  for (int i = resolution; i >= 0; i --) {
    //rotate(rotationDelta * i);
    float currentRadius = radius - radiusDelta * i;
    float currentRotation = rotationDelta * i;
    PVector nextPoint = new PVector(
      startingPoint.x + pointDelta.x * i + currentRadius * cos(currentRotation),
      startingPoint.y + pointDelta.y * i + currentRadius * sin(currentRotation)
    );
    
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

