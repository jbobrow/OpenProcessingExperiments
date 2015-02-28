
/* 
  PROCESSINGJS.COM - BASIC EXAMPLE
  Delayed Mouse Tracking  
  MIT License - Hyper-Metrix.com/F1LT3R
  Native Processing compatible 
*/  

// Global variables
float radius = 50.0;
int X, Y;
int nX, nY;
int delay = 16;

// Setup the Processing Canvas
void setup(){
  size( 200, 200 );
  strokeWeight( 10 );
  frameRate( 30 );
  X = width / 2;
  Y = width / 2;  
}

// Main draw loop
void draw(){
  
  radius = radius + sin( frameCount );
  
  // Track circle to new destination
  X = width / 2 + sin(frameCount/40) * 20;
  Y = width / 2 + cos(frameCount/40) * 20;
  
  // Fill canvas grey
  background( 100 );
  
  // Set fill-color to blue
  fill( 0, 121, 184 );
  
  // Set stroke-color white
  stroke(255); 
  
  // Draw circle
  ellipse( X, Y, radius, radius );                  
}

