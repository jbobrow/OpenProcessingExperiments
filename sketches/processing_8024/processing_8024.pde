
bpoint [] blobs;
int numblobs=4;
float t=0;
PImage backg;
float [] [] sqrttab;

void setup() {
  size(320,200);
  blobs=new bpoint[4];
  int i,j;
  for (i=0;i<numblobs;i++) {
    blobs[i]=new bpoint();
    blobs[i].cx=new int[4];
    blobs[i].cy=new int[4];
    for (j=0;j<4;j++) {
      blobs[i].cx[j]=int(random(20,320-20));
      blobs[i].cy[j]=int(random(20,200-20));
    }
  }
  blobs[0].r=255;
  blobs[0].g=255;
  blobs[0].b=255;
  blobs[0].radius=18;
  blobs[1].r=255;
  blobs[1].g=0;
  blobs[1].b=0;
  blobs[1].radius=13;
  blobs[2].r=255;
  blobs[2].g=255;
  blobs[2].b=0;
  blobs[2].radius=13;
  blobs[3].r=0;
  blobs[3].g=0;
  blobs[3].b=255;
  blobs[3].radius=13;
  backg=new PImage(320,200);
  int x,y,offs=0;
  float f;
  for (y=0;y<200;y++) {
    for (x=0;x<320;x++) {
      f=noise(float(x)/40,float(y)/25);      
      backg.pixels[offs++]=color(f*255,f*255,f*255);
    }
  }
  sqrttab=new float [220][340]; //slightly bigger than the screen cause the splines sometimes go off screen
  for (y=0;y<201;y++) {
    for (x=0;x<321;x++) {
      sqrttab[y][x]=sqrt(sq(x)+sq(y));
    }
  }  
}

void draw() {
  set(0,0,backg);
  loadPixels();
  int x,y,i,maxi,j;
  int offs=0;
  float f=0,maxw;
  float [] w=new float [numblobs];
  offs=0;
  for (i=0;i<numblobs;i++) {
    blobs[i].x=int(curvePoint(blobs[i].cx[0],blobs[i].cx[1],blobs[i].cx[2],blobs[i].cx[3],t));
    blobs[i].y=int(curvePoint(blobs[i].cy[0],blobs[i].cy[1],blobs[i].cy[2],blobs[i].cy[3],t));
  }
  t+=0.25/10;
  if (t>1) {
    for (i=0;i<numblobs;i++) {
      for (j=0;j<3;j++) {
        blobs[i].cx[j]=blobs[i].cx[j+1];
        blobs[i].cy[j]=blobs[i].cy[j+1];
      }
      blobs[i].cx[3]=int(random(20,320-20));
      blobs[i].cy[3]=int(random(20,200-20));      
    }
    t=0;
  }
  for (y=0;y<200;y++) {
    for (x=0;x<320;x++) {
      float col=0;
      for (i=0;i<numblobs;i++) {
        w[i]=blobf(x,y,blobs[i]);
        col+=w[i];
      }
      maxi=0;
      maxw=w[0];
      for (i=1;i<numblobs;i++) {
        if (w[i]>maxw) {
          maxw=w[i];
          maxi=i;
        }
      }
      if (col>0.7) {
        if (col>1.0) {
          col=1.0;
        }
        pixels[offs++]=color(col*blobs[maxi].r,col*blobs[maxi].g,col*blobs[maxi].b);
      }
      else{
        offs++;
      }
    }
  }
  updatePixels();
}

float blobf(int x0,int y0,bpoint b) {
  float r=20;
  float d;
  d=sqrttab[abs(y0-b.y)][abs(x0-b.x)];
  return b.radius/d;
}

class bpoint {
  int x,y;
  int [] cx;
  int [] cy;
  int r,g,b;
  float radius;
}

