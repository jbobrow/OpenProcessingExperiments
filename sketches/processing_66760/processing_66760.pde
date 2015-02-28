
int xPos;
int yPos;

void setup() {
  size(600, 600);
  background(255);
  smooth();
  println("Drawing with pixels - Press the different keys to draw colored pixels \n \n" + "r = red \n" + "b = blue \n" + "l = black \n"+ "y = yellow \n" + "c = brown \n" + "g = green");
}

void draw() {
  line(xPos+25, yPos, xPos+25, yPos+600);

  for (int i =0 ; i< 600; i = i+25) {
    line(xPos+i, 0, xPos+i, 600);
    line(xPos, yPos+i, 600, yPos+i);
  }
}

void keyPressed() {
  if (key == 'r') {
    rectMode(CORNER);
    fill(255, 0, 0);
    rect(mouseX, mouseY, 25, 25);
  }
  if (key == 'b') {
    rectMode(CORNER);
    fill(0, 0, 255);
    rect(mouseX, mouseY, 25, 25);
  }
  if (key == 'g') {
    rectMode(CORNER);
    fill(0, 255, 0);
    rect(mouseX, mouseY, 25, 25);
  }
  if (key == 'y') {
    rectMode(CORNER);
    fill(255, 255, 0);
    rect(mouseX, mouseY, 25, 25);
  }
  if (key == 'l') {
    rectMode(CORNER);
    fill(0);
    rect(mouseX, mouseY, 25, 25);
  }
  if (key == 'c') {
    rectMode(CORNER);
    fill(147, 96, 0);
    rect(mouseX, mouseY, 25, 25);
  }
}


