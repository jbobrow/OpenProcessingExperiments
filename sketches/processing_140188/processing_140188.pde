
// A Polar coordinate
float r = 0;
float theta = 0.001;
float rsize =6;
void setup() {
size(800,800);
background(255);
smooth();
frameRate(420);
}
void draw() {
// Polar to Cartesian conversion
float x = r * cos(theta);
float y = r * sin(theta);
  r += .01;
  //rsize += .005;
  pushMatrix();
  translate(width/2,height/4);
  noStroke();
  fill(0,32);
  ellipse(x , y, rsize, rsize); // Adjust for center of window
  popMatrix();
// Draw an ellipse at x,y

  pushMatrix();
  translate(width/2,(3*height)/4);
  noStroke();
  fill(0,32);
  ellipse(x , y, rsize, rsize); // Adjust for center of window
  popMatrix();
  
  
  pushMatrix();
  translate(width/4,height/2);
  noStroke();
  fill(0,32);
  ellipse(x , y, rsize, rsize); // Adjust for center of window
  popMatrix();
// Draw an ellipse at x,y

  pushMatrix();
  translate((3*width)/4,height/2);
  noStroke();
  fill(0,32);
  ellipse(x , y, rsize, rsize); // Adjust for center of window
  popMatrix();
// Increment the angle
theta += 0.01;

}
