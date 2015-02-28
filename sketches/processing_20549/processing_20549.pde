
// Shining Particle by harukit
// Created with Processing 68 alpha on September 11 , 2004
// http://www.harukit.com 


int pNum =4;
Particle[] p = new Particle[pNum];
float rr,gg,bb,dis;
int gain = 5;
float[] cc = new float[3];

void setup(){
  size(100,100);
  noStroke();
  loadPixels();
  background(0);
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
  for(int i=0;i<pNum;i++){
    p[i] = new Particle(random(width),random(height),random(0.1,0.3));
  }
}
void draw(){
 loopx(); 
}
void loopx(){
  for(int i=0;i<pNum;i++){
    p[i].update();
  }
  for(int y=0;y<height;y+=1){
    for(int x=0;x<width;x+=1){
        int pos=y*width+x;
        color col = pixels[pos];
        rr = col >> 16 & 0xff;
        gg = col >> 8 & 0xff;
        bb = col  & 0xff;
        for(int i=0;i<pNum;i++){
          dis =dist(p[i].xpos,p[i].ypos,x,y);
          rr += cc[0]/dis-gain;
          gg += cc[1]/dis-gain;
          bb += cc[2]/dis-gain;
        }
       // stroke(rr,gg,bb);
       // i
       set(x,y,color(rr,gg,bb));
       // point(x,y);
       // pixels[pos]=color(rr,gg,bb);
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
 // background(0);
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

                
                
