
int r_s = 30;
int x;
int y;
float theta;

void setup() {
  size(450, 450);
  background(255);
  smooth();
}

void draw() {
  frame();
  noStroke();
  fill(255);
  rect(0, 0, r_s, r_s);

  x = (mouseX / r_s) * r_s;
  y = (mouseY / r_s) * r_s;


  fill(255 * abs(sin(theta)));
  rect(x, y, r_s, r_s);

  theta += 0.08;
  if (theta > TWO_PI) {
    theta = 0;
  }
}

void mousePressed() {
  background(255);
  frame();
}

void frame() {
  stroke(0);
  for (int i = r_s;i < width; i += r_s) {
    line(i, 0, i, height);
  }
  for (int j = r_s; j < height;j += r_s) {
    line(0, j, width, j);
  }
}

