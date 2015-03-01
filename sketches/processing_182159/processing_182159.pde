
void setup() {
  size(464, 464);
  background(#1E2F95);
}

void draw() {
  if (mousePressed == true) {
    background(#1E2F95);
  }
  else {
    stroke(#3d3d3d, 60);
    fill(mouseX, mouseY, mouseY);
    triangle(mouseX-random(10,20), mouseY-random(10,20), mouseX+random(10,20), mouseY-random(10,20), mouseX, mouseY+random(10,20));
  }
}


