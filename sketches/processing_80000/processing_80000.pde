
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/1012*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// Sine Wave
// Daniel Shiffman <http://www.shiffman.net>

// Render a simple sine wave

// Created 2 May 2005
PImage img;
int xspacing = 3;   // How far apart should each horizontal location be spaced
int w = 100;              // Width of entire wave

float theta = 0.f;       // Start angle at 0
float amplitude = 45.0f;  // Height of wave
float period = 300.0f;    // How many pixels before the wave repeats
float dx;                 // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;          // Using an array to store height values for the wave (not entirely necessary)

void setup() {
  size(800,435);
  img = loadImage ("ripple.png");
  smooth();
  w = width;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  println(yvalues.length);
}

void draw() {
  //background(255);
  image (img, 0, 0);
  rect(0,0,width,height);
  calcWave();
  renderWave();
  renderWave2();
  renderWave3(); 
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.04;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 5; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}



void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  for ( int x = 0; x < yvalues.length; x++ ) {
    stroke( x, 255, 255, 50 );
    fill( yvalues[x], 155, 255, 1 );
    ellipseMode( CENTER );
    ellipse( x*xspacing,width/2.2+yvalues[x],yvalues[(x+x)%22],yvalues[(x+x+x)%77] );
  }
}

void renderWave2() {
  // A simple way to draw the wave with an ellipse at each location
 for ( int x = 0; x < yvalues.length; x++ ) {
     stroke( x, 255, 255, 50 );
    fill( yvalues[x], 155, 255, 1 );
    ellipseMode( CENTER );
    ellipse( x*xspacing,width/2.5+yvalues[x],yvalues[(x+x)%90],yvalues[(x+x+x)%77] );
  }
}

void renderWave3() {
  // A simple way to draw the wave with an ellipse at each location
 for ( int x = 0; x < yvalues.length; x++ ) {
     stroke( x, 255, 255, 50 );
    fill( yvalues[x], 155, 255, 1 );
    ellipseMode( CENTER );
    ellipse( x*xspacing,width/3+yvalues[x],yvalues[(x+x)%90],yvalues[(x+x+x)%77] );
  }
}



