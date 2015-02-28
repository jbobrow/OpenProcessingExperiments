
// shoogle the mouse
// steven kay June 2010

int[][] location; // circular buffer [index][0=x,1=y,2=radius,3=alive]
int BUFF=30; // length of worm (increasing slows things down)
int ix; // pointer to current entry in circular buffer
float[][] distance; // precomputed distance table, speeds up pythagoras calcs
int alivepoints=0; // number of mouse points
int DECAY=1; // decay speed
int MODES=4; // number of modes
PFont caption;
int mode=0; // current mode

void setup() {
  size(256,256,P2D);
  background(0);
  location=new int[BUFF][4];
  distance=new float[256][256];
  // build pre-computed lookup table for euclidean distance
  for (int y=0;y<256;y++) {
    for (int x=0;x<256;x++) {
      distance[x][y]=(float)Math.sqrt(x*x + y*y);
    }
  }
  caption=loadFont("Large9Normal-48.vlw");
  textFont(caption,18.0);
}

void mouseMoved() {
  location[ix][0]=mouseX;
  location[ix][1]=mouseY;
  location[ix][2]=BUFF;
  location[ix][3]=1; // mark as alive
  ix=(ix+1)%BUFF;
}

void age() {
  alivepoints=0;
  for (int i=0;i<BUFF;i++) {
    if (location[i][0]>0 && location[i][1]>0) {
      location[i][2]-=DECAY;
      if (location[i][2]<=0) {
        location[i][2]=0;
        location[i][3]=0; // KILL
      } else {
        alivepoints++;
      }
    }
  }
  // if alivepoints still zero, it's gone all quiet , so prompt the user..
}

void mousePressed() {
  mode=(mode+1)%MODES;
}

void draw() {
  age();
  loadPixels();
  for (int y=0;y<256;y++) {
    for (int x=0;x<256;x++) {    
      float tot=0;
      float nearestdist=9999.0f;
      int nearestix=0;
      for (int a=0;a<BUFF;a++) {
        if (location[a][3]==1) {
          int dx=abs(x-location[a][0]);
          int dy=abs(y-location[a][1]);
          float d=(distance[dx][dy])*location[a][2];
          if (d<nearestdist) {
            nearestdist=d;
            nearestix=a;
          }
        }
      }
      tot=nearestdist;
      if (mode==0) pixels[y*256+x]=color(tot%255);  
      if (mode==1) pixels[y*256+x]=color((1024-tot)%255);  
      if (mode==2) pixels[y*256+x]=color(255-tot);  
      if (mode==3) pixels[y*256+x]=color(tot%128*2);  
    }
  }
  updatePixels();
  // if sketch is 'empty', prompt viewer to move the mouse
  if (alivepoints==0) {
    fill(255,0,0);
    text("Move the mouse!",10,20);
    text("Click to change!",10,50);
  }
}

