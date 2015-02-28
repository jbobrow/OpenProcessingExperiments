
/*
In-class example
Creative Computing
April 9, 2013
*/

void setup() {
  size(400, 400);
}
void draw() {
  println(minute() + ": " + second());
  background(255);
  float w = map(second(), 0, 59, 0, width);
  rect(0, 200, w, 30);
}


