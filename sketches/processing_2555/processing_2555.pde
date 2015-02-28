
PImage snail;

float x = 150;
float y = 100;
float angle1 = 0.0;
float snailLength = 2;

void setup() {
  size(1000, 600);
  smooth(); 
  //strokeWeight(20.0);
  //stroke(0, 100);
  snail = loadImage("snail.png");  
}

void draw() {
  background(226);

  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * snailLength);
  y = mouseY - (sin(angle1) * snailLength);
  
  snail(x, y, angle1);
  //segment(x, y, angle1); 
//  ellipse(x, y, 20, 20);
  translate(x,y);              //Tells the cursor to go to where the snail x, y is.
  rotate(angle1);              //Tells the object being targeted to rotate the specified angles
  image(snail, -200, -50, 262, 118); //(,object, x point, y point, x size, y size) 
}

void snail(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, snailLength, 0);
  popMatrix();
}


