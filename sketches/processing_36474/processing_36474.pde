
//3D Plane
float lx;
float ly;
int w = 255;
int h = 255;


boolean up = false;

PGraphics scene;

void setup(){
  size(765,450,P2D);
  scene = createGraphics(w,h,P2D);
  loadPixels();
  smooth(); 
  background(-1);
allw=width;
allh=height;
flip= createImage(w,h,ARGB);
}
int x ;
float y=0;
float xm;
float ym = h/2;
int allw;
int allh;
PImage flip;

void inv(PGraphics src){
 int check = src.pixels.length;
  for (int i = 0;i<src.pixels.length;i++){
  check--;
  flip.pixels[i]=src.pixels[check];
  }
  
  
}
void draw(){
  noStroke();
fill(255);
rect(0,0,allw,allh);
  float dis = (abs(x-x)+abs(h-y))/h; //faster
  if(up==true)y-=dis;
  if(up==false)y+=dis;

  if(y>h-2)up=true;
  if(y<0)up=false;
 // scene.loadPixels();
  scene.beginDraw();
  scene.stroke(1,211);
  scene.point(x,y);


  x++;
  if(x>w){
    x=0;
    firstrun = false; 
  }
  scene.endDraw();
//scene.updatePixels();
  //if(dist(0,0,x,y)<1)noLoop();
image(scene,0,0);
image(scene,w,0);
image(scene,w*2,0);
//inv(scene);
image(flip,0,h);
image(flip,w,h);
image(flip,w*2,h);
}
boolean firstrun = true;


