
simpleLine l[];
int lCnt = 10;

//---------------------------------------------------------------

void setup() {
  size(600,400);
  smooth();
  textSize(9);
  textAlign(LEFT,CENTER);
  strokeWeight(.5);
  l = new simpleLine[lCnt];
  for (int i=0; i<lCnt; i++)
    l[i] = new simpleLine(i);
}

//---------------------------------------------------------------

void draw() {
  background(255);
  for (int i=0; i<lCnt; i++)
    l[i].show();
}

//---------------------------------------------------------------

class simpleLine {
  PVector posA, posB;
  PVector dirA, dirB;
  int idx;
  
  simpleLine(int indexNum) {
    idx = indexNum;
    posA = new PVector();
    posB = new PVector();
    dirA = new PVector();
    dirB = new PVector();
    posA.x = random(width);
    posA.y = random(height);
    posB.x = random(width);
    posB.y = random(height);
    dirA.x = random(-1,1);
    dirA.y = random(-1,1);
    dirB.x = random(-1,1);
    dirB.y = random(-1,1);
  }
  
  void show() {
    posA.add(dirA);
    posB.add(dirB);
    
    if (posA.x < 0 || posA.x >= width)  dirA.x *= -1;
    if (posA.y < 0 || posA.y >= height) dirA.y *= -1;
    if (posB.x < 0 || posB.x >= width)  dirB.x *= -1;
    if (posB.y < 0 || posB.y >= height) dirB.y *= -1;
    
    stroke(0);
    line(posA.x, posA.y, posB.x, posB.y);
    
    fill(200);
    text("A ("+int(posA.x)+", "+int(posA.y)+")", posA.x, posA.y - 15);
    text("B ("+int(posB.x)+", "+int(posB.y)+")", posB.x, posB.y - 15);
    
    for (int i=idx+1; i<lCnt; i++)
      checkIntersect(posA.x, posA.y, posB.x, posB.y, l[i].posA.x, l[i].posA.y, l[i].posB.x, l[i].posB.y);
  }
}

//---------------------------------------------------------------

void checkIntersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  //check out http://www.ferris.edu/faculty/burtchr/sure215/notes/line-line%20intersection.pdf for more...
  
  float a1, b1, c1;
  float a2, b2, c2;
  float r1, r2 , r3, r4;
  float d, offset, nX, nY;
  float x, y;
  
  a1 = y2 - y1;
  b1 = x1 - x2;
  c1 = (x2 * y1) - (x1 * y2);
  r3 = ((a1 * x3) + (b1 * y3) + c1);
  r4 = ((a1 * x4) + (b1 * y4) + c1);
  if (r3 != 0 && r4 != 0 && r3*r4 >= 0) return; //miss
  
  a2 = y4 - y3;
  b2 = x3 - x4;
  c2 = (x4 * y3) - (x3 * y4);
  r1 = (a2 * x1) + (b2 * y1) + c2;
  r2 = (a2 * x2) + (b2 * y2) + c2;
  if (r1 != 0 && r2 != 0 && r1*r2 >= 0) return; //miss
  
  d = (a1 * b2) - (a2 * b1);
  if (d == 0) return; //parallel
  
  offset = d/abs(d)*d/2;
  nX = b1*c2 - b2*c1;
  nY = a2*c1 - a1*c2;
  x = (nX + nX/abs(nX)*offset)/d;
  y = (nY + nY/abs(nY)*offset)/d;
  
  stroke(64, 0, 0);
  noFill();
  ellipse(x, y, 8, 8);
  fill(64, 0, 0);
  text("("+int(x)+", "+int(y)+")", x, y - 15);
}

