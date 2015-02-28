
Vector[][] vs;
final int WINDOW_WIDTH = 800;
final int WINDOW_HEIGHT = 400;
int RADIUS_ = 100;  // distance between vs(0) and vs(10)
int B = RADIUS_ / 5;  // distance between vs(1) and vs(4)
float a30 = radians(30);
float a60 = radians(60);

void setup() {
  //size(WINDOW_WIDTH, WINDOW_HEIGHT);
  size(800, 400);  // for openprocessing
  background(255);
  
  int x = 0;
  int y = 0;
  
  vs = new Vector[3][25];
  for (int i = 0; i < 3; ++i) {
    float angle = i * (TWO_PI / 3);
    Vector start = new Vector(x, y);
    vs[i][10] = start.copy();
    vs[i][0] = start.plus(makeVectorAngle(angle - a60, RADIUS_));
    vs[i][14] = start.plus(makeVectorAngle(angle, RADIUS_));
    vs[i][24] = start.plus(makeVectorAngle(angle + a60, RADIUS_));
    
    Vector middle = start.plus(makeVectorAngle(angle, RADIUS_/2));
    vs[i][12] = middle.copy();
    
    vs[i][4] = start.plus(makeVectorAngle(angle - a60, RADIUS_/4));
    vs[i][19] = start.plus(makeVectorAngle(angle + a60, RADIUS_/4));
    vs[i][5] = vs[i][14].plus(makeVectorAngle(angle - 2*a60, RADIUS_/4));
    vs[i][21] = vs[i][14].plus(makeVectorAngle(angle + 2*a60, RADIUS_/4));
    
    Vector vTemp0 = makeVectorAngle(angle - a60, B);
    vs[i][1] = vs[i][4].plus(vTemp0);
    vs[i][8] = vs[i][4].minus(vTemp0);
    vs[i][16] = vs[i][21].plus(vTemp0);
    vs[i][23] = vs[i][21].minus(vTemp0);
    
    Vector vTemp1 = makeVectorAngle(angle - 2*a60, B);
    vs[i][2] = vs[i][5].plus(vTemp1);
    vs[i][9] = vs[i][5].minus(vTemp1);
    vs[i][15] = vs[i][19].plus(vTemp1);
    vs[i][22] = vs[i][19].minus(vTemp1);
    
    Vector vTemp2 = makeVectorAngle(angle - a30, (int)(B / cos(a30)));
    vs[i][7] = vs[i][12].plus(vTemp2);
    vs[i][17] = vs[i][12].minus(vTemp2);
    
    Vector vTemp3 = makeVectorAngle(angle + a30, (int)(B / cos(a30)));
    vs[i][3] = vs[i][7].minus(vTemp3);
    vs[i][6] = vs[i][12].minus(vTemp3);
    vs[i][11] = vs[i][17].minus(vTemp3);
    vs[i][20] = vs[i][17].plus(vTemp3);
    vs[i][18] = vs[i][12].plus(vTemp3);
    vs[i][13] = vs[i][7].plus(vTemp3);
  }
  fillWithStuff();  
}

void draw() {
}

void fillWithStuff() {
  int deltaX = 3 * RADIUS_;
  int deltaY = (int) (2 * RADIUS_ * cos(a30));
  for(int ix=0; ix < WINDOW_WIDTH+RADIUS_; ix+=deltaX) {
    for (int iy=0; iy < WINDOW_HEIGHT+RADIUS_; iy+=deltaY) {
      for (int orientation=0; orientation<3; ++orientation) {
        drawDiamond1(orientation, ix, iy);
        drawDiamond1(orientation, ix+(int)(RADIUS_*1.5), iy+deltaY/2);
      }
    }
  }
}

void drawDiamond1(int orientation, int xOffset, int yOffset) {
  int o = orientation;
  fill(0);
  noStroke();
  beginShape();
  vertex(vs[o][0].x + xOffset, vs[o][0].y + yOffset);
  vertex(vs[o][14].x + xOffset, vs[o][14].y + yOffset);
  vertex(vs[o][24].x + xOffset, vs[o][24].y + yOffset);
  vertex(vs[o][10].x + xOffset, vs[o][10].y + yOffset);
  endShape();
  
  strokeWeight(7);
  fill(0, 255, 0);
  stroke(255,0,0);
  beginShape();
  vertex(vs[o][1].x + xOffset, vs[o][1].y + yOffset);
  vertex(vs[o][16].x + xOffset, vs[o][16].y + yOffset);
  vertex(vs[o][23].x + xOffset, vs[o][23].y + yOffset);
  vertex(vs[o][8].x + xOffset, vs[o][8].y + yOffset);
  endShape();
  
  fill(0, 255, 255);
  stroke(255, 255, 0);
  beginShape();
  vertex(vs[o][2].x + xOffset, vs[o][2].y + yOffset);
  vertex(vs[o][9].x + xOffset, vs[o][9].y + yOffset);
  vertex(vs[o][22].x + xOffset, vs[o][22].y + yOffset);
  vertex(vs[o][15].x + xOffset, vs[o][15].y + yOffset);
  endShape();
}

public class Vector {
  public int x;
  public int y;

  public Vector(int x, int y) {
    this.x = x;
    this.y = y;
  }  
  
  public Vector plus(Vector other) {
    int x = this.x + other.x;
    int y = this.y + other.y;
    return new Vector(x, y);
  }

  public Vector minus(Vector other) {
    int x = this.x - other.x;
    int y = this.y - other.y;
    return new Vector(x, y);
  }
  
  public Vector copy() {
    return new Vector(x, y);
  }
}

Vector makeVectorAngle(float angle, int len) {
  int x = (int) (cos(angle) * len);
  int y = (int) (sin(angle) * len);
  return new Vector(x, y);
}
