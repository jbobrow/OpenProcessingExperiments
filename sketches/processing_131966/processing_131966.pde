
PVector[] points = new PVector[4];
float x, y, destx, desty, r, startx, starty, rval, d;
int i=0;

void setup() {
  size(500, 500);
  fill(255, 0, 0);
  noStroke();  
  int edge = 150;
  rectMode(CENTER);

  points[0] = new PVector(edge, edge);
  points[1] = new PVector(width-edge, edge);
  points[2] = new PVector(width-edge, height-edge);
  points[3] = new PVector(edge, height-edge);

  x = points[0].x;
  y = points[0].y;

  destx = points[1].x;
  desty = points[1].y;

  startx = x;
  starty = y;

  //d = 2;
}
void draw() {
  //background(255);
  stroke(255, 200);
  fill(#202020, 150);
  float sz = width/5;
  float v = 0;

  x = lerp(x, destx, 0.1);
  y = lerp(y, desty, 0.1);

  d = dist(x, y, destx, desty);
  if (d < 1) {
    d = 2;
    i++;
    x = destx;
    y = desty;
    //if (i==2) noLoop();
    destx = points[i%4].x;
    desty = points[i%4].y;
    startx = x;
    starty = y;
  }
  if (i%2==0) {
    rval = radians(map(y, starty, desty, 0, 180));
  }
  else {
    rval = radians(map(x, startx, destx, 0, 180));
  }
  pushMatrix();
  translate(x, y);
  rotate(r);
  rect(0, 0, sz, sz);
  popMatrix();
  r = rval;
}

void keyPressed() {
  save(random(2323)+".png");
}
