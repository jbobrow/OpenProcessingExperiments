
int r = 250;

int lineCount = 200;

float[] x1 = new float[lineCount];
float[] y1 = new float[lineCount];
float[] x2 = new float[lineCount];
float[] y2 = new float[lineCount];

void setup() {

  smooth();
  size(600, 600);
  background(0);
  strokeWeight(2);

  colorMode(HSB, 360, 100, 100);

  yarnIt();
}

void draw() {

  background(0);

  translate(width/2, height/2);
  rotate(map(mouseY, 0, height, 0, PI));

  float c = map(mouseX, 0, width, 0, 360);

  for (int i = 0; i < lineCount; i++) {

    stroke(c + random(-20, 20), 100, 100);
    line(x1[i], y1[i], x2[i], y2[i]);
  }
}

void yarnIt() {
  for (int i = 0; i < lineCount; i++) {

    float theta1 = random(TWO_PI);
    float theta2 = random(TWO_PI);

    x1[i] = r * cos(theta1);
    y1[i] = r * sin(theta1);

    x2[i] = r * cos(theta2);
    y2[i] = r * sin(theta2);
  }
}

void mousePressed() {
  yarnIt();
}

