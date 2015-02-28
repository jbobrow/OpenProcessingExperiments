
void setup () {
  size (700, 700);
  background (0, 0, 0);
  smooth();
}


void draw() { 

  fill(180, 51, 15, 25);
  quad(mouseX, 330, 100, 400, mouseX, mouseY, 200, 500);
  fill(206, 113, 25, 25);
  quad(100, 100, 50, 400, mouseX, mouseY, 200, 230);
  fill(89, 111, 6, 25);
  quad(600, 50, 10, 200, 100, mouseY, mouseX, 230);
}


