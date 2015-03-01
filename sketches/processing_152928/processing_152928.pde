
// DISTANCIAS - CASEY REAS - PROCESS COMPENDIUM modified by Vanessa Lorenzo

float[] x, y;
float[] vx, vy;

void setup() {
  size(720, 450);
  x = new float[100];
  y = new float[x.length];
  vx = new float[x.length];
  vy = new float[x.length];

  for (int n = 0; n < x.length; n++) {
    x[n] = random(width);
    y[n] = random(height);
    vx[n] = random(-5, 5);
    vy[n] = random(-5, 5);
  }
  background(255,255,255);
}

void draw() { 
  //background(255, 255, 255);
  noFill();
  for (int n = 0; n < x.length; n++) {
    //ellipse(x[n], y[n], 100, 100);
    x[n] = x[n] + vx[n];
    y[n] = y[n] + vy[n];
    if (x[n] > width || x[n] < 5) {
      vx[n] = -1 * vx[n];
    }
    if (y[n] > height || y[n] < 5) {
      vy[n] = -1 * vy[n];
    }
  }
  
  for (int n = 0; n < x.length; n++) {
    for (int m = 0; m < x.length; m++) {
      float d = dist(x[n], y[n], x[m], y[m]);
      if (d < 50 + 50) {
        stroke(65, 2, 110, 80-d);
        line(x[n], y[n], x[m], y[m]);
      }
    } 
  }
  
  fill(255, 5*(1+sin(frameCount*0.01)));
  rect(0, 0, width, height);
}

