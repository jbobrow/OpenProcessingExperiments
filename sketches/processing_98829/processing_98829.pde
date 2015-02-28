
 
int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(500, 500);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(130);
  calcWave();
  renderWave();
  fill(255);
  ellipse(250,250,5,5);
  
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.033;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

class Cell{
  float angle;
}

void renderWave() {
  noStroke();
//  fill(122);//127+127*sin(angle));
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    fill(map(yvalues[(x*3)%yvalues.length],0, 150, 120,255));
    ellipse(x*xspacing, height/2+yvalues[x], 16, 16);
  }
}


