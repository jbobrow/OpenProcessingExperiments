



void setup() {
  background(0);
  size(600, 600);
  colorMode(HSB, 300);
  noStroke();
}

boolean drawOn;
int size = 0;
int col = 0;

void draw() {
  if (mousePressed && (mouseButton == LEFT)) {
    drawOn = true;
  }
  if (mousePressed && (mouseButton == RIGHT)) {
    clear();
    drawOn = false;
    col = 0;
    size = 0;
  }

  if (drawOn) {
    drawCircles(col, size);
    col++;
    size++;
  }
}


void drawCircles(int col, int size) {

  fill(col, 300, 300);
  ellipse(mouseX, mouseY, size, size);
}




