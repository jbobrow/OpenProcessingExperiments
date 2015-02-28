
Mimosrod[] mimosrody;

void setup() {
  size(512, 512);
  noSmooth();
  mimosrody = new Mimosrod[40];
  randomSeed(1);
  for(int i=0; i<mimosrody.length; ++i)
    mimosrody[i] = new Mimosrod();
}

float theta1=0.0f, theta2=0.0f;
float delta1=0.11f, delta2=0.17f;
float radius1=233.0f, radius2=260.0f;

void draw() {
  background(0);
  
  noStroke();
  fill(255, 15);
  
  for(int i=0; i<mimosrody.length; ++i) {
    mimosrody[i].step();
    mimosrody[i].render();
  }
  
  loadPixels();
  for(int i=width*height-1; i>=0; --i) {
    boolean c = (
      int((i % width) / 32) % 2 ==
      int((i / width) / 32) % 2
    );
    pixels[i] = color(
      (red(pixels[i]) % 32 > 15) ? (c ? 0 : 128) : (c ? 255 : 192)
    );
  }
  updatePixels();
}


class Mimosrod {
  float x, y, innerRadius, outerRadius, theta, delta;
  
  Mimosrod() {
    int d = min(width, height);
    outerRadius = random(d - 10) + 10;
    innerRadius = random(outerRadius - 5) + 4;
    x = random(width - outerRadius - outerRadius) + outerRadius;
    y = random(height - outerRadius - outerRadius) + outerRadius;
    theta = random(TWO_PI);
    delta = random(1) + 0.005f;
    delta *= delta;
    delta *= 0.15f;
    if(random(2) < 1) delta *= -1.0f;
  }
  
  void step() {
    theta += delta;
  }
  
  void render() {
    float r = (outerRadius - innerRadius) * 0.5f;
    ellipse(
      sin(theta) * r + x,
      cos(theta) * r + y,
      innerRadius, innerRadius
    );
  }
};
