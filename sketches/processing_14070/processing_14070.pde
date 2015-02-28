
int count = 4000;

float t = 0, dt = 0.01;
float spinSpeed = 75 * 0.01/dt;

int seed;

void setup() {
  size(300, 300);
  colorMode(HSB, TWO_PI, 1.0, 1.0, 1.0);
  smooth();
  
  background(#ffffff);
  
  seed = (int) random(2531, 15824);
  noStroke();
}

void draw() {
  clear(t);
  
  randomSeed(seed);
  
  for (int i = 0; i < count; i++) {
    particle(t);
  }
  
  t += dt;  
}

void particle(float t) {
  /*float r = random(0, 1);
  float a = random(0, TWO_PI);
  float x = r * cos(a);
  float y = r * sin(a);
  
  float rr = 1.5 * r * sin(r + t) + x * y;
  float aa = TWO_PI * sin(t) * cos(a + t) + cos(x * t * t);
  float d = 2;//abs(5 - 5 * rr);
  
  float xx = rr * cos(aa);
  float yy = rr * sin(aa);*/
  
  float x = random(-1, 1);
  float y = random(-1, 1);
  float r = dist(0, 0, x, y);
  float a = atan2(y, x);
  
  float xx = x * cos(t - y);
  float yy = sin(y * t);
  float rr = dist(0, 0, xx, yy);
  float aa = atan2(yy, xx);
  
  float mx = map(mouseX, 0, width, -1, 1);
  float my = map(mouseY, 0, height, -1, 1);
  
  stroke(
    (aa - a + TWO_PI * 100) % TWO_PI,
    1,
    1 * 0,
    0.1 + 0.1 * cos(aa + t)
  );
  
  float d;
  //d = abs(8 - 5 * dist(mx, my, xx, yy));
  d = 1 + 5 * dist(xx, yy, 0, 0);
  strokeWeight(d);
  
  float spin = random(-spinSpeed, spinSpeed) * t + random(0, PI);
  
  float px = map(xx, -1, 1, 0, width);
  float py = map(yy, -1, 1, 0, height);
  
  line(
    px - d * cos(spin),
    py - d * sin(spin),
    px + d * cos(spin),
    py + d * sin(spin)
  );
}

void clear(float t) {
  noStroke();
  fill(t/3 % TWO_PI, 0.05, 1, 0.05);
  rect(0, 0, width, height);
}



