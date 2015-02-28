
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/93379*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
float[] x = new float[100];
float[] y = new float[100];
float f;
float gx;
float gy;

void setup() {
  size(712, 712);
  stroke(255);
  background(0);
}

void draw() {
  x[x.length-1] = mouseX;
  y[y.length-1] = mouseY;
  if(!mousePressed) {
  for(int i = 1; i < x.length-1; i++) {
    float dx = x[i+1] - x[i];
    float dy = y[i+1] - y[i];
    float angle = atan2(dy, dx) + 0.1;
    x[i] = x[i+1] - (cos(angle + (noise(y[i]/70, x[i]/70, f) - 0.5)/1));
    y[i] = y[i+1] - (sin(angle + (noise(x[i]/70, y[i]/70, f) - 0.5)/1));
  }
  line(x[1], y[1], x[2], y[2]);
  } else {
    background(0);
    for(int i = 0; i < x.length-1; i++) {
      x[i] = mouseX+random(0.1);
      y[i] = mouseY+random(0.1);
    }
    gx = mouseX;
    gy = mouseY;
  }
  f += 0.01;
}

