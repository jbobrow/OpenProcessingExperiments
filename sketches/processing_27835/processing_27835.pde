
float x[];
float y[];
float inc,cx,cy,transy=0,transx=20;
int a=0;
int zoom;
int res=400;
boolean julia;
void setup() {
  size(400,400,P2D);
  zoom=width/2;
  inc=float(2)/float(res);
  x=new float[res*res*60];
  y=new float[res*res*60];
}
void draw() {
  a=0;
  if(julia) {
    cx=map(mouseX,0,width,-1,1);
    cy=map(mouseY,0,height,-1,1);
    for(float ex=-1;ex<1;ex+=inc) {
      for(float wy=-1;wy<1;wy+=inc) {
        float x1=ex;
        float y1=wy;
        for(int i=0;i<50;i++) {
          float x2=x1;

          if(a<x.length) { 
            x[a]=x1*x1-y1*y1+cx; 
            y[a]=2*x2*y1+cy;
            a++;
          }
          x1=x[a-1];
          y1=y[a-1];
        }
      }
    }
  }
  else {
    for(float ex=-1;ex<1;ex+=inc) {
      for(float wy=-1;wy<1;wy+=inc) {
        float x1=ex;
        float y1=wy;
        for(int i=0;i<50;i++) {
          float x2=x1;

          if(a<x.length) { 
            x[a]=x1*x1-y1*y1+ex; 
            y[a]=2*x2*y1+wy;
            a++;
          }
          x1=x[a-1];
          y1=y[a-1];
        }
      }
    }
  }

  float u=map(mouseX,0,width,-1,1);
  int ab[][]=new int[width][height];
  for(int i=0;i<x.length;i+=1) {
    int aa=int(constrain((x[i]+1)*zoom+transx,0,width-1));
    int b=int(constrain((y[i]+1)*zoom+transy,0,height-1));
    ab[aa][b]++;
  }
  loadPixels();
  for(int w=0;w<width;w++) {
    for(int e=0;e<height;e++) {
      pixels[w+e*width]=color(map(log(ab[w][e]),0,10,1,255));
    }
  }
  updatePixels();
}
void keyPressed() {
  if(key==CODED) {
    switch(keyCode) {
    case UP:
      transy+=10;
      break;
    case DOWN:
      transy-=10;
      break;
    case LEFT:
      transx+=10;
      break;
    case RIGHT:
      transx-=10;
      break;
    }
  }
  else {
    switch(key) {
    case ' ':
      zoom+=mouseX-pmouseX;
      break;
    case 'v':
      zoom-=10;
      break;
    case 'b':
      zoom+=10;
      break;
    case 'j':
      julia=(julia) ? false:true;
      break;
    }
  }
}


