
float x, y = 0;
float z = 400.0f;
float pf = 0.0f;
float br = 0.03f;
color col = color(80, 80, 255);
color col2 = color(255);
boolean add = true;
int localHold, apf = 0;
int g = 0;
void setup() {
  size(1280, 720, P2D);
  background(0);
  stroke(0, 0, 0, 5);
  frameRate(500000000);
}
void draw() {
  dispProgress(apf/1500.0f);
  x = random(-1, 1);
  y = random(-1, 1);
  if(apf<1500) {
  for(int i = 0; i < 10000; i++) {
  float v = random(10);
  if(v < 5) {
    x = x+noise(x+5802, y+4824, pf/30.0f+g*421)-.48;
    y = y+noise(y+5015+g*204, x+5209, -pf/30.0f)-.48;
  } else {
    float r2 = x*x+y*y;
    x = 0.7*x/r2;
    y = 0.7*y/r2;
  }
  PVector p = mapToScreen(x, y);
  int md = add?ADD:BLEND;
  color c4 = get((int)p.x, (int)p.y);
  c4 = blendColor(color(r(col)*br, g(col)*br, b(col)*br), c4, md);
  stroke(c4);
  //drawPoint(p);
  set((int)p.x, (int)p.y, c4);
  updatePixels();
  //drawPoint2(p, col);
  }
  apf++;
  }
  pf++;
}
void mousePressed() {
  background(0);
    col = color(random(205)+50, random(205)+50, random(205)+50);
    pf += 1300.402377;
    apf = 0;
    g++;
}
void keyPressed() {
  saveFrame("out.png");
}
void dispProgress(float amount) {
  int bars = int(amount*10.0f);
  noFill();
  stroke(255, 255, 255, 255);
  rect(5, 5, 300, 30);
  fill(255, 255, 255, 255);
  for(int i = 0; i < bars; i++)
    rect(i*30+10, 10, 20, 20);
}
void drawPoint(PVector p) {
  point(p.x, p.y);
}
void drawPoint2(PVector p, color c) {
 col2 = get((int)p.x, (int)p.y);
 set((int)p.x, (int)p.y, color(r(col2)+r(c)*br, g(col2)+g(c)*br, b(col2)+b(c)*br));
}
PVector mapToScreen(float x, float y) {
  return new PVector(x*z+width/2, y*z+height/2);
}
float rotX(float x, float y, float theta) {
  return x*cos(theta)-y*sin(theta);
}
float rotY(float x, float y, float theta) {
  return x*sin(theta)+y*cos(theta);
}

int r(color c) {return (c >> 16) & 255; }
int g(color c) {return (c >> 8) & 255;}
int b(color c) {return c & 255; }

