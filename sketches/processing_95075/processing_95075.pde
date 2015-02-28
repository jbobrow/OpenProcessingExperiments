
//Lissajous Curve
//Creative Computing example
//Ben Norskov April 2, 2013
float incrementer = 0;
void setup() {
  size(350, 350);
  background(255, 0, 0);
}
void draw() {
  //increment both values by different amounts
  float xOff = cos(incrementer*1.5) * 150;
  float yOff = sin(incrementer*5) * 100;
  //using the same value (no multiplier) means the ellipse moves in a circle
  ellipse(width*.5 + xOff, height*.5 + yOff, 30, 30);
  incrementer += .01;
}
