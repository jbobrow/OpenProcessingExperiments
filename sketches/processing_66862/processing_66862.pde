
float x1, y1, x2, y2, x3, y3;

void setup() {
  smooth();
  size(500, 500);
  background(0);
}

void draw() {
  setTris();

  if (mousePressed==true)
  {
    drawTris();
  }
}
void keyPressed() {
  if (keyCode == ENTER)
  {
    background(0);
  }
}
void setTris() {
  x1=random(mouseX-random(100), mouseX+random(100));
  y1=random(mouseY-random(100), mouseY+random(100));
  x2=random(x1-random(mouseX/13, mouseX/10), x1+random(mouseX/12, mouseX/8));
  y2=random(y1-random(mouseY/16, mouseY/9), y1+random(mouseY/15, mouseY/9));
  x3=random(x1-random(mouseX/14, mouseX/7), x1+random(mouseX/13, mouseX/7));
  y3=random(y1-random(mouseY/13, mouseY/10), y1+random(mouseY/13, mouseY/9));
}

void drawTris() {
  strokeWeight(0.1);
  fill(random(256), random(256), random(256));
  triangle(x1, y1, x2, y2, x3, y3);
}


