
int shapeN = 0;
float col = 0, col2 = 0, col3 = 0;

void setup() {
  size(200, 200);
  background(0);
}

void draw() {
  fill(col, col2, col3, 2);
  rect(0, 0, width, height);
  fill(random(0, 255), random(0, 255), random(0, 255));
  if (pmouseX == 0 || mouseX == 0)
    return;
  if (dist(mouseX, mouseY, pmouseX, pmouseY) > 10)
    rect(pmouseX, pmouseY, 20, 20);
  fill(col, col2, col3);
  switch(shapeN) {
  case 0:
    ellipse(mouseX, mouseY, 20, 20);
    break;
  case 1:
    rect(mouseX, mouseY, 20, 20);
    break;
  case 2:
    triangle(round(mouseX), round(mouseY - 20), round(mouseX - 10), round(mouseY), round(mouseX + 10), round(mouseY + 10));
    break;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    shapeN++;
    if (shapeN == 3)
      shapeN = 0;
  } else {
    col = random(0, 255);
    col2 = random(0, 255);
    col3 = random(0, 255);
  }
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(0, 0, 200, 200);
  }
}

