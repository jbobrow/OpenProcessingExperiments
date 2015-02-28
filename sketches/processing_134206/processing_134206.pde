
void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed) {
    fill(#33af09);    //Verde
stroke(#fb8000);  //Naranja;
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
