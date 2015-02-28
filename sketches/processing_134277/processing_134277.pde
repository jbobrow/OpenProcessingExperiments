
void setup() {
  size(500, 500);
}
void draw() {
  if (mousePressed) {
   fill(#33af09);    //Verde
stroke(#fb8000);  //Naranja;
  } else {
    fill(800,50,130);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
