

//LaceUnit[][] tile;

int resolution = 100;//dimension of squares
int tileLoc = 9; //tile identity

LaceUnit[][]tile = new LaceUnit[tileLoc][tileLoc]; // should this be: LaceUnit[][] tile = new LaceUnit[tileLoc+1][tileLoc+1];

void setup() { 
  size(900, 900);
  for ( int tileLoc = 0; tileLoc < 9; tileLoc++) {
    tile[tileLoc][0].ptile = loadImage("Square" + nf(tileLoc+1, 2)+".jpg");
  }
  for ( int tileLoc = 0; tileLoc < 9; tileLoc++) {
    tile[tileLoc][1].ptile = loadImage("Square" + nf(tileLoc+10, 2)+".jpg");
  }
  for ( int n = 0; n < 9; n++) {
    tile[tileLoc][2].ptile = loadImage("Square" + nf(tileLoc+19, 2)+".jpg");
  }
  for ( int n = 0; n < 9; n++) {
    tile[tileLoc][3].ptile = loadImage("Square" + nf(tileLoc+28, 2)+".jpg");
  }
  for ( int tileLoc = 0; tileLoc < 9; tileLoc++) {
    tile[tileLoc][4].ptile = loadImage("Square" + nf(tileLoc+37, 2)+".jpg");
  }
  for ( int tileLoc = 0; tileLoc < 9; tileLoc++) {
    tile[tileLoc][5].ptile = loadImage("Square" + nf(tileLoc+46, 2)+".jpg");
  }
  for ( int tileLoc = 0;  tileLoc < 9; tileLoc++) {
    tile[tileLoc][6].ptile = loadImage("Square" + nf(tileLoc+55, 2)+".jpg");
  }
  for ( int tileLoc = 0; tileLoc < 9; tileLoc++) {
    tile[tileLoc][7].ptile = loadImage("Square" + nf(tileLoc+64, 2)+".jpg");
  }
  for ( int tileLoc = 0; tileLoc < 9; tileLoc++) {
    tile[tileLoc][8].ptile = loadImage("Square" + nf(tileLoc+73, 2)+".jpg");
  }
}

void draw() {
  for (int xpos = 0; xpos < 9; xpos++) {
    for (int ypos = 0; ypos < 9; ypos++) {
      tile[xpos][ypos] = new LaceUnit(xpos, ypos); //HOW DO I GET THIS TO WORK... WHERE SHOULD PTILE BE?
    }
  }
}

//A tile object in the lace pattern

class LaceUnit{
  float x, y; // x,y location
  PImage ptile;
  // float oreintation;

  // Tile constructor
  tile(float X, float Y, PImage ptile) {
    x = X;
    y = Y;
    ptile = ptile; //OK HOW DO I GET THIS TO WORK? CALL THIS UP ABOVE?
  }
}




