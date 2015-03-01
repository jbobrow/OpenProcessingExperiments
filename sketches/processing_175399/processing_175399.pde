
float x = random(1024);
float y = random(768);
int n = 2;
float xa = 0;
float ya =520;
float xb = 300;
float yb =0;
float xc = 600;
float yc = 520;

void setup() {
  size(600, 520, P2D);
  background(229,247,222);
  frameRate(500);
}

void draw(){
  stroke(98,162,180);
  n = int(random(1,4));
 
  
  if (n == 1) {
  x = x + ((xa-x)/2);
  }
  if (n ==2) {
  x = x + ((xb-x)/2);
  }
  if (n == 3) {
  x = x + ((xc-x)/2);
  }
   if (n == 1) {
  y = y + ((ya-y)/2);
  }
  if (n ==2) {
  y = y + ((yb-y)/2);
  }
  if (n == 3) {
  y = y + ((yc-y)/2);
  }
  point (x,y);
  
}
