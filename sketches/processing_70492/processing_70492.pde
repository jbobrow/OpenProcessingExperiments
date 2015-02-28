
// Creating instances of our object called "Thingy"
import processing.video.*;
float bX;
float bY;

Capture video;

Thingy[] thingyArray = new Thingy[20];

void setup() {
  size (300, 300);
  background(0);
  smooth();
  noStroke();

  video = new Capture(this, width, height, 30);

  // Create instances of Thingy class - Allocates memory for the objects
  for (int i=0 ; i<thingyArray.length ; i++) {
    thingyArray[i] = new Thingy(10, 10, 50, 50, color(random(255), random(255), random(255), random(125,225)), random(width), random(height));
  }
}

void draw() {

    background(0);
    for (int i=0 ; i<thingyArray.length ; i++) {
      thingyArray[i].updateThingy(thingyArray[i].posX, thingyArray[i].posY);
      thingyArray[i].drawThingy(thingyArray[i].posX, thingyArray[i].posY);
    }
    fill(255, 204, 0, 128);
    ellipse(bX, bY, 10, 10); 
  
  }


