
// Shining Particle by harukit
// Created with Processing 68 alpha on September 11 , 2004
// http://www.harukit.com 


int pNum =1;
//Particle[] p = new Particle[pNum];
PVector [] karl;
PVector [] p = new PVector [pNum];
float rr,gg,bb,dis;
int gain = 5;
float[] cc = new float[3];
int w = 255;
int h =255;
void setup(){
  size(255,255,P2D);
  karl = new PVector [w*h];
  loadPixels();
  noStroke();
  a=createImage(w,h,ARGB);
 //background(0);
  for (int i = 0;i<w*h;i++){
   karl[i]=new PVector(0,0,0); 
  // a.pixels[i]=0;
  }
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
  for(int i=0;i<pNum;i++){
    p[i] = new PVector(random(w),random(h),random(0.1,0.3));
  }
  kl=createImage(space*2,space*2,ARGB);
//  imageMode(3);
}
int mx;
int my;
PImage kl;
int space = 65;
int pick = 0;
int centw=w/2;
int centh=h/2;
void draw(){
  mouseX=(int)random(w);
  mouseY=(int)random(h);
  for(int i=0;i<pNum;i++){
    update(p,i);
  }
  if(pick%5==0){
    for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
  }
  pick++;
  mx=mouseX;
  my=mouseY;
 // image(kl,mx,my);
  if (mouseX<space )mx=space;
  if(mouseX>w-space)mx=w-space;
  if(mouseY<space)my=space;
  if(mouseY>h-space)my=h-space;
  a.copy(get(),-1,-1,w+1,h+1,-1,-1,w+1,h+1);
//  kl.copy(g,mx-space,my-space,space*2,space*2,0,0,kl.width,kl.height);
  for(int y=my-space;y<my+space;y++){
    for(int x=mx-space;x<mx+space;x++){
        int pos=y*w+x;
        color col = a.pixels[pos];
       karl[pos].x = col >> 16 & 0xff;
     karl[pos].y= col >> 8 & 0xff;
        karl[pos].z = col  & 0xff;
        
        for(int i=0;i<pNum;i++){
          dis =dist(p[i].x,p[i].y,x,y)/2;
          karl[pos].x += cc[0]/gain-dis;
          karl[pos].y += cc[1]/gain-dis;
          karl[pos].z += cc[2]/gain-dis;
        }
        if(dis<space/4)a.pixels[pos]=color(karl[pos].x,karl[pos].y,karl[pos].z);
    }
  }
//  kl.blend(g,mx-space,my-space,kl.width,kl.height,0,0,kl.width,kl.height,ADD);
//  image(kl,mx,my);
image(a,0,0);
//image(a,0,-1);
}
PImage a;
void mousePressed(){
//  background(0);
  PVector [] p = new PVector[pNum];
}

void mouseReleased(){
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
 // background(0);
  for(int i=0;i<pNum;i++){
    p[i] = new PVector (random(w),random(h),random(0.1,0.3));
    //new Particle(random(width),random(height),random(0.1,0.3));
  }
}

//class Particle{
//  float xpos,ypos,del;
//  Particle(float x,float y,float d){
//    xpos=x;
//    ypos=y;
//    del = d;
//  }
float del = .2;
  void update(PVector [] src,int i){
    src[i].x += (mouseX-src[i].x)* src[i].z;
   src[i].y+= (mouseY-src[i].y)* src[i].z;
  }
//}
                                
