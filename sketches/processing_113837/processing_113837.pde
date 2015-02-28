
int diameter = 10;
int positionX = 50;
int switchX = 0;

void setup() {
  size(400, 400);
}

void draw() {
  background(227, 209, 185);
  noStroke();

  if (positionX == width-diameter/2) {
    switchX = 1;
  }

  if (positionX == diameter/2) {
    switchX = 0;
  }

  if (switchX == 0) {
    positionX = positionX + 5;

  }
  else if (switchX == 1) {
    positionX--;
  }

  fill(165, 106, 115);
  ellipse(positionX, positionX, diameter, diameter);
}



