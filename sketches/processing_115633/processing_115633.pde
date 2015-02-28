
void setup() {
  size(288,409);
  smooth();
  background(255);
}

void draw() {
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY, 20, 20);
  ellipse(pmouseX+10,pmouseY+10, 20, 20);
  ellipse(pmouseX+20,pmouseY+20, 20, 20);
  ellipse(pmouseX+30,pmouseY+30, 20, 20);
}
