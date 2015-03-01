
void setup() {
  size(1200, 800);
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  strokeWeight(3);
  strokeCap(ROUND);
}

void draw() {
}

void mouseClicked() {
  background(255);
  for (int x=0; x<=width; x+=50) {
    for (int y=0; y<width; y+=50) {
      pushMatrix();
      translate(x, y);
      drawAll();
      popMatrix();
    }
  }
}

/* void drawAll() {
  drawOne();
  drawTwo();
  drawThree();
  drawFour();
}
*/

void drawOne() {
  int c = int(random(25, 156));
  stroke(24, 157, c);
    ellipse(25, 25, 40, 40);
}

void drawTwo() {

    rect(25, 25, 20, 20);

}

void drawAll() {
  int r = int(random(1, 7));
  switch(r) {
  case 1:
    drawOne();
    break;
  case 2:
    drawTwo();
    break;
  default:
    drawOne();
    break;
  }
  stroke(0);
}
