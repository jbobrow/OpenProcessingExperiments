
int iterations=10;
char renderer='b';
float cx=-2,cy=.5;
float shrink,shrinkv,multi; 
int Translate;
float arr[][]=new float[1000000][3];
int a;
float fov =-400;
float roty,rotx;
boolean changed;
void setup() {
  size(400,400,P3D);
  shrink=float(2)/float(width);
  shrinkv=shrink;
  Translate=width/2;
  multi=25.5;
  background(255);
  loadPixels();
  colorMode(HSB);
}
void draw() {
  background(255);

  translate(width/2,height/2,-400);
  rotateY(roty);
  rotateX(rotx);
  translate(-width/2,-height/2,400);
  //cx=float(mouseX-Translate)*shrink;
  cx+=.005;
  //if(changed) {
  //background(255);
  switch(renderer) {
  default:
    for(float x=-10;x<width;x++) {
      boolean h=false;
      for(float y=-10;y<height;y++) {
        float zx=(x-Translate)*shrinkv;
        float zy=(y-Translate)*shrinkv;
        for(int i=0;i<iterations;i++) {
          float zex=zx;
          zx=zx*zx-zy*zy+cx;
          zy=2*zy*zex+cy;
        }
        if(sqrt(zx*zx+zy*zy)<2) {
          if(h==false) {
            arr[a][0]=x;
            arr[a][1]=y;
            arr[a][2]=cx*100;
            a=(a<1000000-1)?a+1:0;
            
          }h=true;
        }
        else {
          if(h==true) {
            arr[a][0]=x;
            arr[a][1]=y;
            arr[a][2]=cx*100;
            a=(a<1000000-1)?a+1:0;
          }
          h=false;
        }
      }
    }
    break;
  }
  updatePixels();
  changed=false;
  translate(0,0,fov);
  for(int x=0;x<a;x++) {
    stroke(map(x,0,a,0,255),255,255);
    point(arr[x][0],arr[x][1],arr[x][2]);
  }
  //}
}
void keyPressed() {
  if(key==CODED) {
    if(keyCode==LEFT) {
      iterations=(iterations>2) ?iterations-1:iterations;
      multi=float(255)/float(iterations);
    }
    else if(keyCode==RIGHT) {
      iterations=(iterations<100) ?iterations+1:iterations;
      multi=float(255)/float(iterations);
    }
  }
  if(key==' '){
    cx=-2;
    cy=map(mouseY,0,height,-1,1);
    a=0;
  }
  if(key=='a'){
    fov = map(mouseX,0,width,0,-800);
  }
}
void mouseDragged() {
  roty=map(mouseX,0,width,0,12);
  rotx=map(mouseY,0,height,0,12);
}


