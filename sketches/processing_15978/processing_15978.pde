
float r;
float g;
float b;
float a;
float diam;
float x;
float y;
void setup() {
  size(500,500);
  background(0);
  smooth();
  frameRate(300);
  noLoop();
  fill(249,250,15);
  ellipse(width/2,height/2,9,9);
}
void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  float r1 = random(200);
  float r2 = random(TWO_PI);
  float x1 = width/2 + cos( r2 )*r1;
  float y1 = height/2 + sin( r2 )*r1;
  float diam = random(20);
  noStroke();
  fill(r,g,b,a);
  ellipse(x1,y1,diam,diam);
}

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}


