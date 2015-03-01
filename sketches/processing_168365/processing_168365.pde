
int numLines = 12;
float[] x = new float[numLines];
float[] speed = new float [numLines];
float offset = 8;

void setup() {
  size(300,300);
  background(60, 90, 200);
  smooth();
  strokeWeight(10);
  stroke(100, 100, 250, 70);
  for (int i = 0;
  i < numLines; i++) {
    x[i] = i;
    speed[i] = 0.1 + (i/offset);
  }
}

void draw() {
  background(104, 60, 70);
  for (int i =0; i < x.length; i++) {
    x[i] += speed[i];
    if (x[i] > (width +offset)) {
     x[i] = -offset *2;
  }
  float y = i *offset;
  line(x[i], y, x[i]+offset, y+offset);
}
}



