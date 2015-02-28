
void setup () {
  size (200, 200);
  }

void draw () {
  background (255);
  rectMode (CENTER);
  stroke (255, 255, 0);
  fill (255, 255, 0);
  rect (mouseX, mouseY, 100, 10);
  stroke (0);
  fill (0);
  ellipse (mouseX, mouseY+10, 75, 100);
  stroke (200);
  fill (255, 0, 0);
  ellipse (mouseX-25, mouseY+60, 25, 25);
  stroke (150);
  fill (255, 0, 0);
  ellipse (mouseX+25, mouseY+60, 25, 25);
  fill (150);
  ellipse (mouseX, mouseY-50, 50, 50);
  fill (0, 255, 0);
  stroke (0);
  ellipse (mouseX-5, mouseY-60, 10, 10);
  ellipse (mouseX+5, mouseY-60, 10, 10);
  println("breng me naar je leider");
}


