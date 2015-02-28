
float xpos = 0;
float ypos = 0;
float xpos2 = width;
float ypos2 = width;

void setup() {
  size(800, 500);
  smooth();
  background(255);
}
void draw() {

  xpos = xpos +8;
  ypos = ypos +2;

  fill(random(100, 255), 0, 0);

  if (xpos > width) {
    xpos = 0;
  }
  if (ypos > height) {
    ypos = 0;
  }

  if (mousePressed) {
    strokeWeight(random(.5, 3));
    ellipse(xpos, ypos, mouseX+mouseY, mouseX+mouseY);
  }
  else {

    ellipse(xpos, ypos, 5, 5);
  }

  fill(0, 0, random(100, 255));

  xpos2 = xpos2 -8;
  ypos2 = ypos2 -2;

  if (xpos2 < 0) {
    xpos2 = width;
  }
  if (ypos2 < 0) {
    ypos2 = height;
  }
  if (mousePressed) {
    strokeWeight(random(0, 5));
    ellipse(xpos2, ypos2, mouseX+mouseY, mouseX+mouseY);
  }
  else {
    ellipse(xpos2, ypos2, 5, 5);
  }
  if (keyPressed) {
    background(255);
  }
}


