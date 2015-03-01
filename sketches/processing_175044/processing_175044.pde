
PVector[][] patch;
int RESOLUTION = 4; // patch resolution
ArrayList ripples;    
int maxDrops = 100;   
void setup() {
size(600, 600);
patch = new PVector[RESOLUTION][RESOLUTION];
for (int i=0; i< RESOLUTION; i++) {
for (int j=0; j< RESOLUTION; j++) {
patch[i][j] = new PVector();
}
}
 ripples = new ArrayList();
}
float bernstein(float p1, float p2, float p3, float t) {
// quadratic bernstein interpolation
float result= p1*(1-t)*(1-t) + p2*2*(1-t)*t + p3*t*t;
return result;
}
PVector uv(int x, int y) {
// convert (x,y) in range 0 ~ (RESOLUTION-1) to (u,v) in 0~1 scale
float u = (float)x / (RESOLUTION-1);
float v = (float)y / (RESOLUTION-1);
PVector uv = new PVector(u, v);
return uv;
}
PVector getPosInBezierPatch(PVector uv, PVector lBottom, PVector mBottom, PVector rBottom,
PVector lMiddle, PVector mMiddle, PVector rMiddle,
PVector lTop, PVector mTop, PVector rTop) {
// return actural (x,y) that corresponds to (u,v) in a patch defined
// by (leftBottom, rightBottom, leftTop, rightTop)
float u = uv.x;
float v = uv.y;
PVector pos = new PVector();
float u1 = bernstein(lBottom.x, mBottom.x, rBottom.x, u);
float u2 = bernstein(lMiddle.x, mMiddle.x, rMiddle.x, u);
float u3 = bernstein(lTop.x, mTop.x, rTop.x, u);
pos.x = bernstein(u1, u2, u3, v);
u1 = bernstein(lBottom.y, mBottom.y, rBottom.y, u);
u2 = bernstein(lMiddle.y, mMiddle.y, rMiddle.y, u);
u3 = bernstein(lTop.y, mTop.y, rTop.y, u);
pos.y = bernstein(u1, u2, u3, v);
return pos;
}
void createPatch(PVector[][] patch, PVector lBottom, PVector mBottom, PVector rBottom,
PVector lMiddle, PVector mMiddle, PVector rMiddle,
PVector lTop, PVector mTop, PVector rTop) {
for (int iy=0; iy<RESOLUTION; iy++) {
for (int ix=0; ix<RESOLUTION; ix++) {
PVector uv = uv(ix, iy);
PVector pos = getPosInBezierPatch(uv, lBottom, mBottom, rBottom, lMiddle, mMiddle, rMiddle, lTop, mTop, rTop);
patch[iy][ix].x = pos.x;
patch[iy][ix].y = pos.y;
}
}
}
void renderPatch(PVector[][] patch) {



noStroke();
for (int iy=0; iy<RESOLUTION-1; iy++) {
beginShape(QUAD_STRIP); // try POINTS
for (int ix=0; ix<RESOLUTION; ix++) {
fill(random(255),random(255),random(255),100);
vertex(patch[iy][ix].x, patch[iy][ix].y);
vertex(patch[iy+1][ix].x, patch[iy+1][ix].y);
}
endShape();
}
}
void draw() {
background(255);
randomSeed(0);
//lights();
// design a patch
PVector lBottom = new PVector(mouseX,mouseY); // left bottom
PVector mBottom = new PVector(width/2, height); // middle bottom
PVector rBottom = new PVector(mouseX,mouseY); // right bottom
PVector lMiddle = new PVector(0, height/2); // left middle
PVector mMiddle = new PVector(width/2, height*2/3); // middle middle
PVector rMiddle = new PVector(width, height/2); // right middle
PVector lTop = new PVector(mouseX,mouseY); // left top
PVector mTop = new PVector(width/2, 0); // middle top
PVector rTop = new PVector(mouseX,mouseY); // right top
createPatch(patch, lBottom, mBottom, rBottom, lMiddle, mMiddle, rMiddle, lTop, mTop, rTop);
renderPatch(patch);

 if (mousePressed == true) {
    ripples.add(new Ripple(mouseX, mouseY, random(50, 100)));
  } else if (ripples.size() < maxDrops && random(100) > 80) {
    ripples.add(new Ripple(random(0, width), random(0, height), random(50, 100)));
  }
   
  for (int i = ripples.size() - 1; i >= 0; i--) {
    Ripple rip = (Ripple) ripples.get(i);
    rip.update();
    if (rip.finished()) {
      ripples.remove(i);
    } else {
      rip.display();
    }
  }
}

class Ripple {
  float a, b;
  float max_r, r;
  float step;
  boolean FINISHED = false;
  float max_brightness;
  float thickness;
   
  Ripple(float a, float b, float r) {
    this.a = a;
    this.b = b;
    this.max_r = r;
    this.r = 0;
    step = random(0.3, 0.8);
    max_brightness = random(80, 210);
    thickness = random(1, 5);
  }
   

  void update() {
    if (r <= max_r) {  
      r = r + step;    
    } else {
      FINISHED = true; 
    }
  }
 
  void display() {
    noFill();
    stroke(0,max_brightness,max_brightness, 200 * (max_r - r) / max_r);
    strokeWeight(1);
    ellipse(this.a, this.b, this.r, this.r);
  }
   

  boolean finished() {
    return FINISHED;
  }
}

