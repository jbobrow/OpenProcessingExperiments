
void setup() {
  size(400, 600);
}


void draw() {
  background(210);
  fill(255);
  if ((mouseY > 100) && (mouseY < 500) && (mouseX > 100) && (mouseX < 300) ){
    fill(127, 127, 255);
    if (mousePressed == true) {
      fill(10, 203, 230);
    }
  }
  rect(100, 100, 200, 400);
}
