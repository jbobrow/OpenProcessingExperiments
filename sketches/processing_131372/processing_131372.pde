
//growing b&w spiral with noise

float r = 5;
float theta = 0;
float time = 0.0;
float increment = 0.01;

void setup() {
  size(800,800);
  background(255);
  smooth();
}

void draw() {
  float x = r * cos(theta); // cos(0) = 1
  float y = r * sin(theta); // sin(0) = 0
  noStroke();
  fill(random(255));
  float n = (noise(time) * width)/10;
  time += increment;
  ellipse(x+width/2, y+height/2, n, n);
  theta += 0.01;
  r += .1;
}


