
int startX;
int startY;

void setup() {
  size(screen.width - 100, screen.height - 100);
  smooth();
  background(0);
}

//void draw() {
//  if (mousePressed) {
//    fill(random(0,255), random(0,255), random(0,255));
//    rect(mouseX - 25, mouseY - 25, 50, 50);
//  } else {
//    fill(0);
//    ellipse(mouseX, mouseY, 50, 50);
//  }
//}

void draw() {
  if (mousePressed) {
    stroke(255);
    drawIt(abs(mouseX - startX), abs(mouseY - startY), false, 0);
  }
}

void mousePressed() {
  startX = mouseX;
  startY = mouseY;
}

void mouseReleased() {
  background(0);
  int xlength = abs(mouseX - startX);
  int ylength = abs(mouseY - startY);
  stroke(random(0,255));
  drawIt(xlength, ylength, true, 0);
}

void drawIt(int xlength, int ylength, boolean randomize, int solid) {
  if (xlength == 0) return;
  if (ylength == 0) return;
  int i;
  int j;
  for (i = (startX % xlength) - xlength; i < width; i += xlength) {
    for (j = (startY % ylength) - ylength; j < height; j += ylength) {
      if (randomize) {
        fill(random(0,255), random(0,255), random(0,255));
      } else {
        fill(solid);
      }
      rect(i, j, xlength, ylength);
    }
  }
}
  

