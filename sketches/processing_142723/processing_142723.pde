
int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(640, 360);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(0, 20, 50, 140);
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
  
  //middle arm
  noStroke();
  fill(255, 0, 200, 40);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 8; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 60, 60);
  }
  noStroke();
  fill(255, 0, 127);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 8; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 30, 30);
  }
  noStroke();
  fill(0, 0, 255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 8; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 15, 15);
  }
  noStroke();
  fill(0, 255, 0);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 8; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 7, 7);
  }
  
  
  //top arm
  noStroke();
  fill(255, 0, 200, 40);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 20; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/6+yvalues[x], 60, 60);
  }
  noStroke();
  fill(255, 0, 127);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 20; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/6+yvalues[x], 30, 30);
  }
  noStroke();
  fill(0, 0, 255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 20; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/6+yvalues[x], 15, 15);
  }
  noStroke();
  fill(0, 255, 0);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 20; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/6+yvalues[x], 7, 7);
  }
  
  //bottom arm
  noStroke();
  fill(255, 0, 200, 40);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 35; x < yvalues.length; x++) {
    ellipse(x*xspacing, height-20+yvalues[x], 60, 60);
  }
   noStroke();
  fill(255, 0, 127);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 35; x < yvalues.length; x++) {
    ellipse(x*xspacing, height-20+yvalues[x], 30, 30);
  }
  noStroke();
  fill(0, 0, 255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 35; x < yvalues.length; x++) {
    ellipse(x*xspacing, height-20+yvalues[x], 15, 15);
  }
  noStroke();
  fill(0, 255, 0);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 35; x < yvalues.length; x++) {
    ellipse(x*xspacing, height-20+yvalues[x], 7, 7);
  }
}

