
int n = 100;
float[] x = new float[n];
float[] y = new float[n];
float[] shift = new float[n];
color[] c = new color[n];

int d = 20;

void setup() {
  size(600, 200);
  for (int i = 0; i < n; i++) {
    x[i] = random(width);  
    y[i] = random(width);  
    shift[i] = random(-5, +5);  
    c[i] = color(random(255), random(255), random(255), random(255)) ;  
  }
}

void draw() {
  background(255);
  for (int i = 0; i < n; i++) {
    noStroke();
    fill(c[i]);
    ellipse(x[i], y[i], d, d);
    x[i] += shift[i];
    y[i] += shift[i];
  }
}
