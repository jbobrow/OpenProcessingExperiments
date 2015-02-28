
int w = 255;
int h = 255;

int len = 128;
PVector [] ccu=new PVector [len];
PVector []ccd=new PVector [len];
PVector []ccl=new PVector [len];
PVector []ccr=new PVector [len];

float mx = w/2;
float my=h/2;

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
 size(255,255,JAVA2D);
 A= new PVector (w/2,h/2);
 now = new PVector (w/2,h/2);
 B = new PVector(random(w),random(h));
 smooth();
 background(-1);
 ellipse(B.x,B.y,10,10);
  for (int i=0;i<len;i++){
   ccu[i]=new PVector (mx,my-i,0);
   ccd[i]=new PVector(mx,my+i,0);
   ccl[i]=new PVector (mx-i,my,0);
   ccr[i]=new PVector (mx+i,my,0);
 }
   for (int i = 0;i<4;i++){
   nowe[i] = new PVector(mx,my,0);
 }
}
PVector [] nowe = new PVector [4];
int marker = 0;
int kip=1;
 int [] check = {
 0,0,0,0};
 boolean [] flip = {
 true,true,true,true};

 int karl;
void draw(){
 karl++;
 if(karl>50){

   _w=int(random(w));
    _w_=int(random(w));
     _h=int(random(h));
    _h_=int(random(h));

  karl= 0;
 }
 // bounce(true,3,1,5);

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
   //B = new PVector(random(w),random(h));
   B=new PVector(nowe[marker].x, nowe[marker].y,0);
    ecount ++;
  //if (ecount ==0)
  ellipse(B.x,B.y,10,10);
   now =  new PVector (A.x,A.y);


 }
 ecount = 0;
if (now.x<xby*2 || now.y<yby*2)sign = false;

///

if(marker==0){
   if(check[0]>kip)flip[0]=!flip[0];
   // if(check[0]>126)flip[0]=!flip[0];
   //println(check[marker]);

   if(flip[0]==true){
     check[marker]++;
   }
   else


       if(flip[0]==false){
       check[marker]--;
     }
   nowe[marker].x= ccu[check[marker]].x;
   nowe[marker].y= ccu[check[marker]].y;
   fill(255,11);
   ellipsex( nowe[marker].x, nowe[marker].y,mouseX,mouseX);
   ellipsex( nowe[marker].x, h-nowe[marker].y,mouseX,mouseX);
   ellipsex(w- nowe[marker].y, my,mouseX,mouseX);
   ellipsex(nowe[marker].y, my,mouseX,mouseX);
   if( check[0]==0){
     flip[0]=!flip[0];
     kip+=15;
     if(kip>128)kip=1;
   }
 }

///
}
int ecount;
int mode = 2;

void keyPressed(){
 if (key=='1')mode=1;
 if (key=='2')mode=2;
}
boolean sign = false;


void ellipsex(float a,float b,float c,float d){
 rectMode(CENTER);

 //rect(a,b,c,d);
  ellipse(a,b,c,d);
}
