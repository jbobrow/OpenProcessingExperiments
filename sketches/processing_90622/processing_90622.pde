
float x= 0.0;
float easing = 0.01;

void setup() {
  size (100, 100);
  smooth();
  noStroke();
}

void draw() {
  background(200, 0, 100);
  float targetX = mouseX;
  x+= (targetX - x) * easing;
  //ellipse(mouseX, 30, 40, 40);
  //ellipse(x, 70, 40, 40);
  fill(0, 100, 180);
  noStroke();
  rect(x, 47, 30, 8);
  
  stroke(0, 100, 180);
  fill(255);
  strokeWeight(2);
  rect(x+6, 39, 17, 8);
  ellipse(x+4, 57, 6, 6);
  ellipse(x+25, 57, 6, 6);
}
