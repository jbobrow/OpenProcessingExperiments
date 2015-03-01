

int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
float theta = 0.0f;       // Start angle at 0
//float amplitude = 500.0f;  // Height of wave
float amplitude = 1000;
float period = 1000.0f;    // How many pixels before the wave repeats
float dx;                 // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;          // Using an array to store height values for the wave (not entirely necessary)

void setup() {
  size(1000, 600);
  colorMode(HSB);
  frameRate(60);
  smooth();
  filter(BLUR);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  println(yvalues.length);
}

void draw() {
  //background(255);
  noStroke();
  fill(255, 10);
  rect(0, 0, width, height);
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;
  if (mousePressed) {
   theta -= 0.02; 
   
  }
  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  for ( int x = 0; x < yvalues.length; x++ ) {
    stroke( 0, 250, 0, 40);
//   fill( yvalues[x], 255, 255, 1);
    ellipseMode( CORNER );
  if (mousePressed) {
    ellipse( x*xspacing, width/2+yvalues[x], mouseX/20, yvalues[(x+x+x)%77] );

    //ellipse( x*xspacing, width/2+yvalues[x], yvalues[(x+x)%77], yvalues[(x+mouseX/50+mouseY/50)%77] );
    //ellipse( x*xspacing, width/2+yvalues[x], yvalues[(x+mouseX)%77], yvalues[(x+x+x)%77] );
  } else {
       ellipse( x*xspacing, width/2+yvalues[x], mouseX/20, yvalues[(x+x+x)%77] );
  }
 
    //ellipse( x*xspacing, width/2+yvalues[x], yvalues[(x+x)%77], yvalues[(x+x+x)%77] );
  }
}



