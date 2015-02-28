
// by Andres Wanner, based on Triangle by ... and Twk Triangle by ...


int[] xCoordinates = new int[3];
int[] yCoordinates = new int[3];
int counter = 0;

void setup() {
  size(400, 400);
  background(128);
}



void draw() {
  if(counter > 1 && counter % 3 == 0) {
      triangle(xCoordinates[0], yCoordinates[0], xCoordinates[1], yCoordinates[1], xCoordinates[2], yCoordinates[2]);
  }
  
  if (millis()%50 < 10) {
   xCoordinates[counter%3] = mouseX;
  yCoordinates[counter%3] = mouseY;
  fill(random(255));
  counter++;
  }
}

 
