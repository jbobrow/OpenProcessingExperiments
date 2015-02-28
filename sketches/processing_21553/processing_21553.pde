


int r1 = 213;
int r2 = r1+20;
int r3 = r1+40;
int r4 = r1+60;
int r5 = r1+80;
int r6 = r1+100;
int r7 = r1+120;
int r8 = r1+140;
int r9 = r1+160;
int r10 = r1+180;
int r11 = r1+200;

int c1 = 155;
int c2 = c1+20;
int c3 = c1+40;
int c4 = c1+60;
int c5 = c1+80;
int c6 = c1+100;
int c7 = c1+120;


void setup() {
  size(640, 480);
  smooth();

  
}

float square(float x) {
  return x*x;
}

void drawDot(float x, float y, boolean isBlue) {
  float d = map(sqrt(square(x-mouseX) + square(y-mouseY)), 120, 0, 10, 50);
  if (d<10) d = 10;
  // if outside the grid and blue or less than 20, then make big
  if(isBlue && (d < 20)) {
    ellipse(x, y, 20, 20);
  }
  
  else {
    ellipse(x, y, d, d);
  }
}



void draw() {
  background(255);
  noStroke();
  
  //FOLLOW THE MOUSE
  float D = dist(mouseX, mouseY, r1, c1);
  float followY = map(mouseY, 135, 295, 135, 295);
  
  //CIRCLE DIAMETERS
  float dS = 10;
  float dB = 20;
  
  
  //ROW 1 ORANGE
  fill(215, 223, 35);
  drawDot(r1, c1, false);
  drawDot(r1, c2, false);
  drawDot(r1, c3, false);
  drawDot(r1, c4, false);
  drawDot(r1, c5, false);
  drawDot(r1, c6, false);
  drawDot(r1, c7, false);
  
  //ROW 2 ORANGE
  drawDot(r2, c1, false);
  drawDot(r2, c7, false);
  
  //ROW 3 ORANGE
  drawDot(r3, c1, false);
  drawDot(r3, c2, false);
  drawDot(r3, c5, false);
  drawDot(r3, c6, false);
  drawDot(r3, c7, false);
  
  //ROW 4 ORANGE
  drawDot(r4, c1, false);
  drawDot(r4, c2, false);
  drawDot(r4, c3, false);
  drawDot(r4, c6, false);
  drawDot(r4, c7, false);
  
  //ROW 5 ORANGE
  drawDot(r5, c1, false);
  drawDot(r5, c2, false);
  drawDot(r5, c5, false);
  drawDot(r5, c6, false);
  drawDot(r5, c7, false);
  
  //ROW 6 ORANGE
  drawDot(r6, c1, false);
  drawDot(r6, c7, false);
  
  //ROW 7 ORANGE
  drawDot(r7, c1, false);
  drawDot(r7, c7, false);
  
  //ROW 8 ORAGNE
  drawDot(r8, c1, false);
  drawDot(r8, c3, false);
  drawDot(r8, c4, false);
  drawDot(r8, c5, false);
  drawDot(r8, c7, false);
  
  //ROW 9 ORANGE
  drawDot(r9, c1, false);
  drawDot(r9, c3, false);
  drawDot(r9, c4, false);
  drawDot(r9, c5, false);
  drawDot(r9, c7, false);
  
  //ROW 10 ORANGE
  drawDot(r10, c1, false);
  drawDot(r10, c2, false);
  drawDot(r10, c6, false);
  drawDot(r10, c7, false);
  
  //ROW 11 ORANGE
  drawDot(r11, c1, false);
  drawDot(r11, c2, false);
  drawDot(r11, c3, false);
  drawDot(r11, c4, false);
  drawDot(r11, c5, false);
  drawDot(r11, c6, false);
  drawDot(r11, c7, false);
  
  
  
  //ROW 2 BLUE
    fill(0, 167, 157);
  drawDot(r2, c2, true);
  drawDot(r2, c3, true);
  drawDot(r2, c4, true);
  drawDot(r2, c5, true);
  drawDot(r2, c6, true);
  
  //ROW 3 BLUE
  drawDot(r3, c3, true);
  drawDot(r3, c4, true);
  
  //ROW 4 BLUE
  drawDot(r4, c4, true);
  drawDot(r4, c5, true);
  
  //ROW 5 BLUE
  drawDot(r5, c3, true);
  drawDot(r5, c4, true);
  
  //ROW 6 BLUE
  drawDot(r6, c2, true);
  drawDot(r6, c3, true);
  drawDot(r6, c4, true);
  drawDot(r6, c5, true);
  drawDot(r6, c6, true);
  
  //ROW 7 BLUE
  drawDot(r7, c2, true);
  drawDot(r7, c3, true);
  drawDot(r7, c4, true);
  drawDot(r7, c5, true);
  drawDot(r7, c6, true);
  
  //ROW 8 BLUE
  drawDot(r8, c2, true);
  drawDot(r8, c6, true);
  
  //ROW 9 BLUE
  drawDot(r9, c2, true);
  drawDot(r9, c6, true);
  
  //ROW 10 BLUE
  drawDot(r10, c3, true);
  drawDot(r10, c4, true);
  drawDot(r10, c5, true);
  
  
  
  
  

  
}

