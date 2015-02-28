
int numPoints = 23;
float[] x = new float[numPoints];
float[] y = new float[numPoints];

float[] xmove = new float[numPoints];
float[] ymove = new float[numPoints];

void setup() {
  size(800, 500);


  for (int i = 0; i < numPoints; i++) {
    x[i] = random(width);
    y[i] = random(height);
    xmove[i] = random(-2, 5);
    ymove[i] = random(-1, 4);
  }
}

void draw() {
  background(10);
  strokeWeight(1.5);
  stroke(300, 50, 80);
  for (int i = 0; i < numPoints-1; i++) {
    line( x[i], y[i], x[i+1], y[i+1]);
    x[i] += xmove[i];
    y[i] += ymove[i];
    
    if(x[i] < 0 || x[i] > width) xmove[i] *= -1;
    if(y[i] < 0 || y[i] > height) ymove[i] *= -1;
  }
    line( x[0], y[0], x[numPoints-1], y[numPoints-1]);
}



