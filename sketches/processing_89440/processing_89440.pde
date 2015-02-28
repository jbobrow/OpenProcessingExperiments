
void setup() {

  size (640, 480);
 textFont(createFont("Georgia", 32));
  smooth();
  noCursor();
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
}


void draw() {
  drawSketch(32);
}


void mousePressed() {
  drawSketch(40);
}

void drawSketch(int sizeOfText) {
  float mx = constrain(mouseX, 250, 390);
  float my = constrain(mouseY, 120, 345);

  background(0);

  fill(255);
  rect(width/2, height/2, 250, 250);

  fill(0);
  textSize(sizeOfText);
  text("trapped", mx, my);

  rect(220, 250, 4, 350);
  rect(260, 250, 4, 350);
  rect(300, 250, 4, 350);
  rect(340, 250, 4, 350);
  rect(380, 250, 4, 350);
  rect(420, 250, 4, 350);
}



