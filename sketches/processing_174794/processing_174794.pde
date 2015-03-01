
int feldGroesse = 1000;
float[] x = new float[feldGroesse];
float[] y = new float[feldGroesse];
float[] d = new float[feldGroesse];
int fuellstand = 0;
 
void setup() {
  size(400, 400);
  smooth();
}
 
void draw() {
  background(0);
  if (fuellstand < x.length) {
    setNewCircle(0);
  }
  drawCircles();
}
 
 
void drawCircles() {
  fill(255);
  stroke(35,56,138);
  strokeWeight(3);
  
    
  int i = 0;
  while (i < fuellstand) {
    rect(x[i], y[i], d[i], d[i]);
    i = i + 1;
  }
}
 
void setNewCircle (int recursionCounter) {
  float newX = random(width);
  float newY = random(height);
  float newD = random(6, 80);
 
  boolean intersectionFound = false;
  int i = 0;
  while (i < fuellstand && intersectionFound == false) {
    float distance = dist(newX, newY, x[i], y[i]);
    float minDistance = 0.5*(d[i] + newD);
    if (distance < minDistance) {
      intersectionFound = true;
    }
    i = i + 1;
  }
 
  if (recursionCounter <= 10 && intersectionFound == true) {
    recursionCounter = recursionCounter + 1;
    setNewCircle(recursionCounter);
  }
  else if (intersectionFound == false) {
    x[fuellstand] = newX;
    y[fuellstand] = newY;
    d[fuellstand] = newD;
 
    fuellstand = fuellstand + 1;
  }
}
 
void mousePressed() {
  fuellstand = 0;
}

