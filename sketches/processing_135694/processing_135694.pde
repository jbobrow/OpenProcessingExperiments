
int circleSize = 0;
int circleX = 40;
int circleY = 40;

void setup() {
  size (200,200);
}

void draw() {
    random(circleSize);
  background (100);
  stroke (255);
  fill (175);
  ellipse (mouseX,mouseY,circleX,circleY);
  random(100);
  circleX= circleX + 1;
  circleY= circleY + 1;
}

