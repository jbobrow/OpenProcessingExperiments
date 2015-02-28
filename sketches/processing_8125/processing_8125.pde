

float r = 0; 
float theta = 0;

void setup() {
  size(800,800);
  background(0);
  smooth();
}

void draw() {
frameRate(100);
  // Polar to Cartesian conversion
  float x = r * cos(theta+r);
  float y = r * sin(3*sqrt(theta)-r);
  smooth();
  // Draw an ellipse at x,y

  noStroke();
  fill((theta*5),100,70,50);
  ellipse(x + width/2, y + height/2, 4, 4); // Adjust for center of window
  
  // Increment the angle
  theta +=0.01;
r-=.05;
if(x>=width/2 && y>=height/2){
  r=0;
  fill(0,255,20,25);
 theta = 0;
  theta +=0.1;
}
}


