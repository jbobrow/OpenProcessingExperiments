
color[] cols = {
  #0F4155, #288791, #87CD89, #F04132, #FCB123
};

void setup() {
  size(600, 400);
  int num = 500;
  int sides = 5;
  float radius;
  float alpha = 255;
  strokeWeight(1);

  for (int i = 0; i < num; i++) {
    alpha -= .1;
    //alpha = 100;
    float angle = random(TWO_PI);
    radius = random(30, 60);
    int r = int(random(0, 5));
    color col = cols[r];
    polygon(sides, radius, angle, alpha, col);
  }
}

void draw() {}

void mouseClicked() {
setup();
}


void polygon(int sideCount, float radius, float angle, float _alpha, color _col) {
  float theta = angle;
  float alpha = _alpha;
  float x = random(width);
  float y = random(height);
  color col = _col;
  fill(col,alpha);

  beginShape();
  for (int i=0; i<sideCount;i++) {
    x = x + cos(theta) * radius;
    y = y + sin(theta) * radius;
    vertex(x, y);
    theta += TWO_PI/sideCount;
  }
  endShape(CLOSE);
}
