
//aviva silberstein
//april 14
//clock!

void setup() {
  size(600, 600);
}
void draw() {
  background(255, 235, 8);
  noStroke();
  fill(15, 89, 245);
  float s = map(second(), 0, 59, 0, 200);
  ellipse(300, 300, s, s);
  fill(17, 240, 171, 120);
  float m = map(minute(), 0, 59, 0, 200);
  rect(300, 300, m, m); 
  fill(245, 15, 142, 120);
  float h = map(hour(), 0, 59, 0, 200);
  ellipse(270, 270, h, h);
}
