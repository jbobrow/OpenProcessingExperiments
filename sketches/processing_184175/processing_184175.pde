
float[] x = new float[100];
float[] y = new float[100];
float[] z = new float[100];
float[] zm = new float[100];
float[] c = new float[255];

void setup() {
  size(700, 700, P3D);
  background(255);
  noStroke();
  colorMode(HSB);
  for (int i = 0; i < x.length; i++) {
    x[i] = random(200);
    y[i] = random(200);
    z[i] = random(-550, 0);
    c[i] = random(240);
    zm[i] = random(-550, 0);
  }
}

void draw() {
  background(255);
  lights();
  for (int i = 0; i < x.length; i++) {
    fill(255, 220, c[i]);
      
    z[i] = lerp(z[i], zm[i], 0.04);
    translate(x[i]-100, y[i]-100, z[i]-100);
    box(10);
    float d = dist(x[i], y[i], z[i], x[i], y[i], zm[i]);
    resetMatrix();
    
    
    if (d < 10) {
      zm[i] = random(-250, 0);
    }
  }
}

