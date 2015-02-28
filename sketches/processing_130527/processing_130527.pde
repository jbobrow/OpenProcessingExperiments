
/**
This is very simple example showing how we can draw a sine wave.

There are three controls with a sine wave
amplitude -- the height of the peaks
frequency or period -- the spacing between peaks
phase shift or phi -- the offset from the origin

We put them together like this:

sin(angle * frequency + phi) * amplitude

In this example, we having a sweeping wave that appears to travel 
across the screen by incrementing phi every time we draw.

C. Andrews
2014-01-27
**/


float phi =  0; // the phase shift offset amount
float amplitude = 100; // the amplitude of our wave
float frequency = 1.0/32; // slow down our wave so we can see it better
int numPoints = 100; // the granularity of our drawing

void setup() {
  size(600, 600); 
  noFill();
}


void draw() {
  background(255);

// center the wave on the canvas
  translate(0, height/2);

  float x = 0;
  float y = 0;
  
  // if we consider 1 pixel to be 1 radian, then this is the number 
  // of radians between points
  float angle = width/numPoints;
  
  // we are drawing the curve using our shape tool
  beginShape();
  for (int i = 0; i < numPoints; i++) {
    
    // calculate where we are along x
    x = angle*i;
    
    // y is determined by our function
    y = sin(x*frequency+phi)* amplitude;
    vertex(x, y);
  }
  endShape();
  
  // phase shift to the left so the wave appears to b marching to the right
  phi -= .05;
}



