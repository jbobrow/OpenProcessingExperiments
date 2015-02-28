
int w= 255;
int h =255;
int picnum = 4;

PImage blank;
void setup(){
 size(512,512,P2D); 
background(255);
 //smooth();

 rectMode(CENTER);
 ellipseMode(CENTER);
 noFill();
 for (int x=0;x<=255;x+=15){
  line(x,0,w-x,h);
  line(x,h,x,h*2);
  
 // ellipse(w/2,h/2,x,x);
  //line(0,x,w,h-x);
 } 
   for (int x=15;x<255;x+=15){
  //line(x,0,w-x,h);
  fill(1,(255-x)/3);
   rect(w/2,h/2,x,x);
  line(0,x,w,h-x);
  line(w,x,w*2,x);
  
 } 
 
// line(w+(15*3),(15*6),    w+(15*3),h-(15*6));
 // line(w+(15*8.75),(15*6)+15*2,  w+(15*8.75),h-(15*6)+15*2);
  fill(255,228);
  beginShape();
  vertexi(w+(15*3),(15*5));
  vertexi(w+(15*3),h-(15*5));
  vertexi( w+(15*8.75),h-(15*5)+15*2);
  vertexi(w+(15*8.75),(15*5)+15*2);
  endShape(CLOSE);
  
  flip(V);
  tip(V);
  
 //line(w*2-(15*3),(15*6),w*2-(15*3),h-(15*6));
 
}
void flip(PVector [] A){
  fill(255,228);
float offset1 = A[0].x-w;
float offset2 = abs(A[0].x-A[2].x);
 beginShape(); 
 
// vertex(w*2-offset1,A[0].y);
// vertex(w*2-offset1,A[1].y);
 vertex(A[0].x+offset2*2,A[0].y);
 vertex(A[1].x+offset2*2,A[1].y);
 vertex(A[2].x,A[2].y);
 vertex(A[3].x,A[3].y);
 endShape(CLOSE);
}
PVector []V = new PVector [4];
int  inc;
void vertexi(float a,float b){
  V[inc]=new PVector (a,b,0);
  vertex(a,b);
  
  inc++;
  if(inc>4)inc=0;
}

void tip(PVector [] A){
  float offset2 = abs(A[0].x-A[2].x);
  
  fill(255,228);
  beginShape();
  vertex(A[0].x,A[0].y);
  vertex(A[2].x,15*3);
  vertex(A[0].x+offset2*2,A[0].y);
  vertex(A[3].x,A[3].y);
  endShape(CLOSE);
  //ellipse(A[2].x,15*3,10,10);
  //line(
  
}
