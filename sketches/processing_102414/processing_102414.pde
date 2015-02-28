
void setup() {
  size(800, 500);
  stroke(255);
  background(0);
  smooth();
}

void draw() {
  background(0);
  //fill(0,50);
  //rect(0,0,width, height);
  //noFill();
  float sz = map(mouseX, 0, width, 20, 200);
  float sw = map(mouseY, 0, height, 1, 20);
  float a = map(mouseX, 0, width, 0,255); 
  fill(255,a);
  strokeWeight(sw);
  ellipse(mouseX, mouseY, sz, sz);
}

