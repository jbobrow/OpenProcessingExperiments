
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 13-5: Polar to Cartesian

// Polar coordinates (r, theta) are converted to Cartesian (x,y) 
// for use in the ellipse() function.


float r = 75; 
float theta = 0;
float q = 0;
int countX=0;
int s = 1;
int t = 1;
void setup() {
  size(800,800);
     background(0);
  smooth();
}

void draw() {

  // Polar to Cartesian conversion
  float x = width/2 * sin(q)/sqrt(theta);
  float y = height/2 * cos(q)/sqrt(theta);
  q=q+3;

  // Draw an ellipse at x,y
frameRate(400);
  noStroke();
  colorMode(HSB,100);
  fill((theta),150,200,(theta*10));
  ellipse(x+width/2, y+height/2,s,t); // Adjust for center of window
s=s+1;
t=t+1;
if (s>=5 && t >= 20){
  s=2;
  t=1;
}


  // Increment the angle
  theta += 0.001;

}

void mousePressed(){

}

