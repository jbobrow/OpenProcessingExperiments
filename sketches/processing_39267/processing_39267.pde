
int num = 395;
int or = 170;
int ir = 90;
PVector[] p = new PVector[num*2];

void setup() {
  size(400, 400);
  background(0);
  smooth();
  fill(random(255),random(255),random(255));
  noStroke();
  float a = TWO_PI/p.length;
  float x, y;
  for (int i = 0; i<p.length;i++) {
    if (i%2==1) {
      x = cos(i*a)*or;
      y = sin(i*a)*or;
    } 
    else {
      x = random(-or, or);
      y = random(-ir, ir);
    }
    p[i] = new PVector(x, y);
  }
  noLoop();
}

void draw() {
  translate(width/2, height/2);
  beginShape();
  for (int i = 0; i<p.length;i++) {
    vertex(p[i].x, p[i].y);
  }
  endShape(CLOSE);
}
