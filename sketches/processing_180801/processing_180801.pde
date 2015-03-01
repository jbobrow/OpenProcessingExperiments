
int frames = 120, s=10;
float theta;
 
void setup() {
  size(750, 500);
  strokeWeight(3);
  strokeJoin(ROUND);
  colorMode(HSB,360,100,100);
}
 
void draw() {
  background(#202020);
  noStroke();
  for (int i=0; i<s; i++) {
    noFill();
    fill(360.0/s*i,90,100,150);
    stroke(360.0/s*i,90,90);
    pushMatrix();
    translate(width/2, height/2);
    rotate(i*TWO_PI/s);
    drawTri();
    popMatrix();
  }
  //filter(BLUR,.6);
  theta -= TWO_PI/frames;
  //if (frameCount%2==0 && frameCount<=frames) saveFrame("image-###.gif");
}
 
void drawTri() {
  float x = 0;
  float y = 0;
  float d = 100;
  float p1x = x-d;
  float p1y = y;
  float p2x = x;
  float p2y = y-d;
  float p3x = p2x + cos(theta)*d;
  float p3y = p2y + sin(theta)*d;
  triangle(p1x, p1y, p2x, p2y, p3x, p3y);
}
