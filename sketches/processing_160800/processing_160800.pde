
void setup() {
  size(500, 500);
}
void draw() {
  background(255);
  drawStickfigure(mouseX, mouseY);
  if (mousePressed == true) {
    coloredStickfigure(mouseX, mouseY);
  }
}

void drawStickfigure(int x, int y) {
  fill(0);
  ellipse(width*.5, height*.25, 70, 70);
  strokeWeight(10);
  line(width*.5, height*.30, width*.5, height*.65);
  line(width*.5, height*.35, width*.65, height*.45);
  line(width*.5, height*.35, width*.35, height*.45);
  line(width*.5, height*.65, width*.40, height*.82);
  line(width*.5, height*.65, width*.60, height*.82);
}
void coloredStickfigure(int x, int y) {
  fill(random(255), 100, 255, 50);
  ellipse(width*.5, height*.25, 70, 70);
  strokeWeight(10);
  stroke(random(255), 100, 255, 50);
  line(width*.5, height*.30, width*.5, height*.65);
  line(width*.5, height*.35, width*.65, height*.45);
  line(width*.5, height*.35, width*.35, height*.45);
  line(width*.5, height*.65, width*.40, height*.82);
  line(width*.5, height*.65, width*.60, height*.82);
}

