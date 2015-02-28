
void setup()
{
 size(700, 600); 
 background(0);
 resetpad();
}

int Color = 0;
int r = 255;
int g = 0;
int b = 0;

void draw() {
  if (mousePressed) {
    if (mouseY > 50) {
      stroke(r, g, b);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
  if (keyPressed) {
  if (key == 'n' || key == 'N') {
      resetpad();
    }
  }
  fill(0);
  rect(0, 0, 700, 50);
  fill(255);
  text("Welcome To Drawing Pad, To Clear Pad Press 'N', To Draw Hold Mouse,", 10, 20);
  text("Created By Timothyji 2013, Change Color Click On Box ----------------------------------------->", 10, 40);
  drawColor(r, g, b);
}

void mousePressed() {
  if (mouseX > 502) {
    if (mouseX < 526) {
      if (mouseY > 14) {
        if (mouseY < 38) {
          changecolor();
        }
      }
    }
  }
}

void changecolor() {
  if (Color == 0) {
    drawColor(0, 0, 0);
    Color = 1;
  } else if (Color == 1) {
    drawColor(0, 0, 255);
    Color = 2;
  } else if (Color == 2) {
    drawColor(255, 255, 0);
    Color = 3;
  } else if (Color == 3) {
    drawColor(0, 255, 0);
    Color = 4;
  } else if (Color == 4) {
    drawColor(255, 10, 230);
    Color = 5;
  } else if (Color == 5) {
    drawColor(255, 0, 0);
    Color = 6;
  } else if (Color == 6) {
    drawColor(255, 165, 0);
    Color = 0;
  }
}

void resetpad() {
  background(0);
  fill(255);
  text("Welcome To Drawing Pad, To Clear Pad Press Any Key. To Draw Hold Mouse", 10, 20);
  text("Created By: Timothy Ji - 2013", 10, 40);
  fill(255);
  rect(0, 50, 700, 550);
  drawColor(r, g, b);
}

void drawColor(int xr, int xg, int xb) {
  r = xr;
  g = xg;
  b = xb;
  fill(255);
  rect(498, 10, 34, 34);
  fill(r, g, b);
  rect(504, 16, 22, 22);
}
    


