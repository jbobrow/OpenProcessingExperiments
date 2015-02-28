
/**
 * Noise Wave
 * by Daniel Shiffman.  
 * 
 * Using Perlin Noise to generate a wave-like pattern. 
 */
 
int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float yoff = 0.0f;        // 2nd dimension of perlin noise
float[] yvalues;          // Using an array to store height values for the wave (not entirely necessary)

void setup() {
  size(500,500);
  frameRate(30);
  colorMode(RGB,255,255,255,100);
  smooth();
  w = width+20;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(mouseY, 150, 200);  //179,213,219   //use + to limit colors
  calcWave();
  renderWave();

}

void calcWave() {
  float dx = 0.9f;
  float dy = 0.01f;
  float amplitude = 60.0f;

  // Increment y ('time')
  yoff += dy;

  //float xoff = 0.0;  // Option #1
  float xoff = yoff; // Option #2

  for (int i = 0; i < yvalues.length; i++) {
    // Using 2D noise function
    //yvalues[i] = (2*noise(xoff,yoff)-1)*amplitude; // Option #1
    // Using 1D noise function
    yvalues[i] = (10*noise(xoff)-1)*amplitude;    // Option #2
    xoff+=dx;
  }

}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    noStroke();
    fill(255,255,255,50); 
    ellipseMode(CENTER);
    ellipse(x*xspacing,width/10+yvalues[x],20,20);
  }
  
 
}


