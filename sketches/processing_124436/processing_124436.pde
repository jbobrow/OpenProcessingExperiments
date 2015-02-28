
float a, b, t, stepa, stepb, lastx, lasty, x, y, noisea, noiseb, step;

void setup() {
  size(600, 400); 
  background(255);
  smooth(); 
  stroke(20, 50, 70);
  strokeWeight(5);
  a = 0;
  b = 0;
  t = 0;
  stepa = 0.2;
  stepb = 0.1;
  x = width/2;
  y = height/2;
  noisea = random(10);
  noiseb = random(10);
  step = 200;
}


void draw() {
  lastx = x;
  lasty = y;  
  float mya = a + (noise(noisea) - 0.5) * step;
  float myb = b + (noise(noiseb) - 0.5) * step;
  // chaos
  // mya = a + (random(1) - 0.5) * step;
  // myb = b + (random(1) - 0.5) * step;
  // order
  // mya = a;
  // myb = b;
  x = width/2 + mya * cos(t);
  y = height/2 + myb * sin(t);

  line(x, y, lastx, lasty);

  t = t + radians(1); 
  a = a + stepa;
  b = b + stepb;
  noisea = noisea + 0.05;
  noiseb = noiseb + 0.05;
  
}



