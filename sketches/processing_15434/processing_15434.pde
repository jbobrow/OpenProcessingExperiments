
//SINESTESIA SKETCH
// Romina de Grote  

// Variables for color
float r;
float g;
float b;
float A;

// Variables for sin and cos
float a = 0.0;
float s = 0.0;

// Variables for ellipse
int circleSize = 0;
int circleX = 250; 
int circleY = 250;

// set up function
void setup() { 
  size(500,500); 
  frameRate(50);
  smooth();
  noLoop(); // no loop in setup
}

void draw()  {
  background(0);
  a = a + 0.04; // values for sin and cos
  s = cos(a)*2;
  
  r = random(255); // set random values for color, from 0 to 255
  g = random(255);
  b = random (255);
  A = random(255);
  
  translate(width/2, height/2); // translate moves the object from center
  scale(s); // and scales the ellipse with value of s
  noStroke(); 
  fill(r,g,b,A);
  ellipse(circleX,circleY,circleSize,circleSize);
  
  
  translate(75, 0); 
  fill(255); 
  scale(s); 
  noStroke();
  ellipse(width/2,height/2,30,30);
  
  circleSize = circleSize + 1; // first ellipse size increases every time + 1
 }
 
 void mousePressed() { // starts by pressing mouse
 loop();  
 } 
 
  


