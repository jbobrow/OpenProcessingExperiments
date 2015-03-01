
int value=0;

void setup() {
  size(600, 600);
  background(219,183,120);
}

void draw() {

  for (int i=30; i<=570; i+=30) {
    line(30, i, 570, i);
    line(i, 30, i, 570);
  }
  fill(0);
  ellipse(width/2, height/2, 5, 5);
  ellipse(120, 120, 5, 5);
  ellipse(width-120, 120, 5, 5);
  ellipse(120, width-120, 5, 5);
  ellipse(width-120, height-120, 5, 5);
}

void mouseClicked() {
  fill(value);
  ellipse(mouseX, mouseY, 20, 20);
  if (value==0) {
    value=255;
  } else {
    value=0;
  }
}

void mousePressed() {
  if (mouseButton==RIGHT) {
    setup();
  }
}



