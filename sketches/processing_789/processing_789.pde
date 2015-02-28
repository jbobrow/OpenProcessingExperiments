
//Thomas E Duerr  1/08/09
   
  int w = 400;
  int h = 400;
  int px = int(random(w));
  int py = int(random(h));
  int pxb = px;
  int pyb = py; 
  
void setup() {
  size(400, 400);
  background(0,0,0);
  smooth();

}

void draw() {
  int nx = int(random(19))-9;
  int ny = int(random(19))-9;

//stroke(int(random(255)));
  strokeWeight(5);
  
  if(pxb+nx>w){
   nx *= -1; 
  }
  if(pyb+ny>h){
   ny *= -1;
  }
  if(pxb+nx<0){
   nx *= -1; 
  }
  if(pyb+ny<0){
   ny *= -1;
  }
  
  blend( -1, -1, w, h, -1, -1, w, h, LIGHTEST);
  if(mousePressed==true){
  blend( 0, 0, w, h, 0, 0, w, h, SUBTRACT);
  }

  strokeJoin(ROUND);
  stroke(255,255,0);
  line(pxb, pyb, pxb+nx, pyb+ny);
  stroke(255,0,0);
  line(pxb*(-1)+w, pyb, (pxb+nx)*(-1)+w, pyb+ny);
  stroke(0,0,255);
  line(pxb, pyb*(-1)+h, pxb+nx, (pyb+ny)*(-1)+h);
  stroke(0,255,0);
  line(pxb*(-1)+w, pyb*(-1)+h, (pxb+nx)*(-1)+w, (pyb+ny)*(-1)+h);

  pxb += nx;
  pyb += ny;
}


