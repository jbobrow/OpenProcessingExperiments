

float[] x = new float[200];
float[] y = new float[200];
float[] x2 = new float[200];
float[] y2 = new float[200];

void setup() {
  size(300, 300);
  for (int i = 0; i < 100; i++) {
    x[i] = random(100, 200);
    y[i] = random(100, 200);
    x2[i] = random(50, 250);
    y2[i] = random(50, 250);
  }
}

void draw() {
  noStroke();
  background(67, 151, mouseX/2);
  
  for (int i = 0; i < 200; i++) {
    fill(247, 227, mouseX, 100);
    ellipse(x[i], y[i], mouseY/12, mouseX/12);
    fill(67, mouseX, 50, 50);
    ellipse(x2[i], y2[i], mouseX/8, mouseY/8);
  }
}



