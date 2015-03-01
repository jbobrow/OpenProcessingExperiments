
PVector[] p = new PVector[4];
PVector loc;
float theta;
int frames = 180;

void setup() {
  size(500, 500);
  strokeWeight(2);
  stroke(255);
}

void draw() {
  background(0);
  float d = 20;
  float x0 = map(sin(theta), -1, 1, 50, 350);
  float y0 = map(sin(theta), -1, 1, height/2, 25);
  p[0]= new PVector(x0, y0);
  float x1 = map(sin(theta), -1, 1, 450, 350);
  float y1 = map(sin(theta), -1, 1, 450, 300);
  p[1]= new PVector(x1, y1);
  float x2 = map(sin(theta), -1, 1, 50, 100);
  float y2 = map(sin(theta), -1, 1, 400, 200);
  p[2]= new PVector(x2, y2);
  float x3 = map(sin(theta), -1, 1, 300, 400);
  float y3 = map(sin(theta), -1, 1, 50, 100);
  p[3]= new PVector(x3, y3);

  line(p[0].x, p[0].y, p[1].x, p[1].y);
  line(p[2].x, p[2].y, p[3].x, p[3].y);

  lineIntersect(p[0], p[1], p[2], p[3]);
  noFill();
  ellipse(loc.x, loc.y, 20, 20);

  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

PVector lineIntersect(PVector p0, PVector p1, PVector p2, PVector p3) {
  float A1, B1, C1, A2, B2, C2, denominator;
  A1= p1.y-p0.y;
  B1 = p0.x - p1.x;
  C1 = A1 * p0.x + B1 * p0.y; 
  A2 = p3.y - p2.y;
  B2 = p2.x - p3.x; 
  C2 = A2 * p2.x + B2 * p2.y; 
  denominator = A1 * B2 - A2 * B1;
  float x =  (B2 * C1 - B1 * C2) / denominator;
  float y =  (A1 * C2 - A2 * C1) / denominator;
  return loc = new PVector(x, y);
}

