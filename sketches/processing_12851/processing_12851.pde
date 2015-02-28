
// HueSineWave - pfister.fred@gmail.com
// Modified Oct 2010
// Modification to have adaptative wave according to width and height
// Larger color spectrum
// Amplitude modification according to mouse vertical position when pressed

//Based on :
// Sine Wave
// by Daniel Shiffman <http://www.shiffman.net>
// Created 2 May 2005

int xspacing = 4;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

int hueSpeed=5; // To modify the hue changing speed
float theta = 1.5f;// Start angle at 0
float thetaSpeed =0.025; // Define the variation speed of theta
float amplitude ;  // Height of wave
float period ;    // How many pixels before the wave repeats
float dx;                 // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;          // Using an array to store height values for the wave (not entirely necessary)
float newAmplitude;

void setup() {
  size(screen.width,screen.height);
  colorMode(HSB);
  smooth();
  amplitude = height/8;
  newAmplitude = amplitude;
  period=width/4;
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  println(yvalues.length);


  hueSpeed=3;        // Define the variation speed of hue
}

void draw() {
  fill(0,10);
  rectMode(CORNER);
  noStroke();
  rect(0,0,width,height);
  calcWave();
  renderWave();

}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += thetaSpeed;
  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    if(amplitude<newAmplitude)amplitude+=0.05;
    else if(amplitude>newAmplitude)amplitude-=0.05;
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }

}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  for ( int x = 0; x < yvalues.length; x++ ) {
    stroke((hueSpeed*x)%360, 255, 255, 75 );
    fill(yvalues[x], 155, 255, 1 );
    ellipseMode( CENTER );
    ellipse(x*xspacing,height/2+yvalues[x],0.5*yvalues[(x+x)%yvalues.length],0.5*yvalues[(x+x+x)%yvalues.length] );
  }
}

void mousePressed()
{
      newAmplitude = float(mouseY)/height*(height/4);
      println(height);
}


