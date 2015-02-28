
int partCount = 1000;
float radius = 200;
float[] rots = new float [partCount];
float[] r = new float [partCount];
float[] x = new float[partCount];
float[] y = new float[partCount];
float[] xs = new float[partCount];
float[] ys = new float[partCount];
float[] w = new float[partCount];
float[] h = new float[partCount];
color[] cols1 = new color [partCount];
PVector[] loc = new PVector[partCount];
PVector[] spd = new PVector[partCount];


void setup() {
  size(800, 800, P3D);
  background(0);
  noStroke();

  float theta = 0;
  for (int i=0; i<partCount; i++) {
    theta += TWO_PI*5;
    rots[i] = theta;
    x[i] = random(0, 800);
    y[i] = random(0, 800);
    xs[i] = random(3, 6);
    ys[i] = random(3,6); 
    w[i] = random(30, 50);
    h[i] = random(30, 50);
    cols1[i] = color(random(255), random(255), random(255), 100);
    loc[i] = new PVector (random(0, 800), random(0, 800), random(-300, 300));
    spd[i] = new PVector();
  }
}

void draw() {
  background(0);
  lights();

  for (int i = 0; i<partCount; i+=1) {
    spd[i] = new PVector();
    pushMatrix();
    translate(x[i], y[i], loc[i].z);
    fill(cols1[i]);
    rotateY(r[i]);
    box(30, 30, 30);
    r[i]+=rots[i];
    x[i] += xs[i];
    y[i] += ys[i];

    if (x[i] > width - w[i]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      x[i] = width - w[i]/2;
      xs[i] *= -1;
    } 
    else if (x[i] < w[i]/2) {
      x[i] = w[i]/2;
      xs[i] *= -1;
    }


    if (y[i] > height - h[i]/2) {
      // invert speed sign (pos becomes neg and neg becomes pos)
      y[i] = height - h[i]/2;
      ys[i] *= -1;
    } 
    else if (y[i] < h[i]/2) {
      ys[i] *= -1;
    }
    popMatrix();
  }
}


