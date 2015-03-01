
float diag=100, l, theta; 
int sides=15, frames=150;

void setup() {
  size(540, 540);
  colorMode(HSB, 360, 100, 100);
  stroke(#eeeeee);
  noStroke();
}

void draw() {
  background(20);
  translate(width/2, height/2);
  for (int i=0; i<sides; i++) {
    fill(360.0/sides*i, 90, 100, 150);
    pushMatrix();
    rotate(TWO_PI/sides*i);
    l = map(sin(theta), -1, 1, 0, 200);
    translate(l, 0);
    pushMatrix();
    float r = map(sin(theta), -1, 1, -PI/2, PI);
    rotate(r);
    float x1 = 0;
    float y1 = 0;
    float x2 = diag/2;
    float y2 = -diag/2;
    float x3 = diag;
    float y3 = 0 ;
    float x4 = diag/2;
    float y4 = diag/2;
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    popMatrix();
    popMatrix();
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.png");
}

