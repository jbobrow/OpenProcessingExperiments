
int numberOfParticles;
float particleSize = 10,
  midHeight = 0,
  angle = 0,
  frequency = 0.04,
  period = 30;
  
void setup() {
  size(800, 500);
  
  numberOfParticles = floor(width/particleSize) - 1;
  midHeight = height/2;
}

void draw() {
  background(255);
  noStroke();
  fill(0);
  
  angle += frequency;
  
  for (int i = 1; i <= numberOfParticles; i++) {
    float y = midHeight + 150 * sin(angle * i/period);
    ellipse(i * particleSize, y, particleSize, particleSize);
  }
}


