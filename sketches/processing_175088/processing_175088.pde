
PVector[][] patch;
int RESOLUTION = 20; // patch resolution
void setup() {
 size(600, 600);
 patch = new PVector[RESOLUTION][RESOLUTION];
 for (int i=0; i< RESOLUTION; i++) {
 for (int j=0; j< RESOLUTION; j++) {
 patch[i][j] = new PVector();
 }
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
 noStroke();
 for (int iy=0; iy<RESOLUTION-1; iy++) {
 beginShape(QUAD_STRIP); // try POINTS
 for (int ix=0; ix<RESOLUTION; ix++) {
   if(iy == 11 && ix == 7){
       fill(255,0,0,255);
   }
   else if(iy == 10 && ix == 7){
       fill(255,0,0,255);
   }
   else if(iy == 9 && ix == 7){
       fill(255,0,0,255);
   }
   else if(iy == 10 && ix ==13){
       fill(255,0,0,255);
   }
   else if(iy == 9 && ix == 13){
       fill(255,0,0,255);
   }
    else if(iy == 11 && ix == 13){
       fill(255,0,0,255);
   }
    else if(iy == 7 && ix == 6){
       fill(255,0,0,255);
   }
   else if(iy == 6 && ix == 7){
       fill(255,0,0,255);
   }
   else if(iy == 6 && ix ==8){
       fill(255,0,0,255);
   }
   else if(iy == 6 && ix == 9){
       fill(255,0,0,255);
   }
    else if(iy == 6 && ix == 10){
       fill(255,0,0,255);
   }
    else if(iy == 6 && ix == 11){
       fill(255,0,0,255);
   }
   else if(iy == 6 && ix ==12){
       fill(255,0,0,255);
   }
   else if(iy == 6 && ix == 13){
       fill(255,0,0,255);
   }
    else if(iy == 7 && ix == 14){
       fill(255,0,0,255);
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   else
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
 PVector lBottom = new PVector(100, height-100); // left bottom
 PVector rBottom = new PVector(width-100, height-100); // right bottom
 PVector lTop = new PVector(100, 100); // left top
 PVector rTop = new PVector(mouseX, mouseY); // right top
 createPatch(patch, lBottom, rBottom, lTop, rTop);
 renderPatch(patch);
}


