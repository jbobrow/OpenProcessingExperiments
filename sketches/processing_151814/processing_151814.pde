
/* Daniel Shiffman's render of a simple sine wave from the processing examples
* was the starting point for this activity - - -
*/

int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
float theta = 0.0;  // Start angle at 0
float amplitude = 120.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
int a; // integer for alpha value
int aa; // modulus result for alpha value

void setup() {
  size(640, 360);
  w = width+4;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  a = 0;
}

void draw() {
  background(245);
  calcWave();
  renderWave();
  a++;
  aa = a % 245;
 
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
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    stroke(255,255,255,aa);
    
    ellipse(x*xspacing, height/2+yvalues[x], 27, 27);
    fill(187,100,198,aa);
    
    ellipse(x*xspacing*1.1, height/2+yvalues[x], 24, 24);
    fill(175,100,198,aa);
    
    ellipse(x*(xspacing*1.2), height/2+yvalues[x], 21, 21);
    fill(159,100,198,aa);
    
    ellipse(x*(xspacing*1.4), height/2+yvalues[x], 18, 18);
    fill(119,100,198,aa);
    
    ellipse(x*(xspacing*1.6), height/2+yvalues[x], 15, 15);
    fill(110,100,198,aa);
    
    ellipse(x*(xspacing*1.8), height/2+yvalues[x], 12, 12);
    fill(10,15,245,aa);
    
    ellipse(x*(xspacing*2), height/2+yvalues[x], 9, 9);
    fill(99,135,196,aa);
    
    ellipse(x*(xspacing*2.2), height/2+yvalues[x], 6, 6);
    fill(20,133,201,aa);
  }
}

