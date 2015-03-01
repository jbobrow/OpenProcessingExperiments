
//Bad Plaid, jeg coding for artists sandbox
//for Loops using distance to change size of object according
//to how close the mouse is to the object . . .

float sizeE, sizeR;
float theDistance; //the distance between the center of the object and the mouse

void setup() {
  size(600, 600);
  sizeE = 40;
  sizeR = 45;
  smooth(8);
}

void draw() {
  background(233, 145, 67);
  noStroke();
  for (int i = 0; i < width/sizeE; i++) {
    for (int j = 0; j < height/sizeE; j++) {

      theDistance = dist(mouseX, mouseY, sizeE * i + sizeE/2, sizeE * j + sizeE/2);

      //the map() function allows you to map one scale to another scale
      //such as the distance from an object to the size of that object
      float rectSize = map(theDistance, 0, 1000, 10, sizeR);
      float ellipseSize = map(theDistance, 1000, 0, 10, sizeE);

      ellipseMode(CENTER);
      fill(255, 120); //notice, used the hex notation here
      ellipse(sizeE * i + sizeE/2, sizeE * j + sizeE/2, ellipseSize, ellipseSize);

      fill(255, 0, 0, 120);
      rectMode(CENTER);
      rect(sizeE * i + sizeE/2, sizeE * j + sizeE/2, rectSize, rectSize);
    }
  }
}

