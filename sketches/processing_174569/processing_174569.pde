

int a = 0;
int b = 0;
boolean aside = true;
 
void setup() {
  size(500,500,P3D);
  background(0);
}
 
void draw() {
  a = mouseX;
  b = mouseY;
  if (aside == true) {
    bezierc1(a,b);
  } else {
    bezierc2(a,b);
    

  }
}
 
void bezierc1(int m, int n){
      float lx=0, ly=0, lz=1;
  
  float x = mouseX+10;
  float y = mouseY+10;
  float z = abs(x-y);
  
  float rx = random(0,100);
  float ry = random(0,100);
  float rz = random(0,100);
  
  float sx = random(0,100);
  float sy = random(0,100);
  float sz = random(0,100);
  
  float cx = (ry*sz-ry*sy);
  float cy =-(rx*sz-rz*sx);
  float cz=(rx*sy-ry*sx);
  
  float size = sqrt(cx*cx+cy*cy+cz*cz);
  cx = cx/size;
  cy = cy/size;
  cz = cz/size;
  
  float brightness=abs(cx*lx+cy*ly+cz*lz);
  stroke(0,brightness*255,brightness*255,150);
  fill(0,brightness*255,brightness*255,3);
  bezier(0,0,m*2,n*2,m+50,n+50,500,500);
}
 
void bezierc2(int m, int n){
        float lx=0, ly=0, lz=1;
  
  float x = mouseX+10;
  float y = mouseY+10;
  float z = abs(x-y);
  
  float rx = random(0,100);
  float ry = random(0,100);
  float rz = random(0,100);
  
  float sx = random(0,100);
  float sy = random(0,100);
  float sz = random(0,100);
  
  float cx = (ry*sz-ry*sy);
  float cy =-(rx*sz-rz*sx);
  float cz=(rx*sy-ry*sx);
  
  float size = sqrt(cx*cx+cy*cy+cz*cz);
  cx = cx/size;
  cy = cy/size;
  cz = cz/size;
  
  float brightness=abs(cx*lx+cy*ly+cz*lz);
  stroke(0,brightness*255,brightness*255,150);
  fill(0,3);
  bezier(500,0,m*2,n*2,m-50,n-50,0,500);
}
 
void mousePressed() {
  aside = !aside;
}

