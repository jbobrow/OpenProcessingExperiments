

int numPilotes = 15;
float midaPilotes;
color cPilota;
float[] X = new float[numPilotes];
float[] Y = new float[numPilotes];
float[] vX = new float[numPilotes];
float[] vY = new float[numPilotes];
float[] cP = new float[numPilotes];


void setup() {
  size(720, 576);
  // noCursor();

  for (int i = 0; i<numPilotes; i++) {
    X[i] = width/2;
    Y[i] = height/2;
    vX[i] = random(-10, 10);
    vY[i] = random(-10-10);
  }
}

void draw() {
  background(255);

  for (int i = 0; i<numPilotes; i++) {
    X[i] = X[i] + vX[i];
    Y[i] = Y[i] + vY[i];
    ellipse(X[i], Y[i], midaPilotes, midaPilotes);

//LIMITS
    if ((X[i]-midaPilotes/2<0) || (X[i]+midaPilotes/2>width)) {
      vX[i] = -vX[i];
    } else if ((Y[i]-midaPilotes/2<0) || (Y[i]+midaPilotes/2>height)) {
      vY[i] = -vY[i];
    }
  }
}

void mousePressed() {
  for (int i = 0; i<numPilotes; i++) {
    X[i] = random(width);
    Y[i] = random(height);
    vX[i] = random(-10, 10);
    vY[i] = random(-10-10);
    midaPilotes = random(5, 45);
    noStroke();
    fill(random(255),random(255),random(255));
  }
}

