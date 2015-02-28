
int num = 25; // 25 variables

// arrays
float[] x = new float[num]; // x-coordinate
float[] y = new float[num]; // y-coordinate
float[] speed = new float[num]; // speed

void setup() {
  size(300, 300);
  smooth();

  // seed
  for (int i=0; i < num;i++) {
    x[i] = random(width);
    y[i] = i * (height/num);
    speed[i] = 1;
  }
}

void draw() {
  background(0);

  for (int i=0; i < num; i++) {
    stroke(255);
    line(x[i], 0, y[i], height);
    line(0, x[i], height, y[i]);

    x[i] = x[i] + speed[i];
    if (x[i] > width) {
      x[i] = 0;
    }
  }
}


