
PVector[] points = new PVector[4];
float x, y, destx, desty, r;
int i=0;

void setup() {
  size(500, 500);
  fill(255, 0, 0);
  noStroke();  
  int edge = 200;

  points[0] = new PVector(edge, edge);
  points[1] = new PVector(width-edge, edge);
  points[2] = new PVector(width-edge, height-edge);
  points[3] = new PVector(edge, height-edge);

  x = points[0].x;
  y = points[0].y;

  destx = points[0].x;
  desty = points[0].y;
}
void draw() {
  //background(255);
  stroke(255, 200);
  fill(#202020, 150);
  //float sz = random(width/5, width/10);
  //float sz = random(20,200);
  float sz = map(sin(r), -1, 1, width/10, width/4);
  float v = 0;
  //println(frameCount); 221

  x = lerp(x, destx, 0.1);
  y = lerp(y, desty, 0.1);

  float d = dist(x, y, destx, desty);
  if (d < 1) {
    x = destx;
    y = desty;
    i++;
    //if (i==5) noLoop();
    destx = points[i%4].x;
    desty = points[i%4].y;
  }

  pushMatrix();
  translate(x, y);
  rotate(r);
  rect(10+random(-v, v), -10+random(-v, v), sz, sz);
  popMatrix();

  r += 0.0523*2;

  //if (frameCount % 4 == 0) saveFrame("image-####.gif");
}

void keyPressed() {
  save(random(2323)+".png");
}

