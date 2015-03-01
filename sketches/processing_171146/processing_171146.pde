
Blop[] b;
int n = 6;

void setup() {
  frameRate(60);
  size(800, 800);
  background(244);
  noFill();
  stroke(0);
  strokeWeight(2);
  b = new Blop[n];
  for (int i = 0; i < n; i++) b[i] = new Blop(width*0.9*0.3, (TWO_PI/n)*i, n, 2);
}

void draw() {
  background(244);
  translate(width/2, height/2);
  ellipse(0, 0, width*0.9, height*0.9);
  for (int i = 0; i < n; i++) b[i].draw_();
}

class Blop {
  float xPos, yPos, radius, theta;
  int num, depth;
  Blop[] blops;

  Blop(float r, float t, int n, int d) {
    radius = r;
    theta = t;
    num = n;
    depth = d;

    float dTheta = TWO_PI/num;
    blops = new Blop[num];
    if (depth > 0) for (int i = 0; i < num; i++) blops[i] = new Blop(radius*0.3, dTheta*i, n-1, d-1);
  }

  void move() {
    xPos = sin(theta)*radius;
    yPos = cos(theta)*radius;
    theta += radians(3/(depth+1));
  }

  void draw_() {
    move();
    pushMatrix();
    translate(xPos, yPos);
    ellipse(0, 0, radius, radius);
    if (depth > 0) for (int i = 0; i < num; i++) blops[i].draw_();
    popMatrix();
  }
}

