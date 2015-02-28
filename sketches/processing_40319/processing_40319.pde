
int partCount = 500;
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

PVector[] pos = new PVector[partCount];
PVector[] spd2 = new PVector[partCount];
float loopCounter, rate;

void setup() {
  size(1000, 500, P3D);
  background(255);
  noStroke();
  sphereDetail(10);

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
    cols1[i] = color(0,0, 0, 35);
    loc[i] = new PVector (random(0, 800), random(0, 800), random(-300, 300));
    spd[i] = new PVector();
    
    pos[i] = new PVector(width/2+random(-5, 5), height/2+random(-5, 5));
    spd2[i] = new PVector(random(-2.4, 3.9), random(-2.7, 3.7));
  }
  rate = 8;
}

void draw() {
  background(255);
  lights();

  for (int i=0; i<loopCounter; i++) {
    pos[i].add(spd2[i]);
    
    spd[i] = new PVector();
    pushMatrix();
    translate(x[i], y[i], loc[i].z);
    scale(mouseY*.005, mouseX*.003);
    fill(cols1[i]);
    rotateY(r[i]);
    sphere(20);
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
  if (loopCounter < partCount-rate){
    loopCounter += rate;
  }
}


