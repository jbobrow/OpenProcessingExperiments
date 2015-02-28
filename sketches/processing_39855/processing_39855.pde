
//Ryan Coleman
//Homework 6.1
//Sept 28.11

int num = 200;

float[] X = new float[num];
float[] Y = new float[num];
color[] C = new color[num];

void setup () {

  size (500, 500);
  background(0);
  colorMode(HSB, width);
  noStroke();
  smooth();

  for (int i = 0; i < num; i++) {
    X[i] = random (0, 10);
    Y[i] = random (0, 10);
  }
}

void draw () {

  for (int i = 0; i < num; i++) {
    
    fill(mouseX, width, width);

    pushMatrix();

    translate(mouseX, mouseY);
    rotate(frameCount * radians(i));

    translate(mouseX, mouseY);
    rotate(radians(i));

    ellipseMode(CENTER);
    ellipse(mouseX, mouseY, X[i], Y[i]);

    popMatrix();
  }
}

