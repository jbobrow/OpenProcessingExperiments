
// Shining Particle by harukit
// Created with Processing 68 alpha on September 11 , 2004
// http://www.harukit.com 

PVector [] ka;
int pNum =2;
int pNumx = pNum+1;
Particle[] p = new Particle[pNum];
float rr,gg,bb,dis;
int w = 160;
int h = 120;
int gain = 5;
float[] cc = new float[3];
PImage a;
import processing.opengl.*;
PImage c;
void setup(){
  size(160,120);
  a=createImage(w,h,ARGB);
  c=createImage(w,h,ARGB);
  ka = new PVector [w*h] ;
  loadPixels();
  for (int x=0;x<w;x++){
    for (int y=0;y<h;y++){
      float k = dist(0,0,x,y);
      int pos = x+w*y;
      ka[pos] = new PVector(k,x,y);
      a.pixels[pos]=color(k,x,y);
      c.pixels[pos]=color(k,x,y);  
    }
    frameRate(3000);
  } 

  noStroke();
  background(0);
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(width),random(height),random(0.1,0.3));
  }
  fr = frameRate;
  maxfr= fr;
  image(a,0,0);
  image(c,w,0);
}
float fr = 0;
float maxfr=0;
int flick = 0;
int fc;
int mx;
int my;

void draw(){
fc++;
stroke(255,0,0);
   fr = frameRate;
    if(fr>maxfr){
      maxfr = fr; 
    }
    line(0,h-24,w,h-24,0);
line(w-25,h,w-25,fr);
  mx=mouseX;
  if(mx>w){
    mx=abs(w-mx);

  }

  for(int i=0;i<pNum;i++){
    p[i].update();
  }
  if(fc%pNumx==0){
    image(c,0,0);
    image(a,0,0);

    for(int y=0;y<h;y++){
      for(int x=0;x<w;x++){
        int pos=y*w+x;
        color col = a.pixels[pos];
        rr = col >> 16 & 0xff;
        gg = col >> 8 & 0xff;
        bb = col  & 0xff;
        for(int i=0;i<pNum;i++){
          dis =distx2(p[i].xpos,p[i].ypos,x,y);
          rr += cc[0]/dis-gain;
          gg += cc[1]/dis-gain;
          bb += cc[2]/dis-gain;
        }
        a.pixels[pos]=color(rr,gg,bb,rr);
      }
    }
  }
  a.updatePixels();
  //image(a,0,0);
}

void mousePressed(){
  //background(0);
  Particle[] p = new Particle[pNum];
}

void mouseReleased(){
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
  // background(0);
  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(w),random(h),random(0.1,0.3));
  }
}

class Particle{
  float xpos,ypos,del;
  Particle(float x,float y,float d){
    xpos=x;
    ypos=y;
    del = d;
  }
  void update(){
    xpos += (mx-xpos)*del;
    ypos += (mouseY-ypos)*del;
  }
}


float distx2(float ax,float b, float c,float d){
  c = abs(c-ax);
  d = abs(d-b);
  ax=0;
  b=0;
  //    int dx=int(abs(c-ax));
  //    int dy=int(abs(d-b));
  //    c=c-dx;
  //    d=d-dy;
  float retval = 0;
  int pos = int(c)+w*int(d);
  // retval = a.get(int(c),int(d))>>16&255;
  retval = ka[pos].x;
  return retval;
}




