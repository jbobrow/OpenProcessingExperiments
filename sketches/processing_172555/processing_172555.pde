
int feldGroesse = 300;
float[] x = new float[feldGroesse];
float[] y = new float[feldGroesse];
float[] r = new float[feldGroesse];
int fuellstand = 0;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(#57385c);
  if (fuellstand < x.length) {
    addCircle();
  }
  drawCircles();
}

void drawCircles() {
  fill(#ffedbc);
  stroke(#A75265);
  strokeWeight(3);
  
  int i = 0; 
  while (i < fuellstand) {
    ellipse(x[i], y[i], 2 * r[i], 2 * r[i]);
    i = i + 1;
  }
}

void addCircle () {
  float newX = random(width);
  float newY = random(height);
  float newR = random(3, 40);

  boolean istGueltig = true;
  int i = 0;
  while (i < fuellstand && istGueltig == true) {
    float distance = dist(newX, newY, x[i], y[i]);
    float minDistance = r[i] + newR;
    if (distance < minDistance) {
      istGueltig = false;
    }
    i = i + 1;
  }

 if (istGueltig == true) {
    x[fuellstand] = newX;
    y[fuellstand] = newY;
    r[fuellstand] = newR;

    fuellstand = fuellstand + 1;
  } else {
    addCircle();
  }
}

void mousePressed() {
  fuellstand = 0;
}

