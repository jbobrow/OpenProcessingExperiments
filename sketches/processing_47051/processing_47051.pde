
void setup() {
  size(900, 400);
  background (147, 112, 219);
  noStroke();
  fill (184, 134, 11);
  ellipse (700, 200, 1000, 500);
  fill (238, 221, 130);
  ellipse (75, 200, 150, 400);
  ellipse (700, 200, 900, 400);
  fill (255, 215, 0);
  ellipse (75, 200, 100, 350);
  fill (255, 255, 0);
  ellipse (75, 200, 50, 300);
}

void draw () {
  fill(mouseX, mouseY, 0);
  ellipse (700, 200, 50, 400);
  ellipse (700, 200, 400, 50);
  fill (0, mouseX / 2, mouseY / 4);
  rect (150, 0, 150, 400);
  fill (0, mouseX / 4, mouseY / 4);
  rect (450, 0, 150, 400);
  fill (0, mouseX / 2, mouseY / 3);
  rect (750, 0, 150, 400);
  fill (0, mouseX / 3, mouseY / 2);
  rect (1050, 0, 150, 400);
  fill (0, mouseX / 5, mouseY / 3);
  rect (0, 0, 5, 400);
  fill (mouseX / 2, mouseY / 2, 0);
  ellipse (75, 200, 30, 60);
  ellipse (75, 200, 60, 30);
}


