
Leaf[] leaf = new Leaf[24];
 
float r = 120;//radius of outer edges of leaves
 
void setup() {
  size(600, 500);
  colorMode(HSB, 100);
  float angle = radians(360/(leaf.length));
  for (int i=0; i < leaf.length; i++) {
    float x = cos(angle*i)*r*2;
    float y = sin(angle*i)*r*2;
    float x2 = cos(angle*i)*r;
    float y2 = sin(angle*i)*r;
    leaf[i] = new Leaf(x, y, x2, y2);
  }
}
 
void draw() {
  background(10);
  translate(width/2, height/2);
 
  for (int i = 0; i < leaf.length; i++) {
    leaf[i].update();
    leaf[i].display();
  }
}
 
PVector rand(float n) {
  float x = random(n/2.0, n);
  float y = random(n/2.0, n);
  float r1 = random(-1, 1);
  if (r1 < 0) {
    x *= -1;
  }
  float r2 = random(-1, 1);
  if (r2 < 0) {
    y *= -1;
  }
  PVector r = new PVector(x, y);
  return r;
}
 
 
 
class Leaf {
  PVector sp0, sp1, sp2, sp3;//static locations
  PVector p0, p1, p2, p3, shift;//moving locations
  float cx, cy, p0x, p0y, p1x, p1y, p2x, p2y, p3x, p3y;//variables used for lerp
  float[] n;
  float[] c;
  float l;//lerp speed
 
  Leaf(float _x, float _y, float _x2, float _y2) {
    p0 = new PVector(0, 0);
    sp0 = p0;
    p1 = new PVector(_x2, _y2);
    sp1 = p1;
    p2 = new PVector(_x2, _y2);
    sp2 = p2;
    p3 = new PVector(_x, _y);
    sp3 = p3;
 
    shift = rand(10);
    n = new float[12];
    c = new float[12];
    for (int i = 0; i < n.length; i++) {
      n[i] = (1/(n.length*0.9))*i;
      c[i] = random(40, 80);
    }
    l = 0.04;
    p1x = p1.x;
    p1y = p1.y;
    p2x = p2.x;
    p2y = p2.y;
    p3x = p3.x;
    p3y = p3.y;
    cx = shift.x;
    cy = shift.y;
    shift = rand(10);
    p1x = lerp(p1x, p1.x, l);
    p1y = lerp(p1y, p1.y, l);
    p2x = lerp(p2x, p2.x, l);
    p2y = lerp(p2y, p2.y, l);
    p3x = lerp(p3x, p3.x, l);
    p3y = lerp(p3y, p3.y, l);
  }
 
  void update() {
    if (frameCount % 160 == 0) {
      shift = rand(10);
    }
    float r = random(1);
    if (r < 0.002 || frameCount % 80 == 0) {
      PVector r1 = rand(20);
      PVector r2 = rand(20);
      PVector r3 = rand(20);
      p1 = PVector.add(sp1, r1);
      p2 = PVector.add(sp2, r2);
      p3 = PVector.add(sp3, r3);     
    }
    p1x = lerp(p1x, p1.x, l);
    p1y = lerp(p1y, p1.y, l);
    p2x = lerp(p2x, p2.x, l);
    p2y = lerp(p2y, p2.y, l);
    p3x = lerp(p3x, p3.x, l);
    p3y = lerp(p3y, p3.y, l);
    cx = lerp(cx, shift.x, l);
    cy = lerp(cy, shift.y, l);
  }
 
  void display() {
    for (int i = 0; i < 10; i++) {
      noFill();
      stroke(c[i], 50, 70, 50);     
      strokeWeight(1);
      bezier(p0x, p0y, p1x + cx*i, p1y + cy*i, p2x + cx*i, p2y + cy*i, p3x, p3y);
      //B(t)=(1-t)^3 *p1 + 3*(1-t)^2 *t*p2 + 3(1-t)*t^2 *p3 + t^3 *p4  the "bezier formula"
      float xe1 = pow((1-n[i]), 3)*p0.x;
      float xe2 = 3*pow((1-n[i]), 2)*n[i]*(p1x + cx*i);
      float xe3 = 3*(1-n[i])*pow(n[i], 2)*(p2x + cx*i);
      float xe4 = pow(n[i], 3)*p3x;
      float x = xe1 + xe2 + xe3 + xe4;
      float ye1 = pow((1-n[i]), 3)*p0.y;
      float ye2 = 3*pow((1-n[i]), 2)*n[i]*(p1y + cy*i);
      float ye3 = 3*(1-n[i])*pow(n[i], 2)*(p2y + cy*i);
      float ye4 = pow(n[i], 3)*p3y;
      float y = ye1 + ye2 + ye3 + ye4;
      stroke(c[i], 70, 90, 80);
      strokeWeight(2);
      point(x, y);
      if (n[i] > 0.99) {
        n[i] = 0;
      }
      n[i] += 0.005;
    }
  }
}

