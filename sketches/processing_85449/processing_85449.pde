
void setup() {
  size(500,500);
}

void draw() {
  if (mousePressed) {
    fill(#FF7308);
  } else {
    fill(#06C914);
  }
  ellipse(mouseX, mouseY, 130, 80);
}  


