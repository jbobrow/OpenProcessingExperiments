
PVector[] p = new PVector[4];
PVector loc;
float theta;
int frames = 240, edge = 20;
long rs;

void setup() {
  size(500, 500);
  strokeWeight(1);
  stroke(255);
  rs = (long)random(10000);
}

void draw() {
  randomSeed(rs);
  background(0);
  stroke(255);
  float sz = 20;
  float x0 =0;
  float y0 =map(sin(theta), -1, 1, edge, height-edge);
  p[0]= new PVector(x0, y0);
  float x1 = width;
  float y1 = y0;
  p[1]= new PVector(x1, y1);
  float x2 = map(sin(theta), -1, 1, 150, 350);
  float y2 = edge*3;
  p[2]= new PVector(x2, y2);
  float x3 = map(sin(theta+PI), -1, 1, 150, 350);
  float y3 = height-edge*3;
  p[3]= new PVector(x3, y3);

  line(p[0].x, p[0].y, p[1].x, p[1].y);
  line(p[2].x, p[2].y, p[3].x, p[3].y);

  PVector intersect = segmentIntersect(p[0], p[1], p[2], p[3]);
  if (intersect!=null) {
    //noFill();
    fill(255);
    ellipse(loc.x, loc.y, sz, sz);
    fill(255,100);;
    ellipse(loc.x, loc.y, sz*2, sz*2);
  }

  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

PVector segmentIntersect(PVector p0, PVector p1, PVector p2, PVector p3) {
  float A1, B1, C1, A2, B2, C2, denominator;
  A1= p1.y-p0.y;
  B1 = p0.x - p1.x;
  C1 = A1 * p0.x + B1 * p0.y; 
  A2 = p3.y - p2.y;
  B2 = p2.x - p3.x; 
  C2 = A2 * p2.x + B2 * p2.y; 
  denominator = A1 * B2 - A2 * B1;

  if (denominator==0) {
    return null;
  } 

  float intersectX =  (B2 * C1 - B1 * C2) / denominator;
  float intersectY =  (A1 * C2 - A2 * C1) / denominator;
  float rx0 = (intersectX - p0.x)/(p1.x-p0.x);
  float ry0 = (intersectY - p0.y)/(p1.y-p0.y);
  float rx1 = (intersectX - p2.x)/(p3.x-p2.x);
  float ry1 = (intersectY - p2.y)/(p3.y-p2.y);

  if (((rx0>=0 && rx0<=1) || (ry0>=0 && ry0<=1)) &&
    ((rx1>=0 && rx1<=1) || (ry1>=0 && ry1<=1))) {
    return loc = new PVector(intersectX, intersectY);
  } else {
    return null;
  }
}

