
float x, y, x1, y1, x2, y2;
int triangleAmount;
boolean stop;

void setup() {
  size(400, 400);
  smooth();
  background(0);
  stop = false;
  triangleAmount=150;
}

void draw() {
  background(0);
  drawTriangles();
}

void drawTriangles() {
  for (int i=1; i<triangleAmount; i+=1) {
    fill(random(255), random(255), random(255));
    float r = map(i, 1, triangleAmount, 0, width/2);
    x = random(mouseX-width/2+r, mouseX+width/2-r);
    x1 = random(mouseX-width/2+r, mouseX+width/2-r);
    x2 = random(mouseX-width/2+r, mouseX+width/2-r);
    y = random(mouseY-height/2+r, mouseY+height/2-r);
    y1 = random(mouseY-height/2+r, mouseY+height/2-r);
    y2 = random(mouseY-height/2+r, mouseY+height/2-r);
    triangle(x, y, x1, y1, x2, y2);
  }
}

void keyPressed() {
  stop = !stop;
  if (stop == false) {
    noLoop();
  }
  if (stop == true) {
    loop();
  }
}
