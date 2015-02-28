
int nbolas =600;
float[] x = new float[nbolas];
float[] y = new float[nbolas];
float[] t = new float[nbolas];
void setup () {
  size (600, 600);
  for (int i = 0; i < nbolas; i++) {
    x[i] = random(width);
    y[i] = random(height);
    t[i] = random(2, 30);
  }
}
void draw() {
  background(500);
  for (int i = 0; i <nbolas ; i++) {
    y[i]++;
    if (y[i]>5) {
      fill(0);
    }
    else {
      fill(60);
    }
    ellipse(x[i], y[i], t[i], t[i]);
    if (y[i]>height) {
      y[i] = 0;
    }
  }
}

