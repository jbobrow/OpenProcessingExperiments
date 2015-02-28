


int w = 255;
int h= 255;
float xm=w/2;
float ym = h/2;
PImage a;
PImage c;
void setup(){
 size(765,255);
//smooth();
background(255);
  now = A;
  a=createImage(w,h,ARGB);
  for (int x=0;x<w;x++){
   for (int y = 0;y<h;y++){
    float dis1 = abs(xm-x)+abs(ym-y);
   float dis2 = dist(xm,ym,x,y);
   if(dis2<100) a.set(x,y,color(w-x,y,h-y,dis2/20));//80
   } 
  }
 a.resize(125,125);
  imageMode(CENTER);
  mouseY=1;
    mouseX=int(xm);
}
float xby;
float yby;
float xd;
float yd;
PVector A=new PVector(-25,ym,0);
PVector B=new PVector (w+155,h+155,0);
PVector now = new PVector (0,0,0);
boolean fw = false;
boolean forward = true;
void draw(){
if(now.x>xm-2)fw=true;
//if(fw)
mouseX++;
    if(forward)mouseY++;
   if(!forward)mouseY--;
  if(mouseY>h)forward=false;
  if(mouseY<0)forward=true;

 xd = B.x-A.x;
  if (xd<0)xd=-xd;
  yd = B.y-A.y;
  if (yd<0)yd=-yd;
  float dtot = xd+yd;
  float xtot = A.x+B.x;
  float ytot = A.y+B.y;
 
  xby = xd/dtot;
  yby = yd/dtot;
  
    if (B.x>A.x && B.y > A.y){
    now.x+=xby;
    now.y+=yby;
  }
 
  if (B.x<A.x && B.y > A.y){
    now.x-=xby;
    now.y+=yby;
  }
  if (B.x<A.x && B.y < A.y){
    now.x-=xby;
    now.y-=yby;
  }
 
  if (B.x>A.x && B.y < A.y){
    now.x+=xby;
    now.y-=yby;
  }
 B=new PVector (mouseX,mouseY,0);
stroke(1,111);
image(a,now.x,now.y);
 if(dist(now.x,now.y,B.x,B.y)<2 || now.x>width+10){
  // pgsave(get(),"c:\\data\\mand2.png");
  background(255);
  setup();
 }
  //point(now.x,now.y);
  
}


void pgsave(PImage img,String where){
 PGraphics retval = createGraphics(img.width,img.height,P3D);
retval.loadPixels();
arraycopy(img.pixels,retval.pixels);
retval.updatePixels();
retval.save(where);
  
}
