
// Creating instances of our object called "Thingy"

Thingy[] thingyArray = new Thingy[200];

void setup() {
  size (600, 600);
  background(0);
  smooth();
  noStroke();

  // Create instances of Thingy class - Allocates memory for the objects
  for (int i=0 ; i<thingyArray.length ; i++) {
    thingyArray[i] = new Thingy(10,10, 50, 50, color(random(255),random(255),random(255),random(255)), random(width), random(height));
  }
}

void draw() {
  background(0);
  for(int i=0 ; i<thingyArray.length ; i++){
  thingyArray[i].updateThingy(thingyArray[i].posX,thingyArray[i].posY);
  thingyArray[i].drawThingy(thingyArray[i].posX,thingyArray[i].posY);
  }
}


