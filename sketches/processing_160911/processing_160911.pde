
int numOfRings = 12;
int sizeOfRings = 15;
int xPos = 200;
int yPos = 200;
int stroke = 1;

void setup() {
  size(800, 600);
  smooth();
  background(0);
}

void draw() { 
  background(0);
  stroke(mouseX);
  strokeWeight(stroke);
  noFill();
  bullseye();

}
void bullseye() {
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      for (int z=0; z < numOfRings; z++) {
        ellipse(i*xPos+xPos/2, j*yPos+yPos/2, z*sizeOfRings, z*sizeOfRings);
      }
    }
  }
}

/* bullseyes*/
