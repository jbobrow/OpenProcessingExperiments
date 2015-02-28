
//Kim Sipkens
//PS3 Question 4

float x[] = new float[100];
float y[] = new float[x.length];
float speedX[] = new float[x.length];
float speedY[] = new float[x.length];
float dia[] = new float[x.length];

void setup() {
  size(400,400);
  
  for (int i = 0; i < x.length; i++) {
    x[i] = random(0,width);
    y[i] = random(0, height);
    
    speedX[i] = random(-3, 3);
    speedY[i] = random(-3, 3);
    
    dia[i] = random(50,300);
  }
}

void draw() {
  background(255);
  noFill();
  for(int i = 0; i < x.length; i++) {
    rect (x[i], y[i], dia[i],dia[i]);
    
    x[i] += speedX[i];
    y[i] += speedY[i];
    
    if (x[i] < -5 || x[i] > width) speedX[i] *= -1;
    if (y[i] < -5 || y[i] > height) speedY[i] *= -1;
  }
  
}

