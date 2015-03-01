
void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  fill(0);
  ellipse(250, 250, 250, 250);
  int x = 125;
  while (x < width) {
    fill(255);
    triangle(x, 250, x+10, 250, x+5, 260);
    triangle(x, 250, x+10, 250, x+5, 240);
    x +=10;
    if (x > 370) {
      stroke(255);
    }
  }
  fill(0);
  stroke(255);
  draweyes(mouseX, mouseY);
  rect(210, 350, random(30), random(300), 7);
  rect(280, 350, random(30), random(300), 7);
}

void draweyes(int x, int y) {
  stroke(0);
  ellipse(x, y, 40, 40);
  stroke(0);
  line(x, y, 180, 200);
  ellipse(x+250, y, 40, 40);
  stroke(0);
  line(x+250, y, 250, 200);
  fill(255);
  ellipse(x, y, 20, 20);
  ellipse(x+250, y, 20, 20);
  fill(0);
  ellipse(x, y, 5, 5);
  ellipse(x+250, y, 5, 5);
}
