
Spot [] [] mySpot = new Spot[30] [30]; 


void setup() {
  size(600, 600);
  smooth();

  for (int i=0; i<mySpot.length; i++) {
    for (int j=0; j<mySpot.length; j++) {
      mySpot [i] [j] = new Spot(30 * i, 30*j, 20);
    }
  }
  colorMode(HSB);
}


void draw() {
  background(0);

  for (int i=0; i<mySpot.length; i++) {
    for (int j=0; j<mySpot.length; j++) {
      fill(mySpot[i][j].mouseDist, 200,200);
      mySpot[i][j].update(mouseX, mouseY);
      mySpot[i][j].display();
    }
  }
  
  
}


