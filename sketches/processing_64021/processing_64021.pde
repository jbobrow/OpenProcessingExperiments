
// Global variables
float radius = 500;
int X, Y, Z, A;
 
// Setup the Processing Canvas
void setup(){
  size( 510, 510 );
  strokeWeight( 1 );
  frameRate( 15 );
  X = width / 2;
  Y = height / 2;
  Z = width / 2;
  A = height / 2
}
 
// Main draw loop
void draw(){
  
  // Fill canvas grey
  background( 050 );
  
  // Set stroke-color white
  stroke(255); 
  
  Z = Z + sin( frameCount / 4);
  A = A + sin( frameCount * 4);
  // Draw circle
  drawTarget( X, Y, radius, radius/9);                  
  drawTarget( Z, A, radius, radius/9);
}
 
void drawTarget(int xloc, int yloc, int size, int num) 
{
  float steps = size/num;
  for(int i=0; i<num; i++) {
    fill(0,0,0,0);
    stroke(255); 
    ellipse(xloc, yloc, size-i*steps, size-i*steps);
  }
}
