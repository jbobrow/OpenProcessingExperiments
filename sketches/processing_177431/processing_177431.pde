
int frames = 240, s=4;
float theta;

void setup() {
  size(500, 500);
  strokeWeight(3);
  strokeJoin(ROUND);
}

void draw() {
  background(#A50813);
  stroke(255);
  //noStroke();
  fill(255);
  noFill();
  for (int i=0; i<s; i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(i*TWO_PI/s);
    drawTri();
    popMatrix();
  }
  filter(BLUR,1);
  theta -= TWO_PI/frames;
  //if (frameCount%2==0 && frameCount<=frames) saveFrame("image-###.gif");
}

void drawTri() {
  float x = 0;
  float y = 0;
  float d = 110;
  float p1x = x-d;
  float p1y = y;
  float p2x = x;
  float p2y = y-d;
  float p3x = p2x + cos(theta)*d;
  float p3y = p2y + sin(theta)*d;
  triangle(p1x, p1y, p2x, p2y, p3x, p3y);
}

