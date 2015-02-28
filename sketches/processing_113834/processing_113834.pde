

int diameter = 100;
int positionX = 50;

void setup() {
  size(400, 400);
}

void draw() {
  background(227, 209, 185);
  noStroke();

  if (positionX <= width-diameter/2) {
    fill(165, 106, 115);
    positionX++;
  }
  else //if (positionX < 200) {
  // }

  fill(255);
  ellipse(positionX, height/2, diameter, diameter);
}



