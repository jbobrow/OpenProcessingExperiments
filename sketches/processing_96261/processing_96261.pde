
//Samyukta Madhu
//Creative Computing - 14th April, 2013
//Clock
void setup() {
  size(600, 600);
}
void draw() {
  background(0);
  noFill();
  stroke(random(0, 255), random(0, 255), random(0, 255), 100);
  strokeWeight(5);
  float a = map(second(), 0, 59, 0, 600);
  ellipse(300, 0, a, a);
  ellipse(0, 300, a, a);
  ellipse(300, 600, a, a);
  ellipse(600, 300, a, a);
  stroke(255, 150);
  strokeWeight(10);
  float b = map(minute(), 0, 59, 0, 600);
  ellipse(0, 0, b, b);
  ellipse(600, 0, b, b);
  ellipse(600, 600, b, b);
  ellipse(0, 600, b, b);
  stroke(255, 150);
  strokeWeight(50);
  float c = map(hour(), 0, 59, 0, 600);
  if (mousePressed) { 
    fill(random(0, 255), random(0, 255), random(0, 255), 100);
  }
  ellipse(300, 300, c, c);
  if (mousePressed) { 
    fill(255);
    text(hour()+":"+minute()+":"+second(), 270, 300);
  }
}
