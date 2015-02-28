
// size
int cellHeight;
int cellWidth;
int rows;
int cols;

// colors
color c1;
color c2;
color c3;
color c4;
color c5;
color c6;
color[] palette = new color[6];
int colorIndex;

// glasses
float roundness;
float tallness;

void setup() {
  size(900, 900);
  rows = 10;
  cols = 10;
  cellHeight = height/rows;
  cellWidth = width/cols;
  
  // colors from various palettes on Kuler
  palette[0] = color(113, 59, 8);
  palette[1] = color(153, 81, 85);
  palette[2] = color(92, 95, 102);
  palette[3] = color(119, 150, 132);
  palette[4] = color(255, 164, 139);
  palette[5] = color(223, 242, 152);
  colorIndex = 3;
  
  smooth();
  noStroke();
  noFill();
  drawBackground();
}

void drawBackground() {
  for (int x=0; x<rows; x++) {
    colorIndex++;
    if (colorIndex > 5) {
      colorIndex = 3;
    }
    for (int y=0; y<cols; y++) {
      colorIndex++;
      if (colorIndex > 5) {
        colorIndex = 3;
      }
      fill(palette[colorIndex]);
      rect(x*cellWidth, y*cellHeight, cellHeight, cellWidth);
      drawGlasses(x*cellWidth,y*cellHeight);
    }
  }
}

void drawGlasses(int gx, int gy) {
  stroke(palette[int(random(0,3))]); // random color from palette (0, 1, or 2)
  strokeWeight(int(random(1,6))); // random thickness of glasses
  
  // bridge
  arc(gx+(cellWidth/2), gy+(cellHeight/2), cellHeight/7, cellHeight/10, PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI);
  
  // frame with random height and roundedness
  rectMode(CENTER);
  
  roundness = random(1,11);
  tallness = random (10,23);
  
  rect(gx+(cellWidth/2)-20, gy+(cellHeight/2), 30, tallness, roundness);
  rect(gx+(cellWidth/2)+20, gy+(cellHeight/2), 30, tallness, roundness);
  rectMode(CORNER);
  
  noStroke();
}

void mouseClicked(){
  drawBackground();
}


