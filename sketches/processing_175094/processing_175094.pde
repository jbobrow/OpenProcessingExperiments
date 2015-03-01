
PVector[][] patch;
float ax=100;
float ay=width-100;
float bx=height-100;
float by=height-500;
int RESOLUTION = 30; // patch resolution
void setup() {
  size(600, 600);
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
  fill(255, 0, 0);
  stroke(0);
  for (int iy=0; iy<RESOLUTION-1; iy++) {
    beginShape(QUAD_STRIP); // try POINTS 
    for (int ix=0; ix<RESOLUTION; ix++) {
      fill(random(255));
      vertex(patch[iy][ix].x, patch[iy][ix].y); 
      vertex(patch[iy+1][ix].x, patch[iy+1][ix].y);
    } 
    endShape();
  }
}
void draw() { 
  background(255); 
  randomSeed(0);
  // design a patch

    for (float ax=100; ax<width/2; ax++);
    for (float ay=width-100; ay>width/2; ay--);
    for (float bx=height-100; bx<height/2; bx--);
    for (float by=height-500; by<height/2; by++);
    PVector lBottom = new PVector(mouseX+ax, mouseY-bx); // left bottom 
    PVector mBottom = new PVector(width/2, height); // middle bottom 
    PVector rBottom = new PVector(mouseX-ay, mouseY+bx); // right bottom 
    PVector lMiddle = new PVector(0, height/2); // left middle
    PVector mMiddle = new PVector(width/2, height/2); // middle middle 
    PVector rMiddle = new PVector(width, height/2); // right middle
    PVector lTop = new PVector(mouseX+ax, mouseY+ax); // left top
    PVector mTop = new PVector(width/2, 0); // middle top
    PVector rTop = new PVector(mouseX-ay, mouseY-by); // right top
    createPatch(patch, lBottom, mBottom, rBottom, lMiddle, mMiddle, rMiddle, lTop, mTop, rTop); 
    renderPatch(patch);

}

