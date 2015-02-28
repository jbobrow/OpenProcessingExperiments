
int val = 400;
float[] x = new float[val];
float[] y = new float[val];

int count = 0;

float hue = random(360);
float w = random(1, 2);

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  x[0] = random(10, width-10);
  y[0] = random(10, height-10);

  for (int i = 0; i < val - 1 ;i++) {
    calc(i);
  }
}

void draw() {
  strokeWeight(w);
  stroke(hue + random(-60, 60), 100, 100, 50);
  line(x[count], y[count], x[count+1], y[count+1]);

  count++;
  if (count > val - 2) {
    x[0] = random(10, width-10);
    y[0] = random(10, height-10);

    for (int i = 0; i < val - 1 ;i++) {
      calc(i);
    }
    hue = random(360);
    w = random(1, 2);
    count = 0;
  }
}



void calc(int i) {
  x[i+1] = x[i] + random(-10, 10);
  y[i+1] = y[i] + random(-10, 10);

  if (x[i+1] > width || x[i+1] < 0 || y[i+1] > height || y[i+1] < 0) {
    x[i+1] = x[i];
    y[i+1] = y[i];

    calc(i);
  }
}


