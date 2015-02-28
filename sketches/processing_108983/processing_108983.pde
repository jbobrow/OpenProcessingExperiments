
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  size(800,600);
  background(255);
  smooth();    
}

void draw() {
  // Each time through draw(), new random numbers are picked for a new ellipse.
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(300);
  x = random(width);
  y = random(height);
  fill(r,g,b,a);
  // red
  if(r < 1){
    r = r + 1;
  }
  if(r > 255){
    r = r - 1;
  }
  // green
  if(g < 1){
    g = g + 1;
  }
  if(g > 255){
    g = g - 1;
  }
  // blue
  if(b < 1){
    b = b + 1;
  }
  if(b > 255){
    b = b - 1;
  }
  // alpha
  if(a < 1){
    a = a + 1;
  }
  if(a > 255){
    a = a - 1;
  }
  ellipse(x,y,diam,diam);
  if(diam > 100) {
    diam = diam - 1;
  }
  if(diam < 1) {
    diam = diam + 1;
  }
}


