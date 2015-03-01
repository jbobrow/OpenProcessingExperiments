
PVector[][] patch;
int RESOLUTION = 10; // patch resolution

void setup() {
  size(600, 1200);
  patch = new PVector[RESOLUTION][RESOLUTION]; 
  for (int i=0; i< RESOLUTION; i++) {
    for (int j=0; j< RESOLUTION; j++) { 
      patch[i][j] = new PVector();
    }
  }
}
float bernstein(float p1, float p2, float p3, float t) { // quadratic bernstein interpolation
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
PVector getPosInBezierPatch(PVector uv, PVector lBottom, PVector mBottom, PVector rBottom, PVector lMiddle, PVector mMiddle, PVector rMiddle, 
PVector lTop, PVector mTop, PVector rTop) {
  // return actural (x,y) that corresponds to (u,v) in a patch defined // by (leftBottom, rightBottom, leftTop, rightTop)
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

void createPatch(PVector[][] patch, PVector lBottom, PVector mBottom, PVector rBottom, PVector lMiddle, PVector mMiddle, PVector rMiddle, 
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
  strokeWeight(2);
  stroke(0);
  for (int iy=0; iy<RESOLUTION-1; iy++) {
    beginShape(QUAD_STRIP); // try POINTS 
    for (int ix=0; ix<RESOLUTION; ix++) {
    noFill();
    vertex(patch[iy][ix].x, patch[iy][ix].y); 
    vertex(patch[iy+1][ix].x, patch[iy+1][ix].y);
  } 
  //endShape();
} 
}
void draw() { 
  background(255); 
  
  // design a patch
  PVector lBottom = new PVector(150, 500); // left bottom 
  PVector mBottom = new PVector(width/2, 600); // middle bottom 
  PVector rBottom = new PVector(width-150, 500); // right bottom 
  PVector lMiddle = new PVector(300, 300); // left middle
  PVector mMiddle = new PVector(width/2, 300); // middle middle 
  PVector rMiddle = new PVector(300, 300); // right middle
  PVector lTop = new PVector(250, 100); // left top
  PVector mTop = new PVector(width/2, 0); // middle top
  PVector rTop = new PVector(350, 100); // right top
  createPatch(patch, lBottom, mBottom, rBottom, lMiddle, mMiddle, rMiddle, lTop, mTop, rTop); 
  renderPatch(patch);
  
  PVector lBottom2 = new PVector(150, 1000); // left bottom 
  PVector mBottom2 = new PVector(width/2, 1100); // middle bottom 
  PVector rBottom2 = new PVector(width-150, 1000); // right bottom 
  PVector lMiddle2 = new PVector(-100, 800); // left middle
  PVector mMiddle2 = new PVector(width/2, 800); // middle middle 
  PVector rMiddle2 = new PVector(700, 800); // right middle
  PVector lTop2 = new PVector(150, 500); // left top
  PVector mTop2 = new PVector(width/2, 600); // middle top
  PVector rTop2 = new PVector(width-150, 500); // right top
  createPatch(patch, lBottom2, mBottom2, rBottom2, lMiddle2, mMiddle2, rMiddle2, lTop2, mTop2, rTop2); 
  renderPatch(patch);
}


