
/**
 * Lissajous Blobs
 * by Charles Morrice (my first Sketch!)
 * based on Sine Wave by Daniel Shiffman.  
 * 
 * Click to explore 
 */
 
int xspacing;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
int snake ;
float theta = 0.0;  // Start angle at 0
float amplitude = 150;  // Height of wave
float period = 300;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
int xphase ;
int yphase ;
int elxphase; // phase of width of ellipse
int elyphase; // ditto hight
int redphase = 2; // phase of red component of ellipse colour
int greenphase = 35; // ditto
int bluephase = 40; // ditto
int bright ;

void setup() {

  xspacing = int(random(15,50));   // How far apart should each horizontal location be spaced
  snake = int(random(2,4));
  
  size(500,500);
  frameRate(30);
  colorMode(HSB);
  smooth();
  w = snake*width;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];

xphase = int(random(1,500));
yphase = int(random(1,500));
elxphase = int(random(1,5)); // phase of width of ellipse
elyphase = int(random(5,10)); // ditto hight
redphase = 2; // phase of red component of ellipse colour
greenphase = 35; // ditto
bluephase = 40; // ditto
bright = int(random(200,300));

}

void draw() {
  background(5);
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
  // A simple way to draw the wave with an ellipse at each location

  for (int x = 0; x < yvalues.length; x++) {
    noStroke();
    fill(int(yvalues[x/redphase]%360),200+yvalues[x],bright,100);
    ellipseMode(CENTER);
    ellipse(yvalues[(x+xphase)%(w/xspacing)]+width/2,width/2+yvalues[(x*yphase)%(w/xspacing)],sq(yvalues[x/elxphase])/amplitude+10,sq(yvalues[x/elyphase])/amplitude+10);
  }
}

void mousePressed() {
  background(0);
  setup();
}



