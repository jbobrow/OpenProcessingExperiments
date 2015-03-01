
/* Jessica Fenlon's version of Daniel Shiffman's render of a simple sine wave from the processing examples
* was the starting point for this activity - this is my further exploration thru trial and error (mainly error)
*/
int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 400.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
int a; // integer for alpha value
int aa; // modulus result for alpha value

void setup() {
  size(640, 360);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  a = 0;
}

void draw() {
  background(#FCA752);
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
    yvalues[i] = sin(x*1.0)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    stroke(random(200,255),random(x),random(200,255));
    
    ellipse(x*xspacing, height/2+yvalues[x], 130, 20);
     fill(20,90,10,aa);
     
      ellipse(x*xspacing*1.1, height/2+yvalues[x], 140, 18);
    fill(21,100,10,aa);
    
     ellipse(x*xspacing*1.2, height/2+yvalues[x], 50, 16);
    fill(25,101,11,aa);
    
    ellipse(x*(xspacing*1.6), height/2+yvalues[x], 60, 14);
    fill(110,100,198,aa);
    
     ellipse(x*(xspacing*1.7), height/2+yvalues[x], 70, 12);
    fill(10,15,245,aa);
    
    ellipse(x*(xspacing*2), height/2+yvalues[x], 80, 10);
    fill(99,135,196,aa);
  }
}


