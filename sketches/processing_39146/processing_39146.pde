
//Bryan Williams
//September 25, 2011
//Computational Methods
//Homework 5.1

void setup() {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {  //this creates the grid of randomly sized squares
  for (int B = 0; B<height; B+=15) {
    for (int W = 0; W<width; W+=15) {
      figure(B, W);
    }
  }
  for (int a = 3; a<height; a+= 15) {
    for (int b = 3; b<width; b+= 15) {
      point(a, b);
    }
  }
  noLoop();
}
// This sets up the light blue rectangles in the background of the composition
void figure (float B, float W) {
  pushMatrix();
  translate(0, 0);
  stroke(255);
  fill(#B4F7FF);
  rect(B+5, W+5, random(13), random(14));
  popMatrix();
}
// This sets up the grid of lines 
void point(float a, float b) {
  pushMatrix();
  translate (0, 0);
  noFill();
  strokeWeight(.06);
  stroke(0);
  rect(a, random(b), random(height), random(height));
  popMatrix();
} 


