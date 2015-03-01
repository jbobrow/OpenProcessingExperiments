
PVector[][] patch;
int RESOLUTION = 30; // patch resolution
float c = 0;
float x = 0;

boolean isopen = true;

void setup() {
  size(600, 600, P3D);
  patch = new PVector[RESOLUTION][RESOLUTION];
  for (int i=0; i< RESOLUTION; i++) {
    for (int j=0; j< RESOLUTION; j++) {
      patch[i][j] = new PVector();
    }
  }

 patch_2 = new PVector[RESOLUTION_2][RESOLUTION_2];
  for (int i=0; i< RESOLUTION_2; i++) {
    for (int j=0; j< RESOLUTION_2; j++) {
      patch_2[i][j] = new PVector();
    }
  }
}


void draw() {

  background(255);
  randomSeed(0);
  
  if (isopen == true){
  // design a patch
  PVector lBottom = new PVector(0, height); // left bottom
  PVector rBottom = new PVector(width, height); // right bottom
  PVector lTop = new PVector(0, 0); // left top
  PVector rTop = new PVector(0, height); // right top
  createPatch(patch, lBottom, rBottom, lTop, rTop);
  renderPatch(patch);

  PVector lBottom_2 = new PVector(width, 0);
  PVector rBottom_2 = new PVector(width, height);
  PVector lTop_2 = new PVector(0, 0);
  PVector rTop_2 = new PVector(width, 0);
  createPatch(patch, lBottom_2, rBottom_2, lTop_2, rTop_2);
  renderPatch(patch);
  
  
  // design a patch
  PVector lBottom3 = new PVector(150, 460); // left bottom
  PVector mBottom3 = new PVector(width/2, height); // middle bottom
  PVector rBottom3 = new PVector(500, 460); // right bottom
  PVector lMiddle3 = new PVector(0, height/2); // left middle
  PVector mMiddle3 = new PVector(width/2, height/2); // middle middle
  PVector rMiddle3 = new PVector(width, height/2); // right middle
  PVector lTop3 = new PVector(100, 135); // left top
  PVector mTop3 = new PVector(width/2, 0); // middle top
  PVector rTop3 = new PVector(440, 135); // right top
  createPatch3(patch_2, lBottom3, mBottom3, rBottom3, lMiddle3, mMiddle3, rMiddle3, lTop3, mTop3, rTop3);
  renderPatch3(patch_2);

  
  
  }
  
  
  else if (isopen == false){
    
  PVector lBottom = new PVector(0, height); // left bottom
  PVector rBottom = new PVector(width, height); // right bottom
  PVector lTop = new PVector(0, 0); // left top
  PVector rTop = new PVector(300, 305); // right top
  createPatch(patch, lBottom, rBottom, lTop, rTop);
  renderPatch(patch);

  PVector lBottom_2 = new PVector(300, 295);
  PVector rBottom_2 = new PVector(width, height);
  PVector lTop_2 = new PVector(0, 0);
  PVector rTop_2 = new PVector(width, 0);
  createPatch(patch, lBottom_2, rBottom_2, lTop_2, rTop_2);
  renderPatch(patch);
  
  }
}


float Lerp(float p1, float p2, float t) {
  // code for linear interpolation
  return p1*(1-t) + p2*t;
}


PVector uv(int x, int y) {
  // convert (x,y) in range 0 ~ (RESOLUTION-1) to (u,v) in 0~1 scale
  float u = (float)x / (RESOLUTION-1);
  float v = (float)y / (RESOLUTION-1);
  PVector uv = new PVector(u, v);
  return uv;
}


PVector getPosInPlanarPatch(PVector uv, PVector lBottom, PVector rBottom, PVector lTop, PVector
rTop) {
  // return actural (x,y) that corresponds to (u,v) in a patch defined
  // by (leftBottom, rightBottom, leftTop, rightTop)
  float u = uv.x;
  float v = uv.y;
  PVector pos = new PVector();
  float u1 = Lerp(lBottom.x, rBottom.x, u);
  float u2 = Lerp(lTop.x, rTop.x, u);
  pos.x = Lerp(u1, u2, v);
  u1 = Lerp(lBottom.y, rBottom.y, u);
  u2 = Lerp(lTop.y, rTop.y, u);
  pos.y = Lerp(u1, u2, v);
  return pos;
}


void createPatch(PVector[][] patch, PVector lBottom, PVector rBottom, PVector lTop, PVector rTop) {
  for (int iy=0; iy<RESOLUTION; iy++) {
    for (int ix=0; ix<RESOLUTION; ix++) {
      PVector uv = uv(ix, iy);
      PVector pos = getPosInPlanarPatch(uv, lBottom, rBottom, lTop, rTop);
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
     
        fill(250,random(200,220),random(140,160));
        vertex(patch[iy][ix].x, patch[iy][ix].y);
        vertex(patch[iy+1][ix].x, patch[iy+1][ix].y);
      
    }
    endShape();
  }
}


void mouseClicked(){
  eyeclose();

}


void eyeclose() {
  isopen = !isopen;
  
}

PVector[][] patch_2;
int RESOLUTION_2 = 30; // patch resolution

float bernstein(float p1, float p2, float p3, float t) {
  // quadratic bernstein interpolation
  float result= p1*(1-t)*(1-t) + p2*2*(1-t)*t + p3*t*t;
  return result;
}
PVector uv3(int x, int y) {
  // convert (x,y) in range 0 ~ (RESOLUTION-1) to (u,v) in 0~1 scale
  float u3 = (float)x / (RESOLUTION_2-1);
  float v3 = (float)y / (RESOLUTION_2-1);
  PVector uv3 = new PVector(u3, v3);
  return uv3;
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

void createPatch3(PVector[][] patch, PVector lBottom, PVector mBottom, PVector rBottom, 
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
void renderPatch3(PVector[][] patch) {
  fill(255, 0, 0);
  stroke(0);
  for (int iy=0; iy<RESOLUTION-1; iy++) {
    beginShape(QUAD_STRIP); // try POINTS
    for (int ix=0; ix<RESOLUTION; ix++) {
      
      if (iy > (RESOLUTION-1)/5 && iy < 4*(RESOLUTION-1)/5 && ix > RESOLUTION/5 && ix < 4*RESOLUTION/5) {
        
          fill(random(150));
          vertex(patch[iy][ix].x, patch[iy][ix].y);
          vertex(patch[iy+1][ix].x, patch[iy+1][ix].y);
        
      }
      
      else   
          fill(random(50,200));
          vertex(patch[iy][ix].x, patch[iy][ix].y);
          vertex(patch[iy+1][ix].x, patch[iy+1][ix].y);
        
      
    }
    endShape();
  }
}

