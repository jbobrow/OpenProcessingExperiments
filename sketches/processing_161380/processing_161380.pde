

import processing.pdf.*;

int numOfRings = 16; /*really like 15 but prob won't print well*/
int sizeOfRings = 100;
int xPos = 200;
int yPos = 200;
int stroke = 1;
int opacity = 255;

void setup() {
  size(4000, 12000, PDF, "linemess.pdf");
  background(0);
}

void draw() { 
  background(0);
  noFill();
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 100; j++) {
      for (int z=0; z < numOfRings; z++) {
        opacity = int(255 - ((i+1)*(j+1))*random(0, 1)) - int(j*random(0,100));
        stroke(255, 255, 255, opacity);
        ellipse(i*xPos+xPos/2, j*yPos+yPos/2, z*sizeOfRings, z*sizeOfRings);
      }
    }
  }
  println("DONE");
  exit();
} 

