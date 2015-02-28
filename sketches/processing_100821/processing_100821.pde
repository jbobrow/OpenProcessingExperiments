
void setup() {
  size(500, 500);
  smooth();
  noStroke();
  noCursor();
  colorMode(HSB);
  rectMode(CENTER);
  n = (long)random(10000);
}

boolean sketchFullScreen() {
  return true;
}

float xn, yn, zn;
float xstart;
long n;

void draw() {
  background(0);
  noiseSeed(n);
  xn=noise(n);  
  yn=noise(n);  
  xstart=xn;
  for (int i = 0; i <= width/10; i++) {
    yn+=.02;
    zn+=.02/40;
    xn = xstart;
    for (int j = 0; j <= height/10; j++) {
      xn+=.02;
      float rs = noise(xn, yn, zn)*15;
      fill(255/rs*3, 255, 255);
      rect(i*10+5, j*10+5, rs, rs);
    }
  }
}



