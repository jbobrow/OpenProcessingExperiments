
//Gabriela Nisenbaum
//April 13, 2013
//clock
 
 void setup() {
  size(400, 400);
}
void draw() {
  //println(minute() + ": " + second());
  background(255);
  noStroke();
  fill(17, 240, 171, 100);
  float s = map(second(), 0, 59, 0, 200);
  ellipse(200, 200, s, s);
  fill(17, 240, 171, 120);
  float m = map(minute(), 0, 59, 0, 200);
  ellipse(200, 200, m, m);
  fill(17, 240, 171, 130);
  float h = map(hour(), 0, 59, 0, 200);
  ellipse(200, 200, h, h);
}
