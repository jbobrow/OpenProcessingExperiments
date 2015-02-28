
PVector[] points = new PVector[4];
float x, y, destx, desty;
int i=0;

void setup() {
  size(500, 500);
  fill(255, 0, 0);
  noStroke();  

  points[0] = new PVector(100, 100);
  points[1] = new PVector(400, 100);
  points[2] = new PVector(400, 400);
  points[3] = new PVector(100, 400);

  x = points[0].x;
  y = points[0].y;

  destx = points[0].x;
  desty = points[0].y;
}
void draw() {
  background(255);
  ellipse(x, y, 20, 20);
  println(frameCount);
  
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
  if (d < 50) {    
    noFill();
    stroke(255, 0, 0);
    ellipse(x, y, 100-d, 100-d);
    fill(255, 0, 0);
    noStroke();
  }
  //if (frameCount % 4 == 0) saveFrame("image-####.gif");
  }



