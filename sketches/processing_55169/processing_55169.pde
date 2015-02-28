
//some global vairables

int marbleCount = 100;

float[] x = new float[marbleCount];
float[] y = new float[marbleCount];
float[] spdx = new float[marbleCount];
float[] spdy = new float[marbleCount];
float[] marbleColor = new float[marbleCount];
float[] gravity = new float[marbleCount];
float[] w = new float[marbleCount];
float[] h = new float[marbleCount];
float damping;
float friction;

void setup(){
  size(600, 600);
  smooth();
  for (int i = 0; i < marbleCount; i++){
    x[i] = 120;
    y[i] = 386;
    spdx[i] = random(0, 6);
    gravity[i] = 1;
    spdy[i] = random(-6, 0);
    w[i] = 5;
    h[i] = 5;
    damping = .8;
    friction = .9;
    marbleColor[i] = color(random(255), random(255), random(255), random(255));
  }
}

void draw(){
  backgr();
  
  for (int i=0; i<marbleCount; i++){
  noStroke();
  fill(marbleColor[i]);
  ellipse(x[i], y[i], w[i], h[i]);
  
  x[i] += spdx[i];
  spdy[i] += gravity[i];
  y[i] += spdy[i];
  
  if (x[i] > width-w[i]) {
    x[i] = width-w[i];
    spdx[i] *= -1;
  }
  
  if (x[i] < 0) {
    x[i] = 0;
    spdx[i] *= -1;
  }
  
  if (y[i] > height-120) {
    y[i] = height-120;
    spdy[i] *=-1;
    spdy[i] *= damping;
    
    spdx[i] *= friction;
  }
  
  if (y[i] < 0) {
    spdy[i] *= -1;
  }
  }
}

