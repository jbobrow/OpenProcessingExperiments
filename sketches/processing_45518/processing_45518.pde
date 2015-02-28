

int centX =250;
int centY = 250;

void setup() {
  size(500, 500);
  smooth();
  noLoop();
}

void draw() {
  // refresh
  background(60, 30, 50, 50);

  strokeWeight(1);

  // repeat a number of times
  float layers = random(5, 10);
  for (int i=0;i<layers;i++) {
    // randomize the radius
    float radius = random(200);

    // draw the filled circle using "shape"
    stroke(20, 50, 70);
    float x, y;
    float noiseval = random(10);
    float radVariance, thisRadius, rad;
    beginShape();

    fill(random(100, 255), random(50), random(100, 200), 50);
    for (float ang=0; ang<=360; ang+=1) {
      noiseval += 0.1;
      radVariance = 30*customNoiseB(noiseval);

      thisRadius = radius+radVariance;
      rad = radians(ang);                                  
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      curveVertex(x, y);
    }
    endShape();
  }
}

float customNoise(float value) {
  float retValue = pow(sin(value), 3);
  return retValue;
}

float customNoiseB(float value) {
  int count = int(value%6);
  float retValue = pow(sin(value), count);
  return retValue;
}
void mousePressed() {
  redraw();
}

void keyPressed() {
  
 saveFrame("circle####.png");
}


