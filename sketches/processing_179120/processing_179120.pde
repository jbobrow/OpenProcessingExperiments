
float GRAVITY = 3;
float FRICTION = 0.999;
int Length = 50;

float[] X = new float[Length];
float[] Y = new float[Length];
float[] Spx = new float[Length];
float[] Spy = new float[Length];
float[] Radius = new float[Length];

void setup() {
  size(400, 400);
  colorMode(HSB, Length);
  background(Length - 1);
  frameRate(10);

  for (int i=0; i<Length; i++) {
    X[i] = width / 2;
    Y[i] = 10;
    Spx[i] = random(-20, 20);
    Spy[i] = random(-30, 0);
    Radius[i] = random(5, 20);
  }
}

void draw() {
  fadeToWhite();
  moveBalls();

  for (int i=0; i<Length; i++) {
    noStroke();
    fill(i, Length*0.6, Length-1);
    ellipse(X[i], Y[i], Radius[i]*2, Radius[i]*2);
  }
}

void moveBalls() {
  for (int i=0; i<Length; i++) {
    Spy [i] = Spy [i] + GRAVITY;
    X[i] = X[i] + Spx[i];
    Y[i] = Y[i] + Spy[i];

    bounce(i);
  }
}

void bounce(int i) {
  float bounceMinX = Radius[i];
  float bounceMaxX = width - Radius[i];
  float bounceMinY = Radius[i];
  float bounceMaxY = height - Radius[i];

  if (X[i] < bounceMinX || X[i] > bounceMaxX) {
    Spx[i] = -Spx[i] * FRICTION;
    if (abs(Spx[i]) < 1) Spx[i] = 0;
    if (X[i] < bounceMinX) X[i] = bounceMinX - (X[i] - bounceMinX);
    if (X[i] > bounceMaxX) X[i] = bounceMaxX - (X[i] - bounceMaxX);
  }

  if (Y[i] < bounceMinY || Y[i] > bounceMaxY) {
    Spy[i] = -Spy[i] * FRICTION;
    if (abs(Spy[i]) < GRAVITY) Spy[i] = 0;
    if (Y[i] < bounceMinY) Y[i] = bounceMinY - (Y[i] - bounceMinY);
    if (Y[i] > bounceMaxY) Y[i] = bounceMaxY - (Y[i] - bounceMaxY);
  }
}

void fadeToWhite() {
  noStroke();
  fill(Length-1, Length*0.3);
  rectMode(CORNER);
  rect(0, 0, width, height);
}



