
float[] x = new float[1000];
float[] y = new float[1000];
void setup() {
  size(500,500);
  for (int p = 0; p < x.length; p++) {
    x[p]=random(width);
    y[p]=random(height);
  }
}
void draw() {
  for (int p = 0; p < x.length; p++) {
    x[p]++;
    ellipse(x[p],y[p],6,5);
    y[p]++;
    ellipse(x[p],y[p],7,8);
  }
}
