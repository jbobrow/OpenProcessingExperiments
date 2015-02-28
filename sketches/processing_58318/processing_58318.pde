
boolean button = false; // Black becomes white, white becomes black

// Declare images and shapes as variables - to contain png/svg file
PImage Bkgds; // Background
PImage RPanel; // Bottom Right Pattern Panel
PImage LPanel; // Bottom Left Pattern Panel
PShape TopP; // Top Pattern
PShape TopD; // Top Design

// Global Variables
float GlobalXpos1A = 0; // Circles X Position
float GlobalXpos2A = 0; // Squares X Position Rows: 1,3,5
float GlobalXpos2B = 0; // Squares X Position Rows: 2,4,6
float GlobalYpos3 = 500; // Bottom Y Panels Position
float GlobalYpos4 = 152; // Diamond Y Position
float GlobalYpos5 = 10; // Top Pattern Y Position
int Gcy1 = 490; // Bottom Wave Position
int Gcy2 = 210; // Bottom Wave Position
int Gcy3 = 432; 
int Gcy4 = 152;
int Gcy5 = 374;
int Gcy6 = 94;
int Gcy7 = 316;
int Gcy8 = 36;
int Gcy9 = 258;
int Gcy10 = -22;
int Gcy11 = 200; // Top Wave Position
int Gcy12 = -80; // Top Wave Position
int Globalwspeed = 1; // Waves Speed
float GlobalX2Speed = 1; // Squares X Speed
float GlobalY3Speed = .4; // Bottom Panels Y Speed
float GlobalY4Speed = 3; // Diamond Y Speed
float GlobalY5Speed = .15; // Top Pattern Y Speed
float Globalc1 = 255; // White Color
float Globalc2 = 0; // Black Color
float Globaldeg = 45; // Diamond degree Rotation
float Globalrad = radians(Globaldeg); // Diamond Radian Degrees

void setup() {
  size(495, 485);

  // Initialize images and shapes variables with loadImage/loadShape functions 
  Bkgds = loadImage("PatternBkgd.png");
  LPanel = loadImage("PatternL.png");
  RPanel = loadImage("PatternR.png");
  TopP = loadShape("TopPattern.svg");
  TopD = loadShape("TopDesign.svg");
}
void draw() {
  smooth();
  image (Bkgds, 0, 0); // Background
  // Waves
  moveWaves();
  bounceWaves();
  drawwave (0, 348, 175, Gcy1, 375, Gcy2, 500, 348); // Bottom Wave
  drawwave (0, 290, 175, Gcy3, 375, Gcy4, 500, 290);
  drawwave (0, 232, 175, Gcy5, 375, Gcy6, 500, 232);
  drawwave (0, 174, 175, Gcy7, 375, Gcy8, 500, 174);
  drawwave (0, 116, 175, Gcy9, 375, Gcy10, 500, 116);
  drawwave (0, 58, 175, Gcy11, 375, Gcy12, 500, 58); // Top Wave
  // Top Pattern Design
  shape(TopP, 0, GlobalYpos5); // Top Pattern
  GlobalYpos5 = GlobalYpos5 + GlobalY5Speed; // Change Top Pattern Position Position by Speed
    if (GlobalYpos5 < 0 || GlobalYpos5 > 15) {
    GlobalY5Speed = GlobalY5Speed * -1; // Reverses Top Pattern Y Speed
    }
  shape(TopD, width/2, 0); // Top Design
  drawbrect(); // Bottom rectangle background 
  // Circles
  drawCircles();
  // Squares
  moveSquares();
  bounceSquares();
  drawSquares();
  // Bottom Side Panels
  image (RPanel, -115, GlobalYpos3); // Bottom Right Pattern Panel
  image (LPanel, 342, GlobalYpos3); // Bottom Left Pattern Panel
  movePanels();
  // Diamond
  movediamond();
  drawdiamond ();

  if (button) { // if button is true affects bottom center panel
    Globalc1 = 0; // black
    Globalc2 = 255; // white
  } 
  else {
    Globalc1 = 255; // white
    Globalc2 = 0; // black
  }
} // End of void draw

