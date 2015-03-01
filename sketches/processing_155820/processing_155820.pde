
int radius;
color myColor;
float bob;

void setup() {
  size(800, 600);
}

void draw() {
  background(0, 255, mouseX);
  myColor=int(map(mouseX, 0, width, 0, 255));
  stroke(100, 100, 25);
  strokeWeight(3);
  fill(mouseX, 150, frameCount);
  radius=mouseX;
  rect(mouseX, mouseY, radius, radius);
  ellipse(mouseY, mouseX, radius, radius);
  //println(frame);
}



