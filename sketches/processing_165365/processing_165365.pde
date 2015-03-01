
import processing.pdf.*;

int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 100.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(594, 842);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  background(0);
  calcWave();
  renderWave();
}

void draw() {
  //exit();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta = 0.0;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
for (int j = 0; j < 100; j+=4) {
  for (int x = 0; x < yvalues.length; x++) {
   noStroke();
   fill(180, random(100));
   ellipse(x*xspacing, height/random(2)-yvalues[x], 10, 10);
  }
}
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    noStroke();
    fill(200, 0, 0, random(120));
    ellipse(x*xspacing, height/2.6-yvalues[x], 40, 40);
    ellipse(x*xspacing, height/2.5-yvalues[x], 35, 35);
    ellipse(x*xspacing, height/2.4-yvalues[x], 30, 30);
    ellipse(x*xspacing, height/2.3-yvalues[x], 25, 25);
    ellipse(x*xspacing, height/2.2-yvalues[x], 20, 20);
    ellipse(x*xspacing, height/2.1-yvalues[x], 15, 15);
    ellipse(x*xspacing, height/2-yvalues[x], 10, 10);
    
 }
}






