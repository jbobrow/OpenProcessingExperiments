
float[] x = new float[50];
float[] y = new float[50];

void setup() {
  size(300, 300);
  smooth();
  frameRate(15);
}


void draw() {
  background(25, 155, 15);

  for (int i=0; i < 50; i++) {
    x[i] = random(width); 
    y[i] = random(height); 


    fill (random(255), random(255), random(255)); 
    arc(x[i], y[i], 50, 50, -PI, 2.3); 
    fill(0); 
    arc(x[i] -5, y[i] -12, 5, 10, -PI, 2.3);
  }
}


