
void setup() {
  background(#50525D);
  size(600, 600);
  noStroke();
  noLoop();
}
void draw() {
  fill(#0A0C52);
  int DiagonalMove = 0;
  for (float i = 0; i < 600; i ++) {
    for (float j = 0 + DiagonalMove; j < 600; j+=8) {
      rect(j, i, 5, 1);
    }
    DiagonalMove --;
  }
  int CENTERX = (width/2)-100;
  int CENTERY = (height/2)-100;
  Gird(CENTERX, CENTERY, 210, color(#08081F), 100); // BIG BLUE
  Gird(CENTERX, CENTERY, 530, color(#7D07AD), 75);// BIG GREEN
  Gird(CENTERX, CENTERY, 210, color(#7D07AD, 200), 30); // SMALL SMALL GREEN
  Gird(CENTERX, CENTERY, 370, color(#E05FBC), 6); // SMALL SMALL RED 1
  Gird(CENTERX, CENTERY, 395, color(#9B2279), 6); // SMALL SMALL RED 2
  Gird(CENTERX, CENTERY, 41, color(#C2CFFA), 8); // SMALL SMALL white 1
  Gird(CENTERX, CENTERY, 41, color(#C2CFFA), 8); // SMALL SMALL white 2
  Gird(CENTERX, CENTERY, 546, color(#050805), 3); // SMALL SMALL black 1
  Gird(CENTERX, CENTERY, 513, color(#050805), 3); // SMALL SMALL black 2

  fill(#0D0C1A, 150);
  //rect(340, 340, 210, 80);
  //rect(350, 400, 160, 90);
  fill(255);
  PFont font;
  font = loadFont("impact.vlw"); 
  textFont(font); 
  String s = "Alba gu bràth!";
  textSize(50);
  text(s, 350, 400);
}
void Gird(int xForGrind, int yForGrid, int spaceGrid, color f, int LineWidthForGirdLine) { 
  Line_Generator(xForGrind+(spaceGrid/2), false, f, LineWidthForGirdLine);
  Line_Generator(300-(spaceGrid/2), false, f, LineWidthForGirdLine);
  Line_Generator(xForGrind+(spaceGrid/2), true, f, LineWidthForGirdLine);
  Line_Generator(300-(spaceGrid/2), true, f, LineWidthForGirdLine);
}
void Line_Generator(int XorYLoc, boolean IsItVertical, color c, int LineWidth) {
  float DiagonalMove = 0;
  fill(c); 
  float StartingPointXorY = XorYLoc - (LineWidth / 2);
  for (float i = 0; i < LineWidth; i ++) {
    for (float j = -1 + DiagonalMove - (width/2); j < width; j+=8) {
      if (IsItVertical == false) { 
        rect(j, i+StartingPointXorY, 5, 1);
      } 
      else {
        rect(i+StartingPointXorY, j, 1, 5);
      }
    }
    DiagonalMove += 1;
  }
}


