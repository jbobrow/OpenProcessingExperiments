
//OK, now some compound (or embedded) forLoops

int numberDown = 5;
int numberAcross = 5;
int sizer;

void setup() {
  size(500, 500);
  smooth();
  sizer = 100;
}

//NOTE:  tiny code, big result . . .

void draw() {
  noStroke();
  ellipseMode(CORNER);
  background(130, 255, 0);

  //Four lines, that's it!
  for (int i = 0; i < numberDown; i++) { //here we count up on the X-axis
    for (int j= 0; j < numberAcross; j++) { //here we count up on the Y-axis
      //we have to offset the mouseOver hotspot by subtracting size/2 due to calling ellipseMode(CORNER) above
      if (mouseOver(mouseX - sizer/2, mouseY - sizer/2, i * sizer, j * sizer, sizer)) {
        fill(20, 255, 120);
      }
      else {
        fill(23, 89, 200, i * 50); //your iterator is dynamic, it changes, so use it.
      }
      ellipse(i * sizer, j * sizer, sizer, sizer);
    }
  }
}

boolean mouseOver(int cursorX, int cursorY, int posX, int posY, int size) {
  float distance = dist(cursorX, cursorY, posX, posY);
  if (distance < sizer/2) {
    return true;
  }
  else {
    return false;
  }
}



