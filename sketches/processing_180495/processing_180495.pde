
int starCount = 100;

float[] x = new float[starCount];
float[] y = new float[starCount];
float[] speed = new float[starCount];

void setup() {
  size(400, 400);
  background(0);
  noStroke();
  
  int i = 0;
  while(i < starCount) {
    x[i] = random(0, width);
    y[i] = random(0, height);
    speed[i] = random(1, 5);
    i = i + 1;
  }
}

void draw() {
  background(0);
    
  int i = 0;
  float a = 0;
  while(i < starCount) {
    float radius = speed[i]*1.9;
    ellipse(x[i], y[i], radius, radius);
    
    x[i] = x[i] - speed[i] * (mouseX*0.004+1);
    if(x[i] < 0) {
      x[i] = width;
    }
    i = i + 1;
    a = a + 0.01;
  }
  
}

