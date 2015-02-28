
/*
Crowds and Grid
 Engin Ayaz, Oct 27 2011 
 
 This conceptual sketch shows how crowd movement in a space
 can affect a lighting scheme. 
 
 Wishlist:
 - For mouseClicked in the same location, add more randomness to behavior
 when mouse is moved, start from less random state again.
 - Define structural edges for the individual pedestrians.
 - Make the beam grid parametric so that it can be drawn at any scale. 
 - Embed realistic flocking and flow behavior to crowds.
 */

// initializes the structure class
Structure structure;

// sets the initial structure grid
int cols = 27;
int rows = 8;

// creates a 2D array to pass on luminosity values to each rectangle
int [][] lightGridR = new int [cols][rows];
int [][] lightGridG = new int [cols][rows];

// determines light falloff levels from a given pedestrian.
// 1 implies relatively slow fall-off, 2 implies very sharp fall-off.
float lightFalloffFactor=1.15;

// stores pedestrians
ArrayList pedestrians;

// stores the arraylist size of pedestrians
int pedTotal;

// determines the relative distance of the pedestrian to each item on the grid
float pedDistRatio;

// scales the size of the structure to fit the screen
float scalingFactor = 0.45;

// removes pedestrians after they leave the screen. Based on pixels. 
// 0 implies that they are deleted right when they leave the screen.
// 100 implies that they are deleted when they exceed the screen border by 100 pixels, etc.
float removalBorder = 75;

// determines extent of color flickering 
// 0 implies no flicker, 15 or 20 implies a lot of flicker
float colorRandomness = 4;

void setup() {
  size (792, 560);
  frameRate(50);
  smooth();
  structure = new Structure();
  pedestrians = new ArrayList();
}

void draw() {
  // the push/pull-matrix is used, because the drawn structure
  // had to be scaled down for aesthetic purposes. 
  pushMatrix();
  scale(scalingFactor);
  background(240);
  drawStructureWithColors();
  popMatrix();
  drawCrowds();
}

// creates new pedestrians on screen
void mousePressed() {
  //PVector newPedLoc = new PVector(random(width), random(height));
  PVector newPedLoc = new PVector(mouseX, mouseY);
  pedestrians.add(new Pedestrian(newPedLoc));
}

//void keyPressed(){
//  exit();
//}

// draws both the static grid structure in black
// as well as the dynamic colored squares
void drawStructureWithColors() {
  // draw the rectangular beam framework
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      noFill();
      structure.drawBeams(i*65, j*155);

      // determines each pedestrians' distance to each rectangle
      // uses this distance, along with number of pedestrians
      // to determine colors within each rectangle
      float lightRectCenterX = (i*65)+(65/2);
      float lightRectCenterY = (j*155)+(155/2);
      float pedDist = 0.0;
      pedTotal = pedestrians.size();
      for (int k = 0; k < pedTotal; k++) {
        Pedestrian ped1 = (Pedestrian) pedestrians.get(k);
        float ped1Dist = dist (ped1.location.x/scalingFactor, ped1.location.y/scalingFactor, lightRectCenterX, lightRectCenterY);
        pedDist += ped1Dist;
      }

      int maxDistance = screenDiagonal();

      pedDistRatio = pedDist / (pedTotal * maxDistance);

      float lightR = map(pow(pedDistRatio, lightFalloffFactor), 0, 1, 0, 255);
      if (lightR > (255-colorRandomness)) {
        lightR=(255-colorRandomness);
      }

      float lightG = map(pow(pedDistRatio, lightFalloffFactor), 0, 1, 0, 156);
      if (lightG > (156-colorRandomness)) {
        lightG=(156-colorRandomness);
      }

      lightGridR[i][j] = int(lightR);
      lightGridG[i][j] = int(lightG);

      if (pedestrians.size()>0) {
        structure.lightRect(i*65, j*155, lightGridR[i][j]+(int)random(-colorRandomness, colorRandomness), 
        lightGridG[i][j]+(int)random(-colorRandomness, colorRandomness));
      }
      else {
        structure.lightRect(i*65, j*155, (int)random(200, 210), (int)random(120, 130));
      }
    }
  }
}

// draws multiple pedestrians as part of an arraylist
// and removes them if the pedestrians go off-the-screen
void drawCrowds() {
  for (int m = pedTotal-1; m>=0; m--) {
    Pedestrian ped1 = (Pedestrian) pedestrians.get(m);
    ped1.drawPed();
    PVector pedSpeed = new PVector(random(-m, m)+random(-1, 1), random(-m, m)+random(-1, 1));
    ped1.pedMove(pedSpeed);
    if (ped1.location.x > width+removalBorder || ped1.location.x+removalBorder  < 0 || 
      ped1.location.y > height+removalBorder || ped1.location.y+removalBorder  < 0) { 
      pedestrians.remove(m);
    }
  }
}

// returns diagonal distance between corners of screen
int screenDiagonal() {
  int diagonalScreen = (int)sqrt(sq(width)+sq(height));
  return diagonalScreen;
}


