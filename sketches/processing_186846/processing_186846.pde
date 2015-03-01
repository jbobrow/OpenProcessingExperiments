
float t         = 0;
float amplitude = 60;
float radius    = 10;
float speed     = PI / 36.F;
int   sign      = -1;

void setup() {
  size(600, 440);
  background(0);
  frameRate(10);
  smooth();
}

void draw() {
  translate(width / 2, height / 2);
  float x = amplitude * (2 * cos(t) - cos(2 * t));
  float y = sign * amplitude * (2 * sin(t) - sin(2 * t));
  
  stroke(0, 0, 128);
  line(0, 0, x, y);
  
  noStroke();
  fill(random(0, 256), random(0, 256), random(0, 256));
  ellipse(x, y, radius, radius);
  
  t += speed;
  if (abs(t) >= 2 * PI) {
    t     = 0;
    sign *= -1;
    background(0); 
  }
}
