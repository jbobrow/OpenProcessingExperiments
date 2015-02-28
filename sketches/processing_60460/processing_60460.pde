
double inc = 0.1;
float val0 = 0f, val1 = 0f;
float trans, angle;
float randomness = 0.0f;
float randInc = 0.01f;

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(30);
  noStroke();
  translate(width/2, height/2);
  fill(255, 127);
  int iterations = 50;
  int revolve = 10;
  trans = map(mouseX, 0, width, 0, 100);
  angle = map(mouseY, 0, height, -TWO_PI/float(iterations)*revolve, TWO_PI/float(iterations)*revolve);
  drawRect(iterations, iterations);
}

void drawRect(int iterations, int maxIterations) {
  if (iterations > 0) {
    float factor = iterations/float(maxIterations);

    translate(trans*(1-factor), trans*(1-factor));
    rotate((angle + random(-randomness, randomness))*factor);
    rect(0, 0, 50*(1-factor), 50*(1-factor));
    drawRect(iterations-1, maxIterations);
  }
}

void keyPressed() {
  switch(key) {
  case 'w':
    randomness+= randInc;
    break;
  case 's':
    randomness-= randInc;
    if (randomness < 0) randomness = 0;
    break;
  }
}


