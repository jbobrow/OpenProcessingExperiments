
/**
 * Noise Wave
 * by Daniel Shiffman.  
 * 
 * Using Perlin Noise to generate a wave-like pattern. 
 */
 
class NoiseWave{ 
  int xspacing;   // How far apart should each horizontal location be spaced
  int w;              // Width of entire wave
  
  float yoff;        // 2nd dimension of perlin noise
  float[] yvalues;          // Using an array to store height values for the wave (not entirely necessary)

 color r;
 color g;
 color b;
 float m; 
  
NoiseWave(int Bxspacing, int z, int r1, int g1, int b1, float dx1) {       //CONSTRUCTOR
    xspacing = Bxspacing;
    w = width+z;
    yoff = 0.1f;
    yvalues = new float[w/xspacing];
    r = r1;
    g = g1;
    b = b1;
    m = dx1;
  }
  
  void calcWave() {
    float dx = m;
    float dy = 0.01f;
    float amplitude = 100.0f;
  
    // Increment y ('time')
    yoff += dy;
  
    //float xoff = 0.0;  // Option #1
    float xoff = yoff; // Option #2
  
    for (int i = 0; i < yvalues.length; i++) {
      // Using 2D noise function
      yvalues[i] = (2*noise(xoff,yoff)-1)*amplitude; // Option #1
      // Using 1D noise function
      //yvalues[i] = (2*noise(xoff)-1)*amplitude;    // Option #2
      xoff+=dx;
    }
  
  }
  
  void renderWave() {
    // A simple way to draw the wave with an ellipse at each location
    for (int x = 0; x < yvalues.length; x++) {
      noStroke();
      fill(r,g,b);
      ellipseMode(CENTER);
      ellipse(x*xspacing,width/2+yvalues[x],1,2);
    }
  }
}

