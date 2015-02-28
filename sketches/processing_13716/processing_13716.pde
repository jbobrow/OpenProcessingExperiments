
void setup() {
  size(900, 600);
  background(90,40,201);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(253,0,129);
     ellipse(mouseX, mouseY, 60, 60);
  } else {
    fill(2000);
  }
  ellipse(mouseX, mouseY, 110, 110);
  fill(#FFFC71);
  ellipse(mouseX, mouseY, 60, 60);
  fill(#FFFFC1);
  ellipse(mouseX, mouseY, 40, 40);
  fill(#22AF99);
   ellipse(mouseX, mouseY, 41, 41);
   ellipse(mouseX, mouseY, 42, 42);
   ellipse(mouseX, mouseY, 43, 43);
   ellipse(mouseX, mouseY, 44, 44);
   ellipse(mouseX, mouseY, 45, 45);
  ellipse(mouseX, mouseY, 20, 20);
  ellipse(mouseX, mouseY, 8, 8);
   ellipse(mouseX, mouseY, 7, 7);
    ellipse(mouseX, mouseY, 6, 6);

}


