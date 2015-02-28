
float x;
float easing=0.03;
float diameter=5;

void setup() {
  size(500, 500);
  strokeWeight(5);
  smooth();
  stroke(131, 10, 193, 80);
}

void draw() {
  float targetX = mouseX;
  x += (targetX-x)*easing;
  float weight=dist(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(weight);
  line(mouseX, mouseY, pmouseX, pmouseY);
}


