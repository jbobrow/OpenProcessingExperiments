
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65365*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
int screen;

void setup() {
  size(500,500);
}

void draw() {
  if (screen==1) {
    draw1();
    return;
  }
  background(0);
  textSize(36);
  text("PLAY",150,200);
  text("INSTRUCTIONS",150,300);
}

void mousePressed() {
  if (screen==1) {
    mousePressed1();
    return;
  }
  if (abs(mouseY-200)<20) {
    screen=1;
    setup1();
    return;
  }
  if (abs(mouseY-300)<20) screen=2;
}

