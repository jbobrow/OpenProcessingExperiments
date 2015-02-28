
int xspacing = 10;
int w;

float theta = 0.0;
float amplitude = 50.0;
float period = 200.0;
float dx;
float[] yvalues;

void setup() {
  size(500, 500);
  smooth();
  w = width+20;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {
  theta += 0.01;
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  for (int x = 0; x < yvalues.length; x++) {
    stroke(0);
    fill(255, 80);
    noStroke();
    smooth();
    ellipse(x*xspacing, width/2+yvalues[x], 20, 20);
  }
}


