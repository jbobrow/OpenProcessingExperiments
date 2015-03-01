
float A = 1.0;
float K = 8.0;
float B = 9.0;
float t = 0.0;
float step = 1;
float Btarget = 9.0;

float wave(float x) {
  return A*pow(K/(K+pow(x, 4)), K)*cos(B*x-t);
}


void setup() {
  size(512, 512);
}

void draw() {
  background(200);
  float lastx = 0.0;
  float lasty = height/2.0;
  for (float x=0; x<width; x+=step) {
    float tmpx = map(x, 0, width, -3, 3);    
    float tmpy = wave(tmpx);
    float y = map(tmpy, -3, 3, 0, height);
    line(lastx, lasty, x, y);
    lastx = x;
    lasty = y;
  }
  t += 0.3;  
  B += (Btarget-B)/10;
}

void mousePressed() {
  Btarget=random(2, 10);
}

