
void setup() {
  size(500, 500);
}
void draw() {
 //println(minute() + ": " + second());
  background(0);
  
  //battery outline
  stroke(255);
  fill(0);
  rect(170, 150, 160, 230);
  rect(230, 140, 40, 10);

  noStroke();
  
  float c = map(second(), 0, 59, 0, 500);
  fill(c, 0, 0, 255);
  rect (200, 200, 100, 15);

  fill(c-50, 0, 0, 255);
  rect (200, 250, 100, 15);

  fill(c-100, 0, 0, 255);
  rect (200, 300, 100, 15);
}
