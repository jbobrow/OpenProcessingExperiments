
void setup() {
  size(400,400);
  background(0);
  fill(120, 0, 250);
  smooth();
  noStroke();
}

void draw(){
  triangle(mouseX, mouseY, 10, 10,50,50);
}
void mouseClicked(){
  fill(random(255), random(255), random(255));
}

