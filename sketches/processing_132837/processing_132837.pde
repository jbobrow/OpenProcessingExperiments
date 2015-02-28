
void setup () {
  size (500, 400);
}

void draw () {
  background(4, 98, 11);
  stroke(0);
  fill(188, 179, 6);
 triangle(mouseX, mouseY - 50, mouseX - 40, mouseY + 25, mouseX + 40, mouseY + 25);
 stroke(0);
 fill(4, 98, 11);
triangle(mouseX, mouseY + 25, mouseX - 20, mouseY - 13, mouseX + 20, mouseY - 13);
if (mousePressed) {
 background(0);
   stroke(255, 255, 255);
  fill(188, 179, 6);
 triangle(mouseX, mouseY - 50, mouseX - 40, mouseY + 25, mouseX + 40, mouseY + 25);
 stroke(255, 255, 255);
 fill(0);
triangle(mouseX, mouseY + 25, mouseX - 20, mouseY - 13, mouseX + 20, mouseY - 13);
}
}




