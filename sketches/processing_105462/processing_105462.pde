
int sx;
int sy;

void setup () {
  size(600, 600);
  background(255);
}
void draw() {
  //  if (mousePressed == true) {
  smooth();
  for (int i = 0; i < 10; i++) {
    drawsquare(int(random(width/6)), int(random(height/6)), int(random(height/6)));
    drawsquare2(int(random(width/6)), int(random(height/6)), int(random(height/6)));
    drawsquare3(int(random(width/6)), int(random(height/6)), int(random(height/6)));
    drawsquare4(int(random(width/6)), int(random(height/6)), int(random(height/6)));
    drawsquare5(width/2, height/2, int(random(height/2)));
  }

  for (int i = 1; i < width; i++) {
    //xPosition, yPosition, and diameter all = i^2
    drawCircle(i*i, i*i, int(random(height/2)));
  }
}


void drawCircle(float circX, float circY, int diameter) {

  noFill();

 
  strokeWeight(2);
  ellipse(circX, circY, diameter, diameter);
}


void drawsquare5(int x, int y, int size) {

  fill(255, 220);

  ellipse(x, y, size, size);
}
void drawsquare(int x, int y, int size) {
  background(0);
  fill(255, 120);

  ellipse(mouseX - x, mouseY - y, size, size);
}

void drawsquare2(int x, int y, int size) {

  fill(255, 120);
  ellipse(mouseX + x, mouseY + y, size, size);
}

void drawsquare3(int x, int y, int size) {

  fill(255, 120);
  ellipse(mouseX + x, mouseY - y, size, size);
}

void drawsquare4(int x, int y, int size) {

  fill(255, 120);
  ellipse(mouseX - x, mouseY + y, size, size);
}
