
import fullscreen.*; 
FullScreen fs;

int w = 500;//screen.height;
int h = w;//screen.height;
int d = w;//600;
float sx,sy,sz;

void setup() {
//  fs = new FullScreen(this); 
//  fs.enter();
  size(w, h, P3D);
  frameRate(30);
}

void draw() {
  camera(w*3, h*3, d/2, 0, 0, 0, 0, 0,-1);
  background(255);
  rotateZ(frameCount*PI/360);
  sx= sin(PI/90*frameCount) *w;
  sy= sin(PI/90*frameCount) *h;
  sz= sin(PI/90*frameCount) *d;
  int m = 4;
  for(int k=-m;k<m+1;k++){
    for(int j=-m;j<m+1;j++){
      for(int i=-m;i<m+1;i++){
      fill(255);
        pushMatrix();
        translate(w*i/m,h*j/m,d*k/m);
//        box(sx/m*2,sy/m*2,sz/m*2);
        box(mouseX/m,mouseX/m,mouseY/m);
        popMatrix();
     }
    }
  }
}



