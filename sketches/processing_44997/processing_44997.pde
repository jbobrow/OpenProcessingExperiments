
/*
 Created By Aldis Ozolins
 Interactive 2 // Fall 2011
 Logo Paramiterization
 */



PFont font;
int xpos=0;
int cols = 5;
int rows = 5;
int[][] yoff1 = new int[cols][rows];
int[][] yoff2 = new int[cols][rows];

void setup() {
  size(560, 560);
  smooth();
  colorMode(HSB);
  strokeWeight(3);
  font = loadFont("Klavika-Light-48.vlw");
  textFont(font, 48);
  // get random position at start
  randomPos();
}

void draw() {
  background(0);
  float sColor = map(mouseX, 0, 580, 1, 100);
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      drawShape(i*(width/cols), j*(height/rows), sColor, yoff1[i][j], yoff2[i][j]);
    }
  }
}

void drawShape(int x, int y, float sColor, int yoff1, int yoff2) {
  pushMatrix();
  translate(x+15, y+72);

  // keep drawing simple and easy to control
  text("P", 0, yoff1);
  text("A", 50, yoff2);
  stroke(sColor, 1000, 100);
  line(15, yoff1, 45, yoff2);
  popMatrix();
}

void mousePressed() {
  // mouse event also triggers random position
  randomPos();
}

void randomPos() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      yoff1[i][j] = int(random(20));
      yoff2[i][j] = int(random(20));
    }
  }
}


