

int numC = 3;
Shake[] s = new Shake[numC];

void setup() {
  size(500, 500);
  background(255);
  noStroke();
  smooth();
  for(int i = 0; i< s.length; i++) {
    s[i] = new Shake();
  }
}
 

void draw() {
  for(int i = 0; i < s.length; i++) {
    
    s[i].displayRect();
    s[i].calcWave();
    s[i].displayCircle();
  }
}

class Shake {
  float x;
  float y;
  float r, g, b;
  float radius;
  float theta;
  float dx, period;
  float[] yvalues;
  int timer;
  int w;
  
  Shake() {
    x = random(width);
    y = random(height);
    radius = 0;
    theta = 0.0;
    period = 500;
    dx = (TWO_PI/period) * 8;
    w = width + 16;
    timer = 0;
    yvalues = new float[w/8];
  }
  
  void calcWave() {
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.02;

    // For every x value, calculate a y value with sine function
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = sin(x)*75.0;
      x+=dx;
    }
  }
  
  void displayRect() {
    fill(255, 1); // semi-transparent white
    rect(0, 0, width, height);
  }
  
  void displayCircle() {
    fill(random(255), 20);
    for (int x = 0; x < yvalues.length; x++) {
      // x = (frameCount % width);
      
      if (millis() - timer >= 2000) {
        timer = millis();
        y = noise(frameCount * 0.1) * height;
      }
    
      // use frameCount and noise to change the red color component
      r = noise(frameCount * 0.01) * 255;
      // use frameCount and modulo to change the green color component
      g = frameCount % 255;
      // use frameCount and noise to change the blue color component
      b = 255 - noise(1 + frameCount * 0.025) * 255;
      // use frameCount and noise to change the radius
      radius = noise(frameCount * 0.01) * 100;
      color c = color(r, g, b);
      fill(c);
    
      ellipse(x * 8, y * yvalues[x], radius, radius);
    }
  }
}


