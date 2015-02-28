
int[] xCoordinates = new int[3];
int[] yCoordinates = new int[3];
int counter = 0;

void setup() {
  size(400, 400);
  background(0);
}



void draw() {
  if(counter > 1 && counter % 3 == 0) {
      triangle(xCoordinates[0], yCoordinates[0], xCoordinates[1], yCoordinates[1], xCoordinates[2], yCoordinates[2]);
  }
}

void mouseClicked() {
  xCoordinates[counter%3] = mouseX;
  yCoordinates[counter%3] = mouseY;
  fill(random(255));
  counter++;
}
