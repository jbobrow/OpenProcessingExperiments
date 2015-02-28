
int w = 255;
int h = 255;


float xd;
float yd;
float xby;
float yby;
float xtot;
float ytot;
float dtot;
int pass;
PVector A;
PVector B;
PVector now;
void setup(){
  size(255,255);
  A= new PVector (w/2,h/2); 
  now = new PVector (w/2,h/2); 
  B = new PVector(random(w),random(h)); 
  smooth();
  background(-1);
  ellipse(B.x,B.y,10,10);
}

void draw(){
  if(mouseX != pmouseX && mouseY !=pmouseY && mousePressed){
    B = new PVector (mouseX,mouseY);
    //ellipse(B.x,B.y,10,10);
  }

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

stroke(1,111);
  point(now.x,now.y);
  if(dist(now.x,now.y,B.x,B.y)<2){
    //if(now.x>B.x-xby || now.y>B.y-yby && sign ){
if (mode==1)      A= new PVector(B.x,B.y);

      sign = true;
    B = new PVector(random(w),random(h)); 
     ecount ++;
   //if (ecount ==0) 
   ellipse(B.x,B.y,10,10);
    now =  new PVector (A.x,A.y);  
   

  }
  ecount = 0;
if (now.x<xby*2 || now.y<yby*2)sign = false;
}
int ecount;
int mode = 2;

void keyPressed(){
 if (key=='1')mode=1;
  if (key=='2')mode=2;
}
boolean sign = false;               
