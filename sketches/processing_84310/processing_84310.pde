
int l = 100000;
float[] x = new float[l];
float[] y = new float[l];
color b = color(0);
float m = 1;
float n = 3;
float c = 10;
void setup() {
  size(512, 512, P2D);
  background(255);
  for(int i = 0; i < l; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
}
void draw() {
  background(255);
  rotatePoints();
  for(int i = 0; i < l; i++) {
    set((int)x[i], (int)y[i], b);
  }
}
void rotatePoints() {
  if(mousePressed) {
    for(int i = 0; i < l; i++) {
      float mx = x[i]-float(mouseX);
      float my = y[i]-float(mouseY);
      float r = dist(x[i]/m, y[i]/m, mouseX/m, mouseY/m);
      float tx = 0;
      float ty = 0;
      if(mouseButton==LEFT) {
        tx = cos(1/r*n)*mx-sin(1/r*n)*my;
        ty = sin(1/r*n)*mx+cos(1/r*n)*my;
      }else{
        tx = cos(-1/r*n)*mx-sin(-1/r*n)*my;
        ty = sin(-1/r*n)*mx+cos(-1/r*n)*my;
      }
      tx += float(mouseX);
      ty += float(mouseY);
      x[i] = tx;
      y[i] = ty;
      if(x[i]>width)
        x[i] = 0;
      if(x[i]<0)
        x[i] = width;
      if(y[i]>width)
        y[i] = 0;
      if(y[i]<0)
        y[i] = width;
    }
  }
}

