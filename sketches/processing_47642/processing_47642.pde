
/*
 * Hex Braid by Algirdas Rascius (http://mydigiverse.com).
 */
/**
 * Click to restart. Each time parameters used to generate braid will differ.
 */
 
static final float BIG_RADIUS = 22;
static final float LINE_WIDTH = 3.0;
static final float OUTLINE_WIDTH= 7.0;
 
static final float DELTA_X = BIG_RADIUS * sqrt(3);
static final float DELTA_Y = BIG_RADIUS * 1.5;
static final float SMALL_RADIUS = DELTA_X / 2;
 
int sizeX;
int sizeY;
int cells[][];
 
void setup() {
  size(920, 900);
  smooth();
  sizeX = (int)(width / DELTA_X + 1);
  sizeY = (int)(height / DELTA_Y + 1);
  initialize();
}
 
void initialize() {
  background(255);
  for (int x=0; x<sizeX; x++) {
    for (int y=0; y<sizeY; y++) {
      drawCell(x, y, 1);
    }
  }
}
 
void mouseClicked() {
   initialize();
}
 
void keyPressed() {
   initialize();
}
 
void draw() {
  int x = (int)random(0, sizeX);
  int y = (int)random(0, sizeY);
  fillCell(x, y);
  drawCell(x, y, random(0, 1));
}
 
void drawCell(int x, int y, float straightProbability) {
  boolean[] used = new boolean[6];
  for (int i=0; i<3; i++) {
    int s1 = nextEmpty(used, (int)random(0, 6));
    used[s1] = true;
    int s2 = random(0, 1) <= straightProbability ? (s1+3)%6 : (int)random(0, 6);
    s2 = nextEmpty(used, s2);
    used[s2] = true;
    drawConnection(x, y, s1, s2);
  }
}
 
 
int nextEmpty(boolean[] used, int i) {
  while (used[i]) {
    i = (i+1) % used.length;
  }
  return i;
}
 
void fillCell(int x, int y) {
  float xc = (x+0.5) * DELTA_X - (y%2==1 ? DELTA_X/2 : 0);
  float yc = (y+0.5) * DELTA_Y;
  fill(255);
  noStroke();
  beginShape();
  for (int i=0; i<=6; i++ ) {
    float a = (i+0.5)*TWO_PI/6;
    vertex(xc + BIG_RADIUS*cos(a), yc + BIG_RADIUS*sin(a));
  }
  endShape();
}
 
void drawConnection(int x, int y, int s1, int s2) {
  float curvature = random(0.1, 0.6);
  noFill();
  stroke(255);
  strokeWeight(OUTLINE_WIDTH);
  strokeCap(SQUARE);
  drawConnectionLine(x, y, s1, s2, curvature);
  stroke(0);
  strokeWeight(LINE_WIDTH);
  strokeCap(ROUND);
  drawConnectionLine(x, y, s1, s2, curvature);
}
 
void drawConnectionLine(int x, int y, int s1, int s2, float curvature) {
  float xc = (x+0.5) * DELTA_X - (y%2==1 ? DELTA_X/2 : 0);
  float yc = (y+0.5) * DELTA_Y;
  float a1 = s1*TWO_PI/6;
  float a2 = s2*TWO_PI/6;
  bezier(
    xc + SMALL_RADIUS*cos(a1), yc + SMALL_RADIUS*sin(a1),
    xc + SMALL_RADIUS*cos(a1)*curvature, yc + SMALL_RADIUS*sin(a1)*curvature,
    xc + SMALL_RADIUS*cos(a2)*curvature, yc + SMALL_RADIUS*sin(a2)*curvature,
    xc + SMALL_RADIUS*cos(a2), yc + SMALL_RADIUS*sin(a2));
}

