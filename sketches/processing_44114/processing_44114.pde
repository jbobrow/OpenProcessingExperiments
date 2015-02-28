
// Shining Particle by harukit
// Created with Processing 68 alpha on September 11 , 2004
// http://www.harukit.com 


int pNum =1;
Particle[] p = new Particle[pNum];
float rr,gg,bb,dis;
int gain = 5;
float[] cc = new float[3];
int [] A= new int [100*100];
void setup(){
  size(100,100,P2D);
  
  noStroke();
  background(0);
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(width),random(height),random(0.1,0.3));
  }
}

void draw(){
  for(int i=0;i<pNum;i++){
    p[i].update();
  }
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
        int pos=y*width+x;
        color col = A[pos];
        rr = col >> 16 & 0xff;
        gg = col >> 8 & 0xff;
        bb = col  & 0xff;
        for(int i=0;i<pNum;i++){
          PVector disx =distx(p[i].xpos,p[i].ypos,0,x,y,0);
              // dis = dist(p[i].xpos,p[i].ypos,x,y);
//          disx.x=disx.x/2;
//                    disx.y=disx.y/2;
//                              disx.z=disx.z/2;
                              
//          rr += cc[0]/disx.x-gain;
//          gg += cc[1]/disx.y-gain;
//          bb += cc[2]/disx.z-gain;

          rr += cc[0]/gain-disx.x;
          gg += cc[1]/gain-disx.y;
          bb += cc[2]/gain-disx.z;
        }
        A[pos]=color(rr,gg,bb);
        stroke(A[pos]);
        if (disx.x<10){
        point(x,y);
        }
    }
  }
}

void mousePressed(){
 // background(0);
  Particle[] p = new Particle[pNum];
}

void mouseReleased(){
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
  //background(0);
  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(width),random(height),random(0.1,0.3));
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
    xpos += (mouseX-xpos)*del;
    ypos += (mouseY-ypos)*del;
  }
}

PVector distx(float a,float b,float c,float a2,float b2,float c2){
  float Q = abs(a-a2);
  float W = abs(b-b2);
  float E = abs(c-c2);
  PVector retval = new PVector (Q,W,E);
  return retval;
}


