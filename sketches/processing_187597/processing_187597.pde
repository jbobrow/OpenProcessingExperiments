
/**
 * Major tweaks to the sine wave example in the Math section.
 */

int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 140.0;  // Height of wave
float period = 34.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(840, 360);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
 //frameRate(50);
}

void draw() {
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 15, 15);
    if (x<height/4+yvalues[x]) {
      fill(255, 255, 255, 111);
    } else {
      fill(255, 255, 255, 255);
    }
  }
}