void drawwave(int x1, int y1, int cx1, int cy1, int cx2, int cy2, int x2, int y2) {
  noFill();
  stroke(Globalc1);
  strokeWeight(10);
  bezier (x1, y1, cx1, cy1, cx2, cy2, x2, y2);
}

void drawbrect() { // Bottom big rectangle behind tiny squares
  rectMode(CORNER);
  noStroke(); 
  fill (Globalc1);
  rect (0, 400, 500, 500);
}

void drawCircles() {
  for (float j = 410; j < height; j+=30) {
    strokeWeight(1);
    stroke(Globalc2);
    fill (Globalc1);
    ellipse (GlobalXpos1A, j, 15, 15); // Right Column
    ellipse (GlobalXpos1A+30, j, 15, 15);
    ellipse (GlobalXpos1A+60, j, 15, 15);
    ellipse (GlobalXpos1A+90, j, 15, 15);
    ellipse (GlobalXpos1A+120, j, 15, 15);
    ellipse (GlobalXpos1A+150, j, 15, 15);
    ellipse (GlobalXpos1A+180, j, 15, 15);
    ellipse (GlobalXpos1A+210, j, 15, 15);
    ellipse (GlobalXpos1A+240, j, 15, 15);
    ellipse (GlobalXpos1A+270, j, 15, 15);
    ellipse (GlobalXpos1A+300, j, 15, 15);
    ellipse (GlobalXpos1A+330, j, 15, 15);
    ellipse (GlobalXpos1A+360, j, 15, 15);
    ellipse (GlobalXpos1A+390, j, 15, 15);
    ellipse (GlobalXpos1A+420, j, 15, 15);
    ellipse (GlobalXpos1A+450, j, 15, 15);
    ellipse (GlobalXpos1A+480, j, 15, 15); // Left Column
  }
}   
void drawSquares() {
  for (int i = 395; i < height; i+=30) {
    noStroke();
    fill (Globalc2);
    rectMode(CORNER);
    // Rows affected: 1,3,5
    rect (GlobalXpos2A-120, i, 15, 15); // Right Column
    rect (GlobalXpos2A-90, i, 15, 15);
    rect (GlobalXpos2A-60, i, 15, 15); 
    rect (GlobalXpos2A-30, i, 15, 15); 
    rect (GlobalXpos2A, i, 15, 15); 
    rect (GlobalXpos2A+30, i, 15, 15);  
    rect (GlobalXpos2A+60, i, 15, 15);
    rect (GlobalXpos2A+90, i, 15, 15);
    rect (GlobalXpos2A+120, i, 15, 15);
    rect (GlobalXpos2A+150, i, 15, 15);
    rect (GlobalXpos2A+180, i, 15, 15);
    rect (GlobalXpos2A+210, i, 15, 15);
    rect (GlobalXpos2A+240, i, 15, 15);
    rect (GlobalXpos2A+270, i, 15, 15);
    rect (GlobalXpos2A+300, i, 15, 15);
    rect (GlobalXpos2A+330, i, 15, 15);
    rect (GlobalXpos2A+360, i, 15, 15);
    rect (GlobalXpos2A+390, i, 15, 15);
    rect (GlobalXpos2A+420, i, 15, 15);
    rect (GlobalXpos2A+450, i, 15, 15);
    rect (GlobalXpos2A+480, i, 15, 15); // Left Column
    // Rows affected: 2,4,6
    rect (GlobalXpos2B+15, i+15, 15, 15); // Right Column
    rect (GlobalXpos2B+45, i+15, 15, 15);
    rect (GlobalXpos2B+75, i+15, 15, 15);
    rect (GlobalXpos2B+105, i+15, 15, 15);
    rect (GlobalXpos2B+135, i+15, 15, 15);
    rect (GlobalXpos2B+165, i+15, 15, 15);
    rect (GlobalXpos2B+195, i+15, 15, 15);
    rect (GlobalXpos2B+225, i+15, 15, 15);
    rect (GlobalXpos2B+255, i+15, 15, 15);
    rect (GlobalXpos2B+285, i+15, 15, 15);
    rect (GlobalXpos2B+315, i+15, 15, 15);
    rect (GlobalXpos2B+345, i+15, 15, 15);
    rect (GlobalXpos2B+375, i+15, 15, 15);
    rect (GlobalXpos2B+405, i+15, 15, 15);
    rect (GlobalXpos2B+435, i+15, 15, 15);
    rect (GlobalXpos2B+465, i+15, 15, 15);
    rect (GlobalXpos2B+495, i+15, 15, 15); 
    rect (GlobalXpos2B+525, i+15, 15, 15);
    rect (GlobalXpos2B+555, i+15, 15, 15); // Left Column
  }
} 
void moveSquares() {
  GlobalXpos2A = GlobalXpos2A + GlobalX2Speed; // Move Rows 1,3,5
  GlobalXpos2B = GlobalXpos2B - GlobalX2Speed; // Move Rows 2,4,6
}
void bounceSquares() {
  if (GlobalXpos2A > 100 || GlobalXpos2A < 0 && GlobalXpos2B < 100 || GlobalXpos2B > 0) {
    GlobalX2Speed = GlobalX2Speed * -1;
  }
}
void movePanels() {
  GlobalYpos3 = GlobalYpos3 - GlobalY3Speed;
  if (GlobalYpos3 < 371) {
    GlobalYpos3 = 371;
  }
}
void moveWaves() {
  Gcy1 = Gcy1 - Globalwspeed; // Bottom Wave
  Gcy2 = Gcy2 + Globalwspeed; // Bottom Wave
  Gcy3 = Gcy3 - Globalwspeed;
  Gcy4 = Gcy4 + Globalwspeed;
  Gcy5 = Gcy5 - Globalwspeed;
  Gcy6 = Gcy6 + Globalwspeed;
  Gcy7 = Gcy7 - Globalwspeed;
  Gcy8 = Gcy8 + Globalwspeed;
  Gcy9 = Gcy9 - Globalwspeed;
  Gcy10 = Gcy10 + Globalwspeed;
  Gcy11 = Gcy11 - Globalwspeed; // Top Wave
  Gcy12 = Gcy12 + Globalwspeed; // Top Wave
}
void bounceWaves() {
  if ((Gcy1 < 210) || (Gcy1 > 490) && (Gcy2 < 210) || (Gcy2 > 490) && (Gcy3 < 152) || (Gcy3 > 432) && (Gcy4 < 152) || (Gcy4 > 432)  && 
    (Gcy5 < 94) || (Gcy5 > 374) && (Gcy6 < 94) || (Gcy6 > 374) && (Gcy7 < 36) || (Gcy7 > 316) && (Gcy8 < 36) || (Gcy8 > 316) && (Gcy9 < -22) || (Gcy9 > 258) && 
    (Gcy10 < -22) || (Gcy10 > 258) && (Gcy11 < -80) || (Gcy11 > 200) && (Gcy12 < -80) || (Gcy12 > 200)) {
    Globalwspeed = Globalwspeed * -1;
  }
}
void drawdiamond() {
  if (mouseX > 210 && mouseX < 280 && mouseY > 150 && mouseY < 207) {
    noStroke();
    rectMode(CENTER);
    pushMatrix();
    translate(width/2-3, GlobalYpos4);
    rotate(Globalrad);
    fill (Globalc2);
    rect (0, 0, 30, 30);
    stroke(Globalc1);
    ellipse(0, 0, 15, 15);
    popMatrix();
  }
}
void movediamond() {
  Globalrad = Globalrad + 45; 
  GlobalYpos4 = GlobalYpos4 + GlobalY4Speed;
  if (GlobalYpos4 > 485){
    GlobalYpos4 = 150;
  }
}
void mousePressed() {
  button = !button;
}


