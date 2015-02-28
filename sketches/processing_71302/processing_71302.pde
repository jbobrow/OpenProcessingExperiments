
Spot [] [] mySpot = new Spot[30] [30]; 


void setup() {
  size(600, 600);
  smooth();
  translate(width/2,height/2);

  for (int i=0; i<mySpot.length; i++) {
    for (int j=0; j<mySpot.length; j++) {
      mySpot [i] [j] = new Spot(i*random(width)*0.2, j*random(height)*0.2, 20);
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


