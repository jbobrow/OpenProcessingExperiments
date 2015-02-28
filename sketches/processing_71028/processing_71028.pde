
Spot [][] mySpot = new Spot[30][30];  // we delcare the array of objects

// this means: use the class Spot, make it an array called mySpot. Create an array of 30 objects using the class Spot.
// in short: create an array of "Spots" with 30 elements.

void setup() {
  size(600, 600);
  smooth();

  for (int i=0; i<mySpot.length; i++) {
    for (int j=0; j<mySpot.length; j++) {
      mySpot [i][j]= new Spot(30 * i, 30*j, 20);
      // We assign the elements of the array, and we give it some properties
    }
  }
}


void draw() {
  background(0);

  for (int i=0; i<mySpot.length; i++) {
    for (int j=0; j<mySpot.length; j++) {
      fill(255,mySpot[i][j].mouseDist,0);
      mySpot[i][j].update(mouseX, mouseY);//method_update
      mySpot[i][j].display();//method_display
    }
  }
}


