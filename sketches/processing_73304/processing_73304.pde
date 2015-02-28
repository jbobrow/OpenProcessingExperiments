
//Ashley Wong amwong
//Copyright Pittsburgh 2012

float h,k,u,v;
float dh,dk,du,dv;
float a,b,c,d,e;
float alphavalue;

void setup() {
  size(500,300);
  background(5);
  textSize(15);
  frameRate(55);
  d=random(width);
  c=frameCount;
  e=-10;
  dh=random(-5,5);
  dk=random(5);
  du=random(-5,5);
  dv=random(5);
}

void draw() {
  Fade();
  Digits();
  b=random(9);
  ChooseAlpha();
  
   makeDots(h,k);
  fallDots();
  makeLines(h,k,u,v);
}
void mousePressed() {
  h=pmouseX;
  k=pmouseY;
}
void mouseReleased() {
  u=mouseX;
  if(u>width){
    u=width;}
    else if(u<0){
      u=0;}
  v=mouseY;
  if(v>height){
    v=height;}
    else if(v<0){
      v=0;}
}
void makeDots(float x,float y) {
  point(x,y);
}
void fallDots() {
  h+=dh;
  k+=dk;
  u+=du;
  v+=dv;
  if(h>width||h<0){
    dh=-dh;
  }
  if(k>height||k<0){
    dk=-dk;
  }
  if(u>width||u<0){
    du=-du;
  }
  if(v>height||v<0){
    dv=-dv;
  }
}
void makeLines(float x,float y,float z, float w){
  stroke(random(150,255),10);
  strokeWeight(2);
  line(x,y,z,w);
}

void Digits() {
  fill(0,160,30,alphavalue);
  text((frameCount)%9,d,a);
  a+=7;
  if(a>(height-5)) {
    a=-7;
    d=random(width);
  }
  
}

void ChooseAlpha(){
  if(a>(a+2)){
    alphavalue=0;
  }
  else {
    alphavalue=255;
  }
}

void Fade() {
    noStroke();
    fill(5,10);
  if ((c/2)<1) {
    rect(0,0,width,a+20);
  }
  if (a<2){
    e+=5;
    rect(20,20,(d-10),e);
  }
}
