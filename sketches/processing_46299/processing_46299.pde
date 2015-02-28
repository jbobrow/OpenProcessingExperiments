
int xspacing = 10;  
int w;              
float theta = 0.0;  
float amplitude = 150.0;  
float period = 500.0;  
float dx; 
float[] yvalues; 

void setup() {
  size(600, 200);
  frameRate(30);
  colorMode(HSB, 100);
  smooth();
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {
  theta += 0.05;

  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  for (int i = 0; i < 10; i++) {
    for (int x = 0; x < yvalues.length; x++) {
      stroke(10*i, 100, 100, 80);
      strokeWeight(4);
      line((x-5+i)*xspacing, height/2+yvalues[x]/2, (x+5)*xspacing, height/2+yvalues[x]/2);
    }
  }
}


