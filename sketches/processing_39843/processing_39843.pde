
int num = 50;
float[] y = new float[num];
float[] x = new float[num];

void setup() {
  size(400, 400);
  smooth();
  background(0);

  for (int i = 0; i < y.length; i++) {
    y[i] = random(height);
     for (int h = 0; h < x.length; h++) {
    x[h] = random(width);
  }
  }
}


void draw() {
  for (int i = 0; i<y.length;i++) {
    fill(random(x[i]),random(y[i]),60);
    ellipse(x[i], y[i], i, 10);
    y[i] = y[i]+1; 
    if (y[i] >= height) 
      y[i] = 0;
  }
}


