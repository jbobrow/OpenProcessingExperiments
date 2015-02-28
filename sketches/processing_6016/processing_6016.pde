
//Circle spiral
//By Carrie Hyde
//Based off of Code by Cedric Mamo animation http://www.openprocessing.org/visuals/?visualID=5011
void setup() 
{ 
  size(700, 700,P2D); 
  smooth(); 
  background(0); 
  strokeWeight(1); 
  frameRate(500); 
  noFill();
} 
 
float phaseIncInc = TWO_PI/100000; 
float phaseInc = phaseIncInc; 
 
float radiusInc = 1; 
 
void draw() 
{ 
  translate(width >> 1, height >> 1); 
  background(0); 
 
  float phase = 4; 
  float radius = 0; 
 
  float prevX = 0; 
  float prevY = 4; 
  float newX, newY; 
 
  for (int i = 0; i < 200;i++) 
  { 
    newX = cos(phase+5) * radius; 
    newY = sin(phase-2) * radius; 
 
    stroke(cos(phase)*10,sin(phase+7)*40,sin(phase-HALF_PI)*128+128); 
 
    ellipse(prevX, prevY, newX, newY); 
    prevX = newX; 
    prevY = newY; 
 
    phase += phaseInc; 
    radius += radiusInc; 
  } 
 
  phaseInc += phaseIncInc; 
  if (phaseInc > TWO_PI) phaseInc -= TWO_PI; 
} 
 

