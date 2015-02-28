
int numArray = 100;
float[] x = new float[numArray];
float[] y = new float[numArray];
float[] x2 = new float[numArray];
float[] y2 = new float[numArray];
float[] x3 = new float[numArray];
float[] y3 = new float[numArray];
float[] x4 = new float[numArray];
float[] y4 = new float[numArray];

void setup() {
  size(497,373);
  colorMode(HSB, 360, 1, 1);
    noCursor();
    noStroke();
}
void draw() {
  background(#ff008f);
  int m=millis()/900;
  fill(random(360), random(360), random(360),random(360));
  for (int i = 0; i < x.length; i++) {
    x[i] = random(0, width);
    y[i] = random(0, height);
    x2[i] = random(0, width);
    y2[i] = random(0, height);
    x3[i] = random(0, width);
    y3[i] = random(0, height);
    x4[i] = random(0, width);
    y4[i] = random(0, height);
  }
  for (int i=0; i < x.length; i++) {
rect(x[i],y[i],m,m);
    if (x[i] > width) {
      frameRate(60);
      x[i] = random(-1, width);
    }
    if (y[i] > height) {
      frameRate(60);
      x[i] = random(-1, height);
    }
  }
}
