
int a; //this is because it has to be a formular to put in to int int

void setup() {
  size(512, 512);
  smooth();
  background(0);
}

void draw() {

  a=(mouseY-mouseX)/4;
  ourFirstFunction(5, a, 4);
}

void ourFirstFunction(int xRate, int z, int k) {
  noStroke();

  for (int xPos = 0; xPos <= width; xPos+=xRate) {
    for (int yPos = 0; yPos <= width; yPos+=xRate) {
      fill(255-xPos, 255-yPos, 255-z, 0+k);
      ellipse(xPos, yPos, 10, 10);
    }
  }
}


