
int xspacing = 36;
int w;

float theta = 0.0;
float amplitude = 50.0; 
float period = 500.0;
float dx;
float d = 3;
float[] yvalues;

void setup() {
  size(500, 360);
  w = width;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {
  theta += 0.04;

  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  
  for (int x = 0; x < yvalues.length; x++) {
    stroke(255);
    strokeWeight(8);
    line(x*xspacing+xspacing, height/2+yvalues[(x+d)%yvalues.length], x*xspacing+xspacing, height/2+yvalues[x]);
  }
}

