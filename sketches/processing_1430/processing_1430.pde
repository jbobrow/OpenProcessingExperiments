

/** 
 * Color Vortex
 * by Algirdas Rascius.
 *  
 * Click for a new vortex.
 */ 

static final int MAX_COUNT = 50;

int count;
Oscillator[] points = new Oscillator[MAX_COUNT];
Oscillator[] radiuses = new Oscillator[MAX_COUNT];
Oscillator hueSpeed;
float hueValue;

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  colorMode(HSB, TWO_PI, 1, 1, 1);
  initialize();
}

void draw() {
  hueValue = (hueValue + hueSpeed.getValue()) % TWO_PI;
  fill(color(hueValue, 1, 1, 0.05));
  beginShape();
    for (int i=0; i<count+3; i++) {
      float x = points[i%count].getScaledX(radiuses[i%count].getValue());
      float y = points[i%count].getScaledY(radiuses[i%count].getValue());
      curveVertex(x, y); 
  }
  endShape();
}

void initialize() {
  background(0);
  count = (int)random(3, MAX_COUNT);
  for (int i=0; i<count; i++) {
    points[i] = new Oscillator(0.5*width, 0.4*width, random(0.005, 0.015));
    radiuses[i] = new Oscillator(0.7, 0.3, random(0.001, 0.005));
  }
  float speed = random(0.01, 0.02);
  hueSpeed = new Oscillator(speed, speed*0.7, random(0.003, 0.006));
  hueValue = random(TWO_PI);
}

void mousePressed() {
  initialize();
}

void keyPressed() {
  initialize();
}

class Oscillator {
  float average;
  float amplitude;
  float frequency;
  float phase;
  
  Oscillator(float average, float amplitude, float frequency) {
    this.average = average;
    this.amplitude = amplitude;
    this.frequency = frequency;
    this.phase = random(TWO_PI);
  }

  float getValue() {
    return amplitude*sin(frequency*frameCount + phase) + average;
  }  
  
  float getScaledX(float scaleFactor) {
    return amplitude*scaleFactor*sin(frequency*frameCount + phase) + average;
  }

  
  float getScaledY(float scaleFactor) {
    return -amplitude*scaleFactor*cos(frequency*frameCount + phase) + average;
  }
  
}


