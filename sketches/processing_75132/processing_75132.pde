
int num = 60;
int[] x = new int[num];
int[] y = new int[num];

color blue = color(95, 203, 241);
color yellow = color(239, 65, 54);


void setup() {
  size(1980/2, 1080/2, P2D);
  smooth();
  noStroke();
}

void draw() {
  //background(0);
  gradientRect(0, 0, width, height, blue, yellow);


  for (int i = x.length-10; i>0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  x[0] = mouseX;
  y[0] = mouseY;
  for (int i = 0; i < x.length; i++) {
    fill(i*4);
    ellipse(x[i], y[i], 40, 40);
  }
}
void gradientRect(int x, int y, int w, int h, color c1, color c2) {
  beginShape();
  fill(c1);
  vertex(x, y);
  vertex(x, y+h);
  fill(c2);
  vertex(x+w, y+h);
  vertex(x+w, y);
  endShape();
}
